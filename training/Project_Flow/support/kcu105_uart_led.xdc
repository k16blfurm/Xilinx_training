# Global Clock Constraints
create_clock -period 8 -name clk_pin_p [get_ports clk_pin_p]


# IO Timing Constraints
set_input_delay -clock [get_clocks clk_pin_p] 1.500 [get_ports {rst_pin rxd_pin btn_pin}]
set_input_delay -clock [get_clocks clk_pin_p] -min 1.00 [get_ports {rst_pin rxd_pin btn_pin}]
set_output_delay -clock [get_clocks clk_pin_p] 0.500 [get_ports led_pins*]
set_output_delay -clock [get_clocks clk_pin_p] -min -0.500 [get_ports led_pins*]


#Physical Constraints

set_property PACKAGE_PIN G10      [get_ports "clk_pin_p"] 
set_property IOSTANDARD  LVDS     [get_ports "clk_pin_p"] 
set_property PACKAGE_PIN F10      [get_ports "clk_pin_n"] 
set_property IOSTANDARD  LVDS     [get_ports "clk_pin_n"]


set_property PACKAGE_PIN AN8      [get_ports rst_pin]
set_property IOSTANDARD LVCMOS18  [get_ports rst_pin]
set_property PACKAGE_PIN AE10     [get_ports btn_pin]
set_property IOSTANDARD LVCMOS18  [get_ports rxd_pin]
set_property PACKAGE_PIN G25      [get_ports rxd_pin]
set_property IOSTANDARD LVCMOS18  [get_ports btn_pin]

set_property PACKAGE_PIN AP8      [get_ports "led_pins[0]"] 
set_property IOSTANDARD  LVCMOS18 [get_ports "led_pins[0]"]
set_property PACKAGE_PIN H23      [get_ports "led_pins[1]"] 
set_property IOSTANDARD  LVCMOS18 [get_ports "led_pins[1]"]
set_property PACKAGE_PIN P20      [get_ports "led_pins[2]"] 
set_property IOSTANDARD  LVCMOS18 [get_ports "led_pins[2]"]
set_property PACKAGE_PIN P21      [get_ports "led_pins[3]"] 
set_property IOSTANDARD  LVCMOS18 [get_ports "led_pins[3]"]
set_property PACKAGE_PIN N22      [get_ports "led_pins[4]"] 
set_property IOSTANDARD  LVCMOS18 [get_ports "led_pins[4]"]
set_property PACKAGE_PIN M22      [get_ports "led_pins[5]"] 
set_property IOSTANDARD  LVCMOS18 [get_ports "led_pins[5]"]
set_property PACKAGE_PIN R23      [get_ports "led_pins[6]"] 
set_property IOSTANDARD  LVCMOS18 [get_ports "led_pins[6]"] 
set_property PACKAGE_PIN P23      [get_ports "led_pins[7]"] 
set_property IOSTANDARD  LVCMOS18 [get_ports "led_pins[7]"] 



#<copyright-disclaimer-start>
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
#<copyright-disclaimer-end>
