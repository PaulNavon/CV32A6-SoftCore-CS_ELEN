# Copyright (c) 2020 Thales.
#
# Copyright and related rights are licensed under the Solderpad
# License, Version 2.0 (the "License"); you may not use this file except in
# compliance with the License.  You may obtain a copy of the License at
# http://solderpad.org/licenses/SHL-2.0/ Unless required by applicable law
# or agreed to in writing, software, hardware and materials distributed under
# this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
#
# Author:         Sebastien Jacq - sjthales on github.com

#
# Additional contributions by:
#
#
# script Name:    run_cva6_ooc
# Project Name:   CVA6 softcore
# Language:       tcl
#
# Description:    Script to synthesize/place and route CVA6 architecture
#                 in out of context mode
#
# =========================================================================== #
# Revisions  :
# Date        Version  Author       Description
# 2020-10-06  0.1      S.Jacq       Created
# =========================================================================== #
set project cva6_ooc

create_project $project . -force -part $::env(XILINX_PART)
set_property board_part $::env(XILINX_BOARD) [current_project]

# set number of threads to 8 (maximum, unfortunately)
set_param general.maxThreads 8

set_msg_config -id {[Synth 8-5858]} -new_severity "info"
set_msg_config -id {[Synth 8-4480]} -limit 1000

set_property include_dirs { \
    "src/axi_sd_bridge/include" \
    "../../vendor/pulp-platform/common_cells/include" \
    "../../vendor/pulp-platform/axi/include" \
    "../../core/cache_subsystem/hpdcache/rtl/include" \
    "../register_interface/include" \
} [current_fileset]

source scripts/add_sources.tcl

set_property top cva6 [current_fileset]

read_verilog -sv {src/zybo-z7-20.svh ../../vendor/pulp-platform/common_cells/include/common_cells/registers.svh}
set file "src/zybo-z7-20.svh"
set registers "../../vendor/pulp-platform/common_cells/include/common_cells/registers.svh"

set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file" "$registers"]]
set_property -dict { file_type {Verilog Header} is_global_include 1} -objects $file_obj

update_compile_order -fileset sources_1

###############################################################################################################################

# Synth Design Optimizations
set_property -name {STEPS.SYNTH_DESIGN.ARGS.MORE OPTIONS}              -value {-mode out_of_context} -objects [get_runs synth_1]
set_property -name {STEPS.SYNTH_DESIGN.ARGS.FLATTEN_HIERARCHY}         -value {rebuilt} -objects [get_runs synth_1]
set_property -name {STEPS.SYNTH_DESIGN.ARGS.GATED_CLOCK_CONVERSION}    -value {auto} -objects [get_runs synth_1]
set_property -name {STEPS.SYNTH_DESIGN.ARGS.BUFG}                      -value {24} -objects [get_runs synth_1]
set_property -name {STEPS.SYNTH_DESIGN.ARGS.DIRECTIVE}                 -value {RuntimeOptimized} -objects [get_runs synth_1]
set_property -name {STEPS.SYNTH_DESIGN.ARGS.GLOBAL_RETIMING}           -value {on} -objects [get_runs synth_1]
set_property -name {STEPS.SYNTH_DESIGN.ARGS.FSM_EXTRACTION}            -value {one_hot} -objects [get_runs synth_1]
set_property -name {STEPS.SYNTH_DESIGN.ARGS.KEEP_EQUIVALENT_REGISTERS} -value {on} -objects [get_runs synth_1]
set_property -name {STEPS.SYNTH_DESIGN.ARGS.RESOURCE_SHARING}          -value {off} -objects [get_runs synth_1]
set_property -name {STEPS.SYNTH_DESIGN.ARGS.NO_LC}                     -value {on} -objects [get_runs synth_1]
set_property -name {STEPS.SYNTH_DESIGN.ARGS.NO_SRLEXTRACT}             -value {on} -objects [get_runs synth_1]
set_property -name {STEPS.SYNTH_DESIGN.ARGS.SHREG_MIN_SIZE}            -value {30} -objects [get_runs synth_1]
set_property -name {STEPS.SYNTH_DESIGN.ARGS.MAX_BRAM}                  -value {-1} -objects [get_runs synth_1]
set_property -name {STEPS.SYNTH_DESIGN.ARGS.MAX_URAM}                  -value {-1} -objects [get_runs synth_1]
set_property -name {STEPS.SYNTH_DESIGN.ARGS.MAX_DSP}                   -value {-1} -objects [get_runs synth_1]
set_property -name {STEPS.SYNTH_DESIGN.ARGS.CASCADE_DSP}               -value {tree} -objects [get_runs synth_1]

