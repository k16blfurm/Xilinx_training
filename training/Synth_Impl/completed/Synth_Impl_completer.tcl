###########################################################################
## Synthesis and Implementation Completer Script
###########################################################################

# load the standard helper file
source -quiet ../../fpgaSupport_scripts/script1.tcl
source -quiet ../../fpgaSupport_scripts/script2.tcl

# project constants
set verbose 	1
set tcName 	Synth_Impl
set demoOrLab 	completed
set projName 	uart_led

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

exec unzip $TRAINING_PATH/$tcName/completed/$platform/$language.zip -d $TRAINING_PATH/$tcName/completed/$platform/$language
}

## *********** Step 2 : Opening a project ***********

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
      puts "Please type: use KCU105 | ZCU104 "
      puts "   then rerun the projectCreate"
}

# Open a project
set projName.xpr {append $projName .xpr}
open_project $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.xpr
}


 ## ********** Step 3 : Browsing through the synthesis strategies and running synthesis **************

proc synthStrategy {} {
variable platform
variable language
variable tcName
variable demoOrLab 
variable projName 
variable TRAINING_PATH

    set completedfilePath $TRAINING_PATH/$tcName/support/completed_files
    set projName.srcs {append $projName .srcs}
    set path $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.srcs/constrs_1/imports
	
	# load all the completed file as the working file
	
	if {$platform == "ZCU104"} { 
		file copy -force $completedfilePath/uart_led_Synth_Impl.xdc $path/uart_led_Synth_Impl.xdc
	} elseif {$platform == "KC705"} {
		file copy -force $completedfilePath/uart_led.xdc $path/uart_led.xdc
	}

# Set the synthesis strategy and explore
set_property strategy Flow_RuntimeOptimized [get_runs synth_1]
set_property strategy {Vivado Synthesis Defaults} [get_runs synth_1]

reset_run synth_1

# Calling the proc which runs Synthesis
synthesisRun

report_utilization -name utilization_1
check_timing -verbose -name timing_1
}


 ## ********** Step 4 : Browsing through the implementation strategies and running implementation **************

proc implStrategy {} {

# Set the implementation strategy and explore
set_property strategy Performance_Explore [get_runs impl_1]
set_property strategy Flow_RuntimeOptimized [get_runs impl_1]

set_property strategy {Vivado Implementation Defaults} [get_runs impl_1]

# Calling the proc which runs implementation
implementationRun

close_design
}


 ## ********** Step 5 : Generating bitstream and loading it on the board **************

proc genBitstream_loadBoard {} {
variable platform
variable language
variable tcName
variable demoOrLab 
variable projName

# Calling the proc which generates bitstream
bitstreamRun
launch_runs impl_1 -to_step write_bitstream -jobs 8
open_run impl_1
}

# Open the Hardware Manager with respect to the selected board
# Open the tera term and perform the further steps 

 ## ********** Running only the steps that are required with Make **************

 
proc make {stopAt} {

   puts "Running until the step $stopAt"
   set limit [string tolower $stopAt]
   switch $limit {
      step1  { copyProject }
      step2  { make step1; openProject }
      step3  { make step2; synthStrategy }
      step4  { make step3; implStrategy }
      step5  { make step4; genBitstream_loadBoard }
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
