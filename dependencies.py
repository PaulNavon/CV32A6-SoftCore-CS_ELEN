#!/usr/bin/env python3

import os
import re
import sys

def find_dependencies(file_path, all_files):
    """Trouve les fichiers appelés dans le fichier donné."""
    dependencies = set()
    try:
        with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
            # Recherche des inclusions (ex: #include "file.h", import module)
            matches = re.findall(r'[#include|import|require][ ]*["\']([^"\']+)["\']', content)
            for match in matches:
                full_path = next((f for f in all_files if match in f), None)
                if full_path:
                    dependencies.add(full_path)
    except Exception as e:
        print(f"Erreur avec {file_path}: {e}")
    return dependencies

def build_dependency_tree(root_dir):
    """Construit un arbre des dépendances des fichiers dans root_dir."""
    all_files = {os.path.abspath(os.path.join(root, file)) for root, _, files in os.walk(root_dir) for file in files}
    
    tree = {}
    for file in all_files:
        tree[file] = find_dependencies(file, all_files)

    return tree

def print_tree(tree, file, level=0, visited=None):
    """Affiche l'arbre des dépendances de manière hiérarchique."""
    if visited is None:
        visited = set()
    if file in visited:
        return
    visited.add(file)
    
    print("  " * level + os.path.basename(file))
    for dep in tree.get(file, []):
        print_tree(tree, dep, level + 1, visited)

# 🔥 Exécution
root_directory = sys.argv[1] if len(sys.argv) > 1 else "./"
dependency_tree = build_dependency_tree(root_directory)

# Trouver les fichiers racines (ceux qui sont appelés mais n'appellent rien)
for file in dependency_tree:
    if any(file in deps for deps in dependency_tree.values()):
        continue  # Ignore les fichiers dépendants d'autres
    print_tree(dependency_tree, file)
