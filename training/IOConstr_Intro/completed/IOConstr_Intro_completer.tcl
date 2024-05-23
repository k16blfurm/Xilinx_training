###########################################################################
## IO Constraints and Virtual Clock Completer Script
###########################################################################

# load the standard helper file
source -quiet ../../fpgaSupport_scripts/script1.tcl
source -quiet ../../fpgaSupport_scripts/script2.tcl

# project constants
set verbose 	1
set tcName 	IOConstr_Intro
set demoOrLab 	completed
set projName 	wave_gen

## *********** Step 1 : Copying the project ***********
proc copyProject {} {

variable platform
variable language
variable tcName
variable demoOrLab 
variable projName 
variable TRAINING_PATH

# Set variables for source and destination paths
set sourcePath $TRAINING_PATH/$tcName/lab/$platform
set destPath $TRAINING_PATH/$tcName/completed/$platform

# Create the destination directories if they don't exist
file mkdir $destPath

# Copy the zip file to the destination directory
file copy -force $sourcePath/$language.zip $destPath
puts "sourcePath: $sourcePath"
puts "destPath: $destPath"

exec unzip $TRAINING_PATH/$tcName/completed/$platform/$language.zip -d $TRAINING_PATH/$tcName/completed/$platform/$language
}
 ## *********** Step 2 : Opening a project, opening a synthesized design ***********

proc openProject {} {
variable platform
variable language
variable tcName
variable demoOrLab 
variable projName 
variable TRAINING_PATH

# Add the platform and language combination that you want 
set isLangNotSelected [string compare -nocase $language "undefined"]
set isPlatNotSelected [string compare -nocase $platform "undefined"]
   
if {$isLangNotSelected} {
      puts "Please type: use VHDL | Verilog | netlist"
      puts "   then rerun the projectCreate"
} 
if {$isPlatNotSelected} {
      puts "Please type: use KCU105 | KC705 | KC7xx"
      puts "   then rerun the projectCreate"
}

# Open a project
set projName.xpr {append $projName .xpr}
open_project $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.xpr

}


 ## *********** Step 3 :  Specifying Input delay ***********

proc addINconstr {} {
variable platform
variable language
variable tcName
variable demoOrLab 
variable projName
variable TRAINING_PATH

set projName.srcs {append $projName .srcs}
set_property target_constrs_file $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.srcs/constrs_1/imports/wave_gen_timing_IOConstr_Intro.xdc [current_fileset -constrset]

link_design -name netlist_1

# Adding the Input Constraints for either 7 series or Ultra-Scale board

if {$platform == "KCU105"} {

set_input_delay -clock [get_clocks clk_pin_p] 1.25 [get_ports rst_pin]
set_input_delay -clock [get_clocks clk_pin_p] -min 1.0 [get_ports rst_pin]

check_timing -verbose -override_defaults no_input_delay
get_property PERIOD [get_clocks clk_out2_clk_core]

create_clock -period 5.161 -name clk_tx_virtual -waveform {0.000 2.581}
set_input_delay -clock [get_clocks clk_tx_virtual] 1.25 [get_ports lb_sel_pin]
set_input_delay -clock [get_clocks clk_tx_virtual] -min 1.0 [get_ports lb_sel_pin]

create_clock -period 5.000 -name clk_rx_virtual -waveform {0.000 2.500}
set_input_delay -clock [get_clocks clk_rx_virtual] 1.25 [get_ports rxd_pin]
set_input_delay -clock [get_clocks clk_rx_virtual] -min 1.0 [get_ports rxd_pin]

} elseif {$platform == "KC7xx"} {

set_input_delay -clock [get_clocks clk_pin_p] 1.25 [get_ports rst_pin]
set_input_delay -clock [get_clocks clk_pin_p] -min 1.0 [get_ports rst_pin]

check_timing -verbose -override_defaults no_input_delay
get_property PERIOD [get_clocks clk_out2_clk_core]

create_clock -period 5.161 -name clk_tx_virtual -waveform {0.000 2.581}
set_input_delay -clock [get_clocks clk_tx_virtual] 1.25 [get_ports lb_sel_pin]
set_input_delay -clock [get_clocks clk_tx_virtual] -min 1.0 [get_ports lb_sel_pin]

set_input_delay -clock [get_clocks clk_pin_p] 1.25 [get_ports rxd_pin]
set_input_delay -clock [get_clocks clk_pin_p] -min 1.0 [get_ports rxd_pin]

}

save_constraints -force
check_timing -verbose -override_defaults no_input_delay
} 


 ## *********** Step 4 :  Specifying Output delay ***********
 
proc addOUTconstr {} {
variable platform
variable language
variable tcName
variable demoOrLab 
variable projName

# Adding the Output Constraints for either 7 series or Ultra-Scale board

if {$platform == "KCU105"} {

set_output_delay -clock [get_clocks clk_tx_virtual] 1.25 [get_ports {led_pins[0] led_pins[1] led_pins[2] led_pins[3] led_pins[4] led_pins[5] led_pins[6] led_pins[7] txd_pin}]
set_output_delay -clock [get_clocks clk_tx_virtual] -min 0.5 [get_ports {led_pins[0] led_pins[1] led_pins[2] led_pins[3] led_pins[4] led_pins[5] led_pins[6] led_pins[7] txd_pin}]
set_output_delay -clock [get_clocks spi_clk] -max 1.0 [get_ports {dac_clr_n_pin dac_cs_n_pin spi_mosi_pin}]
set_output_delay -clock [get_clocks spi_clk] -min -1.0 [get_ports {dac_clr_n_pin dac_cs_n_pin spi_mosi_pin}]
} elseif {$platform == "KC7xx"} {

set_output_delay -clock [get_clocks clk_tx_virtual] 1.25 [get_ports {led_pins[0] led_pins[1] led_pins[2] led_pins[3] led_pins[4] led_pins[5] led_pins[6] led_pins[7] txd_pin}]
set_output_delay -clock [get_clocks clk_tx_virtual] -min 0.5 [get_ports {led_pins[0] led_pins[1] led_pins[2] led_pins[3] led_pins[4] led_pins[5] led_pins[6] led_pins[7] txd_pin}]
set_output_delay -clock [get_clocks spi_clk] -max 1.0 [get_ports {dac_clr_n_pin dac_cs_n_pin spi_mosi_pin}]
set_output_delay -clock [get_clocks spi_clk] -min -1.0 [get_ports {dac_clr_n_pin dac_cs_n_pin spi_mosi_pin}]
}

save_constraints
check_timing -verbose -override_defaults no_output_delay
} 


 ## *********** Step 5 :  Implementing the design ***********

proc genReport {} {

# Calling the proc which runs implementation
implementationRun

report_timing -delay_type min_max -max_paths 10 -sort_by group -input_pins -name timing_1
}


 ## ********** Running only the steps that are required with Make **************

proc make {stopAt} {

   puts "Running until the step $stopAt"
   set limit [string tolower $stopAt]
   switch $limit {
      step1  { copyProject }
      step2  { make step1; openProject }
      step3  { make step2; addINconstr }
      step4  { make step3; addOUTconstr }
      step5  { make step4; genReport }
	  all    { make step5 }
      default { 
         puts "Call the make proc, Should be make step*" 
			  }	
	}	
}


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
