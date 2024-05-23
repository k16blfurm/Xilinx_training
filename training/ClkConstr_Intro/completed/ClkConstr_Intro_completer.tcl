###########################################################################

## Introduction to Clock Constraints Completer Script

###########################################################################



# load the standard helper file

source -quiet ../../fpgaSupport_scripts/script1.tcl
source -quiet ../../fpgaSupport_scripts/script2.tcl
# project constants
set verbose 	1
set tcName 	ClkConstr_Intro
set demoOrLab 	completed
set projName 	wave_gen

## *********** Step 1 : Copying the Project ***********

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
      puts "Please type: use VHDL | Verilog"
      puts "   then rerun the projectCreate"
} 

if {$isPlatNotSelected} {
      puts "Please type: use KCU105"
      puts "   then rerun the projectCreate"
}



# Open a project

set projName.xpr {append $projName .xpr}
open_project $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.xpr
set synth 0

# Open synthesized design
synthesisRun
}



 

 ## ********** Step 3 : Run report_clock_networks and observe the report **************

proc observeReport {} {
report_clock_networks -name {network_1}
}


  ## ********** Step 4 : Add primary clock constraints via GUI **************
proc addPriConstr {} {
variable platform
variable language
variable tcName
variable demoOrLab 
variable projName
variable TRAINING_PATH

set projName.srcs {append $projName .srcs}
set_property target_constrs_file $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.srcs/constrs_1/imports/wave_gen_timing_ClkConstr_Intro.xdc [current_fileset -constrset]

# Adding the Constraints for both 7 series and Ultra-Scale board
if {$platform == "KCU105"} {
	create_clock -period 3.333 -name clk_pin_p -waveform {0.000 1.667} [get_ports clk_pin_p]
} elseif {$platform == "KC7xx"} {
	create_clock -period 5.000 -name clk_pin_p -waveform {0.000 2.500} [get_ports clk_pin_p]
}
set_input_jitter [get_clocks clk_pin_p] 0.000

# Saving the constraints
save_constraints -force
report_clocks
}

 ## ********** Step 5 : Add generated clock constraints via GUI **************

proc addGenConstr {} {
variable platform
variable language
variable tcName
variable demoOrLab
variable projName
variable TRAINING_PATH

set projName.srcs {append $projName .srcs}
set_property target_constrs_file $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.srcs/constrs_1/imports/wave_gen_timing_ClkConstr_Intro.xdc [current_fileset -constrset]

# Adding the Constraints for both 7 series and Ultra-Scale board
if {$platform == "KCU105"} {
	create_generated_clock -name clk_samp -source [get_pins clk_gen_i0/BUFGCE_clk_samp_i0/I] -divide_by 32 [get_pins clk_gen_i0/BUFGCE_clk_samp_i0/O]
} elseif {$platform == "KC7xx"} {
	create_generated_clock -name clk_samp -source [get_pins clk_gen_i0/BUFHCE_clk_samp_i0/I] -divide_by 32 [get_pins clk_gen_i0/BUFHCE_clk_samp_i0/O]
}

# Saving the constraints
save_constraints -force
report_clocks
}

 ## ********** Step 6 : Implementing the design and running report_timing_summary **************

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
      step3  { make step2; observeReport }
      step4  { make step3; addPriConstr }
      step5  { make step4; addGenConstr }
      step6  { make step5; genReport }
      all    { make step6 }
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
