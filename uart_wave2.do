onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TX/CLK
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TX/RST
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TX/TXCLK
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_RX/RXCLK
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/iRCLK
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/iBAUDOUTN
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/iRST
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/iBaudtick16x
add wave -noupdate -expand /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/iBaudgenDiv
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/iDLM
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/iDLL
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/PWDATA(4)
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/i_axi2apb_64_32_uart/W_word_sel
add wave -noupdate {/ariane_tb/dut/i_ariane_peripherals/i_axi2apb_64_32_uart/WDATA[0][4]}
add wave -noupdate {/ariane_tb/dut/i_ariane_peripherals/i_axi2apb_64_32_uart/WDATA_i[0][4]}
add wave -noupdate {/ariane_tb/dut/i_ariane_peripherals/i_axi2apb_64_32_uart/WDATA_i[1][4]}
add wave -noupdate {/ariane_tb/dut/i_ariane_peripherals/i_axi2apb_64_32_uart/WDATA_i[2][4]}
add wave -noupdate {/ariane_tb/dut/i_ariane_peripherals/i_axi2apb_64_32_uart/WDATA_i[3][4]}
add wave -noupdate {/ariane_tb/dut/i_ariane_peripherals/i_axi2apb_64_32_uart/WDATA_i[4][4]}
add wave -noupdate {/ariane_tb/dut/i_ariane_peripherals/i_axi2apb_64_32_uart/WDATA_i[5][4]}
add wave -noupdate {/ariane_tb/dut/i_ariane_peripherals/i_axi2apb_64_32_uart/WDATA_i[6][4]}
add wave -noupdate {/ariane_tb/dut/i_ariane_peripherals/i_axi2apb_64_32_uart/WDATA_i[7][4]}
add wave -noupdate {/ariane_tb/dut/i_axi_xbar/mst_ports[5]/w_data[4]}
add wave -noupdate {/ariane_tb/dut/i_axi_xbar/i_xbar/gen_mst_port_mux[5]/i_axi_mux/gen_mux/gen_id_prepend[0]/i_id_prepend/mst_w_chans_o[0].data[4]}
add wave -noupdate {/ariane_tb/dut/i_axi_xbar/i_xbar/gen_mst_port_mux[5]/i_axi_mux/gen_mux/gen_id_prepend[1]/i_id_prepend/mst_w_chans_o[0].data[4]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_adapter/axi_req_o.w.data[4]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_adapter/i_axi_shim/wr_data_i[1][4]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_adapter/i_axi_shim/wr_data_i[0][4]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_adapter/i_dcache_data_fifo/data_o.data[4]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_adapter/i_dcache_data_fifo/gen_fpga_queue/fifo_ram/RdData_DO[67]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_adapter/i_dcache_data_fifo/gen_fpga_queue/fifo_ram/RdData_DO[59]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_adapter/i_dcache_data_fifo/gen_fpga_queue/fifo_ram/RdData_DO[51]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_adapter/i_dcache_data_fifo/gen_fpga_queue/fifo_ram/RdData_DO[43]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_adapter/i_dcache_data_fifo/gen_fpga_queue/fifo_ram/WrData_DI[67]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_adapter/i_dcache_data_fifo/gen_fpga_queue/fifo_ram/WrData_DI[59]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_adapter/i_dcache_data_fifo/gen_fpga_queue/fifo_ram/WrData_DI[51]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_adapter/i_dcache_data_fifo/gen_fpga_queue/fifo_ram/WrData_DI[43]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_wt_dcache/i_wt_dcache_missunit/miss_wdata_i[3][4]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_wt_dcache/i_wt_dcache_missunit/miss_wdata_i[2][4]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_wt_dcache/i_wt_dcache_missunit/miss_wdata_i[1][4]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_wt_dcache/i_wt_dcache_missunit/miss_wdata_i[0][4]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_wt_dcache/i_wt_dcache_wbuffer/i_dirty_rr/data_i[0].data[4]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/i_store_unit/req_port_o.data_wdata[4]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/lsu_bypass_i/lsu_ctrl_o.data[4]}
add wave -noupdate {/ariane_tb/dut/i_ariane/i_cva6/ex_stage_i/lsu_i/lsu_bypass_i/lsu_req_i.data[4]}
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/iDLLWrite
add wave -noupdate /ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_wt_dcache/i_wt_dcache_wbuffer/i_dirty_rr/idx_o
add wave -noupdate /ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_wt_dcache/i_wt_dcache_wbuffer/i_dirty_rr/rr_i
add wave -noupdate -expand /ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_wt_dcache/i_wt_dcache_wbuffer/i_dirty_rr/req_i
add wave -noupdate /ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_wt_dcache/i_wt_dcache_wbuffer/i_dirty_rr/gnt_i
add wave -noupdate /ariane_tb/dut/i_ariane/i_cva6/gen_cache_wt/i_cache_subsystem/i_wt_dcache/i_wt_dcache_wbuffer/i_dirty_rr/flush_i
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TX/TXSTART
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TX/CLEAR
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TX/WLS
add wave -noupdate -radix ascii /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TX/DIN
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TX/TXFINISHED
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TX/SOUT
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TX/CState
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TX/NState
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TX/iTx2
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TX/iSout
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TX/iParity
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TX/iFinished
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_BG16/CLK
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_BG16/RST
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_BG16/DIVIDER
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_BG16/BAUDTICK
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_BG16/iCounter
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/iTXEnable
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/iTXFIFOEmpty
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TXFF/iRDAddr
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TXFF/iWRAddr
add wave -noupdate /ariane_tb/dut/i_ariane_peripherals/gen_uart/i_apb_uart/UART_TX/CState
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {63950 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 268
configure wave -valuecolwidth 40
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
WaveRestoreZoom {63555 ns} {64322 ns}