#set_property -name {STEPS.OPT_DESIGN.ARGS.MORE OPTIONS} -value {-carry_remap -bufg_opt} -objects [get_runs impl_1]

# Repositionne les registres dans le design pour équilibrer les délais de propagation entre les étapes de pipeline
set_property STEPS.SYNTH_DESIGN.ARGS.RETIMING true [get_runs synth_1]

# Optimisez les registres de contrôle pour améliorer la performance des chemins critiques
set_property STEPS.SYNTH_DESIGN.ARGS.CONTROL_SET_OPT_THRESHOLD 128 [get_runs synth_1]

set_property STEPS.SYNTH_DESIGN.ARGS.INCREMENTAL_MODE aggressive [get_runs synth_1]


launch_runs synth_1
wait_on_run synth_1
open_run synth_1

###############################################################################################################################

exec mkdir -p reports_cva6_ooc_synth/
exec rm -rf reports_cva6_ooc_synth/*

check_timing -verbose -file reports_cva6_ooc_synth/$project.check_timing.rpt
report_timing -max_paths 100 -nworst 100 -delay_type max -sort_by slack -file reports_cva6_ooc_synth/$project.timing_WORST_100.rpt
report_timing -nworst 1 -delay_type max -sort_by group -file reports_cva6_ooc_synth/$project.timing.rpt
report_utilization -hierarchical -file reports_cva6_ooc_synth/$project.utilization.rpt
report_cdc -file reports_cva6_ooc_synth/$project.cdc.rpt
report_clock_interaction -file reports_cva6_ooc_synth/$project.clock_interaction.rpt


###############################################################################################################################

## Implementation Optimizations
# Opt Design
set_property STEPS.OPT_DESIGN.IS_ENABLED true [get_runs impl_1]
set_property STEPS.OPT_DESIGN.ARGS.VERBOSE true [get_runs impl_1]
set_property STEPS.OPT_DESIGN.ARGS.DIRECTIVE Explore [get_runs impl_1]

#set_property -name {STEPS.OPT_DESIGN.ARGS.MORE_OPTIONS} -value {-retarget -propconst -sweep -muxf_remap -carry_remap -control_set_merge -merge_equivalent_drivers -bufg_opt -shift_register_opt -mbufg_opt -dsp_register_opt -hier_fanout_limit 64 -control_set_opt -remap -resynth_remap} -objects [get_runs impl_1]

# Désactiver les options liées à l'optimisation de l'aire (on favorise la fréquence)
#set_property -name {STEPS.OPT_DESIGN.ARGS.MORE_OPTIONS} -value {-resynth_area false -resynth_seq_area false -bram_power_opt false} -objects [get_runs impl_1]


#set_property STEPS.OPT_DESIGN.ARGS.RETARGET true [get_runs impl_1]
#set_property STEPS.OPT_DESIGN.ARGS.PROPCONST true [get_runs impl_1]
#set_property STEPS.OPT_DESIGN.ARGS.SWEEP true [get_runs impl_1]
#set_property STEPS.OPT_DESIGN.ARGS.MUXF_REMAP true [get_runs impl_1]
#set_property STEPS.OPT_DESIGN.ARGS.CARRY_REMAP true [get_runs impl_1]
#set_property STEPS.OPT_DESIGN.ARGS.CONTROL_SET_MERGE true [get_runs impl_1]
#set_property STEPS.OPT_DESIGN.ARGS.MERGE_EQUIVALENT_DRIVERS true [get_runs impl_1]
#set_property STEPS.OPT_DESIGN.ARGS.BUFG_OPT true [get_runs impl_1]
#set_property STEPS.OPT_DESIGN.ARGS.SHIFT_REGISTER_OPT true [get_runs impl_1]
#set_property STEPS.OPT_DESIGN.ARGS.MBUFG_OPT true [get_runs impl_1]
#set_property STEPS.OPT_DESIGN.ARGS.DSP_REGISTER_OPT true [get_runs impl_1]
#set_property STEPS.OPT_DESIGN.ARGS.HIER_FANOUT_LIMIT 64 [get_runs impl_1]
#set_property STEPS.OPT_DESIGN.ARGS.CONTROL_SET_OPT true [get_runs impl_1]
#set_property STEPS.OPT_DESIGN.ARGS.REMAP true [get_runs impl_1]
#set_property STEPS.OPT_DESIGN.ARGS.RESYNTH_REMAP true [get_runs impl_1]

## Désactiver les options liées à l'optimisation de l'aire (on favorise la fréquence)
#set_property STEPS.OPT_DESIGN.ARGS.RESYNTH_AREA false [get_runs impl_1]
#set_property STEPS.OPT_DESIGN.ARGS.RESYNTH_SEQ_AREA false [get_runs impl_1]
#set_property STEPS.OPT_DESIGN.ARGS.BRAM_POWER_OPT false [get_runs impl_1]


# Power Opt Design
set_property STEPS.POWER_OPT_DESIGN.IS_ENABLED false [get_runs impl_1]
#set_property STEPS.POWER_OPT_DESIGN.ARGS.MORE_OPTIONS {} [get_runs impl_1]

# Place Design
set_property STEPS.PLACE_DESIGN.ARGS.DIRECTIVE ExtraTimingOpt [get_runs impl_1]
#set_property STEPS.PLACE_DESIGN.ARGS.MORE_OPTIONS {-timing_driven -ultrathreads} [get_runs impl_1]

# Post-Place Power Opt design
set_property STEPS.POST_PLACE_POWER_OPT_DESIGN.IS_ENABLED false [get_runs impl_1]
#set_property STEPS.POST_PLACE_POWER_OPT_DESIGN.ARGS.MORE_OPTIONS {} [get_runs impl_1]

# Post-Place Phys Opt Design
set_property STEPS.PHYS_OPT_DESIGN.IS_ENABLED true [get_runs impl_1]
set_property STEPS.PHYS_OPT_DESIGN.ARGS.DIRECTIVE AggressiveExplore [get_runs impl_1]
#set_property STEPS.PHYS_OPT_DESIGN.ARGS.MORE_OPTIONS {-fanout_opt -placement_opt -critical_cell_opt -rewire -retime} [get_runs impl_1]

# Route Design
set_property STEPS.ROUTE_DESIGN.ARGS.DIRECTIVE AggressiveExplore [get_runs impl_1]
#set_property STEPS.ROUTE_DESIGN.ARGS.MORE_OPTIONS {-timing_driven -ultrathreads} [get_runs impl_1]

# Post-Route Phys Opt Design
set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.IS_ENABLED true [get_runs impl_1]
set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.ARGS.DIRECTIVE AggressiveExplore [get_runs impl_1]
#set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.ARGS.MORE_OPTIONS {-critical_cell_opt -rewire -hold_fix -retime} [get_runs impl_1]

# Write Bitsream
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
set_property STEPS.WRITE_BITSTREAM.ARGS.VERBOSE true [get_runs impl_1]
#set_property STEPS.WRITE_BITSTREAM.ARGS.MORE_OPTIONS {-g Compress} [get_runs impl_1]

# Set max fanout to a specific value
#set_max_fanout -hierarchical -max_fanout 10 [get_nets *]

# Contraintes de timing agressives
#create_clock -period 6 -name virtual_clock
set_max_delay 8 -from [all_inputs] -to [all_outputs]
#set_max_delay 6 -from [get_ports] -to [get_ports]


# Signals routing with max agressivity
#set_property ROUTE_QUALITY 10 [get_runs impl_1]

create_clock -period $::env(CLK_PERIOD_NS) -name clk_i [get_ports clk_i]

launch_runs impl_1
wait_on_run impl_1

###############################################################################################################################

# reports
exec mkdir -p reports_cva6_ooc_impl/
exec rm -rf reports_cva6_ooc_impl/*
check_timing -file reports_cva6_ooc_impl/${project}.check_timing.rpt
report_timing -max_paths 100 -nworst 100 -delay_type max -sort_by slack -file reports_cva6_ooc_impl/${project}.timing_WORST_100.rpt
report_timing -nworst 1 -delay_type max -sort_by group -file reports_cva6_ooc_impl/${project}.timing.rpt
report_utilization -hierarchical -file reports_cva6_ooc_impl/${project}.utilization.rpt
