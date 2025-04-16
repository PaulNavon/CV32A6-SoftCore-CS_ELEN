onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_wt_dcache/clk_i
add wave -noupdate /ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_wt_dcache/rst_ni
add wave -noupdate -expand {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_wt_dcache/gen_rd_ports[1]/i_wt_dcache_ctrl/req_port_o}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_wt_dcache/gen_rd_ports[1]/i_wt_dcache_ctrl/state_q}
add wave -noupdate -expand {/ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/dcache_req_ports_i[1]}
add wave -noupdate -expand {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_wt_dcache/gen_rd_ports[1]/i_wt_dcache_ctrl/req_port_i}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_wt_dcache/gen_rd_ports[1]/i_wt_dcache_ctrl/id_q}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_wt_dcache/gen_rd_ports[1]/i_wt_dcache_ctrl/id_d}
add wave -noupdate /ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/i_load_unit/ldbuf_empty
add wave -noupdate /ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/i_load_unit/ldbuf_free_index_multi_gen/lzc_windex_i/empty_o
add wave -noupdate /ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/i_load_unit/ldbuf_full
add wave -noupdate /ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/i_load_unit/ldbuf_free_index_multi_gen/lzc_windex_i/cnt_o
add wave -noupdate /ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/i_load_unit/ldbuf_windex
add wave -noupdate /ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/i_load_unit/ldbuf_free_index
add wave -noupdate -radix binary /ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/i_load_unit/ldbuf_free_index_multi_gen/lzc_windex_i/in_i
add wave -noupdate -radix binary /ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/i_load_unit/ldbuf_valid_d
add wave -noupdate -radix binary -childformat {{{/ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/i_load_unit/ldbuf_valid_q[1]} -radix binary} {{/ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/i_load_unit/ldbuf_valid_q[0]} -radix binary}} -subitemconfig {{/ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/i_load_unit/ldbuf_valid_q[1]} {-radix binary} {/ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/i_load_unit/ldbuf_valid_q[0]} {-radix binary}} /ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/i_load_unit/ldbuf_valid_q
add wave -noupdate -radix binary /ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/i_load_unit/ldbuf_flushed_d
add wave -noupdate -radix binary /ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/i_load_unit/ldbuf_flushed_q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {93804 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 308
configure wave -valuecolwidth 129
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {93651 ns} {94145 ns}
