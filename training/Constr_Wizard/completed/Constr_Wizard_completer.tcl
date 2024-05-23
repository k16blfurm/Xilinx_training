###########################################################################
## Timing Constraints Wizard Completer Script
###########################################################################

# load the standard helper file
source -quiet ../../fpgaSupport_scripts/script1.tcl
source -quiet ../../fpgaSupport_scripts/script2.tcl

# project constants
set verbose 	1
set tcName 	Constr_Wizard
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
 ## *********** Step 2 : Opening a project, opening a synthesized design and performing the report_timing_summary ***********

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
      puts "Please type: use VHDL | Verilog"
      puts "   then rerun the projectCreate"
} 
if {$isPlatNotSelected} {
      puts "Please type: use KCU105 | KC705 | KC7xx"
      puts "   then rerun the projectCreate"
}

# Open a project
set projName.xpr {append $projName .xpr}
open_project $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.xpr

# Open synthesized design
synthesisRun

report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -name timing_1
}


 ## ********** Step 3 : Adding constraints for Ultra-Scale **************
 ## ********** Step 4 : Adding constraints for 7 Series **************	

proc addConstr {} {

variable platform
variable language
variable tcName
variable demoOrLab 
variable projName
variable TRAINING_PATH

set projName.srcs {append $projName .srcs}
set_property target_constrs_file $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.srcs/constrs_1/imports/wave_gen_timing_Constr_Wizard.xdc [current_fileset -constrset]

# Adding the Constraints for either 7 series or Ultra-Scale board

if {$platform == "KCU105"} {
create_clock -period 3.333 -name clk_pin_p -waveform {0.000 1.667} [get_ports clk_pin_p]
create_clock -period 4.999 -name VIRTUAL_clk_out2_clk_core -waveform {0.000 2.500}
set_input_delay -clock [get_clocks VIRTUAL_clk_out2_clk_core] -min -add_delay 1.000 [get_ports lb_sel_pin]
set_input_delay -clock [get_clocks VIRTUAL_clk_out2_clk_core] -max -add_delay 1.250 [get_ports lb_sel_pin]
set_input_delay -clock [get_clocks VIRTUAL_clk_out2_clk_core] -min -add_delay 1.000 [get_ports rst_pin]
set_input_delay -clock [get_clocks VIRTUAL_clk_out2_clk_core] -max -add_delay 1.250 [get_ports rst_pin]
set_input_delay -clock [get_clocks VIRTUAL_clk_out2_clk_core] -min -add_delay 1.000 [get_ports rxd_pin]
set_input_delay -clock [get_clocks VIRTUAL_clk_out2_clk_core] -max -add_delay 1.250 [get_ports rxd_pin]
set_output_delay -clock [get_clocks VIRTUAL_clk_out2_clk_core] -min -add_delay 0.500 [get_ports {led_pins[*]}]
set_output_delay -clock [get_clocks VIRTUAL_clk_out2_clk_core] -max -add_delay 1.250 [get_ports {led_pins[*]}]
set_output_delay -clock [get_clocks VIRTUAL_clk_out2_clk_core] -min -add_delay 0.500 [get_ports dac_clr_n_pin]
set_output_delay -clock [get_clocks VIRTUAL_clk_out2_clk_core] -max -add_delay 1.250 [get_ports dac_clr_n_pin]
set_output_delay -clock [get_clocks VIRTUAL_clk_out2_clk_core] -min -add_delay 0.500 [get_ports dac_cs_n_pin]
set_output_delay -clock [get_clocks VIRTUAL_clk_out2_clk_core] -max -add_delay 1.250 [get_ports dac_cs_n_pin]
set_output_delay -clock [get_clocks VIRTUAL_clk_out2_clk_core] -min -add_delay 0.500 [get_ports spi_mosi_pin]
set_output_delay -clock [get_clocks VIRTUAL_clk_out2_clk_core] -max -add_delay 1.250 [get_ports spi_mosi_pin]
set_output_delay -clock [get_clocks VIRTUAL_clk_out2_clk_core] -min -add_delay 0.500 [get_ports txd_pin]
set_output_delay -clock [get_clocks VIRTUAL_clk_out2_clk_core] -max -add_delay 1.250 [get_ports txd_pin]

} 

save_constraints -force
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -name timing_2
close_design
}


 ## ********** Step 5 : Performing the report_timing_summary after adding the constraints and Implementing the design **************

proc genReport {} {

# Calling the proc which runs implementation
implementationRun

report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -name timing_1
}


 ## ********** Running only the steps that are required with Make **************

proc make {stopAt} {

   puts "Running until the step $stopAt"
   set limit [string tolower $stopAt]
   switch $limit {
      step1  { copyProject }
      step2  { make step1; openProject }
      step3_4  { make step2; addConstr }
      step5  { make step3_4; genReport }
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
