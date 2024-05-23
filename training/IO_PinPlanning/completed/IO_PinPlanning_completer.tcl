###########################################################################
# IO_PinPlanning Completer Script
###########################################################################

# load the standard helper files
source -quiet ../../fpgaSupport_scripts/script1.tcl
source -quiet ../../fpgaSupport_scripts/script2.tcl
# project constants
set verbose 	1
set tcName 	IO_PinPlanning
set demoOrLab 	completed
set projName 	uart_led

#########################################################
#Step 1 : Copying the project
#########################################################

proc copyemptyProj {} {
    variable platform
    variable language
    variable tcName
    variable demoOrLab 
    variable projName 
    variable TRAINING_PATH
   # set sourcePath [file join $TRAINING_PATH $tcName lab $platform $language]
    set destPath [file join $TRAINING_PATH $tcName completed $platform $language]
}

#########################################################
############################################################
# Step 2 : Creating a new project and adding source files
############################################################
proc createProj {} {
 variable language
 variable platform
 variable tcName
 variable demoOrLab
 variable projName
 variable sourceList
 variable TRAINING_PATH

# Creates the project, adds source files
projectCreate 

if {$projName == "uart_led"} {
   if {$language == "vhdl"} {
         set sourceList [list led_ctl meta_harden uart_baud_gen uart_led uart_led_pkg uart_rx_UART uart_rx_ctl]
   } elseif {$language == "verilog"} {
	 set sourceList [list led_ctl meta_harden uart_baud_gen uart_led uart_rx uart_rx_ctl]
   } 
} 

sourcesAdd $sourceList

if {$projName == "uart_led"} {
   set constraintFileList [list uart_led_IO_PinPlanning.xdc] 
} elseif {$projName == "wave_gen"} {
   set constraintFileList [list wave_gen_pins_IO_PinPlanning.xdc wave_gen_timing_IO_PinPlanning.xdc]
}

constraintFilesAdd $constraintFileList
set_property target_constrs_file $TRAINING_PATH/$tcName/$demoOrLab/KCU105/$language/uart_led.srcs/constrs_1/imports/support/uart_led_IO_PinPlanning.xdc [current_fileset -constrset]

}

############################################################
# Step 3 : Analyzing the Design and viewing DRC violations
############################################################
proc drcCheck {} {
 variable platform
 variable language
 variable tcName
 variable demoOrLab 
 variable projName
set projName.srcs {append $projName .srcs}

  set_property top uart_led [current_fileset]
  synth_design -rtl -name rtl_1
  report_drc -name drc_1 -ruledecks {default}
  markLastStep drcCheck	   
} 
	
############################################################
#Step 4 : Placing the Pins
############################################################
proc placePins {} {
 variable platform
 variable language
 variable tcName
 variable demoOrLab 
 variable projName

set projName.srcs {append $projName .srcs}
if {$platform == "KCU105"} {
  place_ports btn_pin AE10
  set_property IOSTANDARD LVCMOS18 [get_ports [list btn_pin]]
  place_ports rxd_pin G25
  set_property IOSTANDARD LVCMOS18 [get_ports [list rxd_pin]]
  place_ports rst_pin AN8
  set_property IOSTANDARD LVCMOS18 [get_ports [list rst_pin]]
}

save_constraints_as constrs_2 -target_constrs_file uart_led_IO_PinPlanning.xdc
set_property constrset constrs_2 [get_runs synth_1]
set_property constrset constrs_2 [get_runs impl_1] 

report_drc -name drc_2 -ruledecks {default}
markLastStep placedPins

} 

##########################################################
# Running through the steps that are required, with make
##########################################################
proc make {stopAt} {
   puts "Running until the step $stopAt"
   set limit [string tolower $stopAt]
   switch $limit {
      step1  { copyemptyProj }
	  step2  { make step1; createProj }
      step3  { make step2; drcCheck }
      step4  { make step3; placePins }
      all    { make step4 }
      
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
