set_property IOSTANDARD LVCMOS18 [get_ports {led_pins[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led_pins[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led_pins[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led_pins[3]}]
set_property DRIVE 12 [get_ports {led_pins[0]}]
set_property DRIVE 12 [get_ports {led_pins[1]}]
set_property DRIVE 12 [get_ports {led_pins[2]}]
set_property DRIVE 12 [get_ports {led_pins[3]}]
set_property SLEW SLOW [get_ports {led_pins[0]}]
set_property SLEW SLOW [get_ports {led_pins[1]}]
set_property SLEW SLOW [get_ports {led_pins[2]}]
set_property SLEW SLOW [get_ports {led_pins[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led_pins[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led_pins[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led_pins[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led_pins[7]}]
set_property DRIVE 12 [get_ports {led_pins[4]}]
set_property DRIVE 12 [get_ports {led_pins[5]}]
set_property DRIVE 12 [get_ports {led_pins[6]}]
set_property DRIVE 12 [get_ports {led_pins[7]}]
set_property SLEW SLOW [get_ports {led_pins[4]}]
set_property SLEW SLOW [get_ports {led_pins[5]}]
set_property SLEW SLOW [get_ports {led_pins[6]}]
set_property SLEW SLOW [get_ports {led_pins[7]}]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports clk_pin_p]
set_property IOSTANDARD LVCMOS18 [get_ports dac_clr_n_pin]
set_property IOSTANDARD LVCMOS18 [get_ports dac_cs_n_pin]
set_property IOSTANDARD LVCMOS12 [get_ports lb_sel_pin]
set_property IOSTANDARD LVCMOS18 [get_ports rst_pin]
set_property IOSTANDARD LVCMOS18 [get_ports rxd_pin]
set_property IOSTANDARD LVCMOS18 [get_ports spi_clk_pin]
set_property IOSTANDARD LVCMOS18 [get_ports spi_mosi_pin]
set_property IOSTANDARD LVCMOS18 [get_ports txd_pin]
  set_property LOC AK17 [get_ports clk_pin_p]
  set_property LOC AB34 [get_ports dac_clr_n_pin]
  set_property LOC AA34 [get_ports dac_cs_n_pin]
  set_property LOC AN16 [get_ports lb_sel_pin]
set_property LOC AP8 [get_ports {led_pins[0]}]
set_property LOC H23 [get_ports {led_pins[1]}]
set_property LOC P20 [get_ports {led_pins[2]}]
set_property LOC P21 [get_ports {led_pins[3]}]
set_property LOC N22 [get_ports {led_pins[4]}]
set_property LOC M22 [get_ports {led_pins[5]}]
set_property LOC R23 [get_ports {led_pins[6]}]
  set_property LOC P23 [get_ports {led_pins[7]}]
  set_property LOC AN8 [get_ports rst_pin]
  set_property LOC K26 [get_ports rxd_pin]
  set_property LOC AB29 [get_ports spi_clk_pin]
  set_property LOC AA29 [get_ports spi_mosi_pin]
set_property LOC G25 [get_ports txd_pin]
set_property IOB TRUE [all_fanin -only_cells -startpoints_only -flat [all_outputs]]


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
