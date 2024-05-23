###########################################################################
## Basic Design Analysis in the Vivado IDE Completer Script
###########################################################################

# load the standard helper file
source -quiet ../../fpgaSupport_scripts/script1.tcl
source -quiet ../../fpgaSupport_scripts/script2.tcl
# project constants
set verbose 	1
set tcName 	Basic_Dsgn_Analysis
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

#set impl 0
open_run synth_1 -name synth_1

report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -routable_nets -name timing_1

close_design

# Open synthesized design
open_run impl_1
}


proc make {stopAt} {

 
   puts "Running until the step $stopAt"
   set limit [string tolower $stopAt]
   switch $limit {
   step1  { copyProject }
   step2  { make step1; openProject }
    all    { make step2 }
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
