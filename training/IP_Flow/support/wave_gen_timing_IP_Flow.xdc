# Global timing constraints
create_clock -period 3.333 -name clk_pin_p -waveform {0 1.666} [get_ports clk_pin_p]
set clk_rx [get_clocks -of [get_nets clk_rx] ]
set clk_tx [get_clocks -of [get_nets clk_tx] ]
create_generated_clock -name spi_clk -source [get_pins dac_spi_i0/out_ddr_flop_spi_clk_i0/ODDR_inst/CLKDIV] -multiply_by 1 -invert [get_ports spi_clk_pin]

create_clock -period 5.000 -name clk_virtual -waveform {0.000 2.500}
set_input_delay -clock clk_virtual 0.8 [get_ports {lb_sel_pin rst_pin rxd_pin}]
set_input_delay -clock clk_virtual -min 0.500 [get_ports {lb_sel_pin rst_pin rxd_pin}]
set_output_delay -clock clk_virtual 1.25 [get_ports {txd_pin {led_pins[*]}}]
set_output_delay -clock clk_virtual -min 0.5 [get_ports {txd_pin {led_pins[*]}}]
set_output_delay -clock [get_clocks spi_clk] -max 1.000 [get_ports {spi_mosi_pin dac_cs_n_pin dac_clr_n_pin}]
set_output_delay -clock [get_clocks spi_clk] -min 0.2 [get_ports {spi_mosi_pin dac_cs_n_pin dac_clr_n_pin}]

# Path specific timing constraints

set_false_path -rise_from $clk_tx -through [get_ports spi_clk_pin] -fall_to [get_clocks clk_pin_p]
set_false_path -fall_from $clk_tx -through [get_ports spi_clk_pin] -rise_to [get_clocks clk_pin_p]

set_multicycle_path -from [get_cells {cmd_parse_i0/send_resp_data_reg[*]}] -to [get_cells {resp_gen_i0/to_bcd_i0/bcd_out_reg[*]}] 2
set_multicycle_path -from [get_cells {cmd_parse_i0/send_resp_data_reg[*]}] -to [get_cells {resp_gen_i0/to_bcd_i0/bcd_out_reg[*]}] -hold 1

set_multicycle_path -from [get_cells "uart_rx_i0/uart_rx_ctl_i0/*" -filter {IS_SEQUENTIAL == 1}] -to [get_cells "uart_rx_i0/uart_rx_ctl_i0/*" -filter {IS_SEQUENTIAL == 1}] 108 
set_multicycle_path -from [get_cells "uart_rx_i0/uart_rx_ctl_i0/*" -filter {IS_SEQUENTIAL == 1}] -to [get_cells "uart_rx_i0/uart_rx_ctl_i0/*" -filter {IS_SEQUENTIAL == 1}] -hold 107 

set_multicycle_path -from [get_cells "uart_tx_i0/uart_tx_ctl_i0/*" -filter {IS_SEQUENTIAL == 1}] -to [get_cells "uart_tx_i0/uart_tx_ctl_i0/*" -filter {IS_SEQUENTIAL == 1}] 108 
set_multicycle_path -from [get_cells "uart_tx_i0/uart_tx_ctl_i0/*" -filter {IS_SEQUENTIAL == 1}] -to [get_cells "uart_tx_i0/uart_tx_ctl_i0/*" -filter {IS_SEQUENTIAL == 1}] -hold 107 

create_generated_clock -name clk_samp -source [get_pins {clk_gen_i0/BUFGCE_clk_samp_i0/I}] -divide_by 32 [get_pins {clk_gen_i0/BUFGCE_clk_samp_i0/O}]

set_max_delay -from clkx_nsamp_i0/meta_harden_bus_new_i0/signal_meta_reg            -to clkx_nsamp_i0/meta_harden_bus_new_i0/signal_dst_reg 2 
set_max_delay -from clkx_pre_i0/meta_harden_bus_new_i0/signal_meta_reg              -to clkx_pre_i0/meta_harden_bus_new_i0/signal_dst_reg 2 
set_max_delay -from clkx_spd_i0/meta_harden_bus_new_i0/signal_meta_reg              -to clkx_spd_i0/meta_harden_bus_new_i0/signal_dst_reg 2 
set_max_delay -from lb_ctl_i0/debouncer_i0/meta_harden_signal_in_i0/signal_meta_reg -to lb_ctl_i0/debouncer_i0/meta_harden_signal_in_i0/signal_dst_reg 2 
set_max_delay -from samp_gen_i0/meta_harden_samp_gen_go_i0/signal_meta_reg          -to samp_gen_i0/meta_harden_samp_gen_go_i0/signal_dst_reg 2 
set_max_delay -from uart_rx_i0/meta_harden_rxd_i0/signal_meta_reg                   -to uart_rx_i0/meta_harden_rxd_i0/signal_dst_reg 2 

set_max_delay -from rst_gen_i0/reset_bridge_clk_rx_i0/rst_meta_reg                  -to rst_gen_i0/reset_bridge_clk_rx_i0/rst_dst_reg 2 
set_max_delay -from rst_gen_i0/reset_bridge_clk_tx_i0/rst_meta_reg                  -to rst_gen_i0/reset_bridge_clk_tx_i0/rst_dst_reg 2 
set_max_delay -from rst_gen_i0/reset_bridge_clk_samp_i0/rst_meta_reg                -to rst_gen_i0/reset_bridge_clk_samp_i0/rst_dst_reg 2 

set_false_path -from [get_ports rst_pin]

# The below constraint is added to resolve timing issues in Vivado 2016.3. The Vivado Placer places MMCM and BUGGCE very far that causes large routing delay and timing failure. This constraint places BUFGCE_clk_samp_i0 in X2Y0 clock region i.e., near to MMCM. 
set_property CLOCK_REGION X2Y0 [get_cells clk_gen_i0/BUFGCE_clk_samp_i0]
set_max_delay 5 -from [get_clocks -of [get_nets clk_rx] ] -to [get_clocks -of [get_nets clk_tx] ] -datapath_only

#<copyright-disclaimer-start>
#  **************************************************************************************************************
#  * © 2023 Advanced Micro Devices, Inc. All rights reserved.                                                   *
#  * DISCLAIMER                                                                                                 *
#  * The information contained herein is for informational purposes only, and is subject to change              *
#  * without notice. While every precaution has been taken in the preparation of this document, it              *
#  * may contain technical inaccuracies, omissions and typographical errors, and AMD is under no                *
#  * obligation to update or otherwise correct this information.  Advanced Micro Devices, Inc. makes            *
#  * no representations or warranties with respect to the accuracy or completeness of the contents of           *
#  * this document, and assumes no liability of any kind, including the implied warranties of noninfringement,  *
#  * merchantability or fitness for particular purposes, with respect to the operation or use of AMD            *
#  * hardware, software or other products described herein.  No license, including implied or                   *
#  * arising by estoppel, to any intellectual property rights is granted by this document.  Terms and           *
#  * limitations applicable to the purchase or use of AMD’s products are as set forth in a signed agreement     *
#  * between the parties or in AMD's Standard Terms and Conditions of Sale. GD-18                               *
#  *                                                                                                            *
#  **************************************************************************************************************
#<copyright-disclaimer-end>
