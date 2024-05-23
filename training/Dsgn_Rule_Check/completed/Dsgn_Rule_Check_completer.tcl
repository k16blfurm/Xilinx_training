###########################################################################
## Vivado Design Rule Checks Completer Script
###########################################################################


# load the standard helper files
source -quiet ../../fpgaSupport_scripts/script1.tcl
source -quiet ../../fpgaSupport_scripts/script2.tcl


# project constants

set verbose 	1
set tcName 		Dsgn_Rule_Check
set demoOrLab 	completed
set projName 	bft


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


 ## *********** Step 2 : Opening an Example Project ***********

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
      puts "Please type: use VHDL"
      puts "   then rerun the projectCreate"
} 

if {$isPlatNotSelected} {
      puts "Please type: use KCU105"
      puts "   then rerun the projectCreate"
}



# Open a project
set projName.xpr {append $projName .xpr}
open_project $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.xpr
}


 ## ********** Step 3 : Examining the project_bft Design and check DRC **************

proc examineBftDesign {} {
variable platform
variable language
variable tcName
variable demoOrLab 
variable projName 
variable TRAINING_PATH

# Open the elaborated design

#synth_design -rtl -name rtl_1
open_run synth_1 -name synth_1
# Generate the DRC report
#report_drc -name drc_1 -ruledecks {default}
current_design synth_1
create_drc_ruledeck ruledeck_1
report_drc -name drc_1 -ruledecks {ruledeck_1}

# Assign the package pin location for the ports using the I/O Ports tab
place_ports bftClk AD16
place_ports {wbOutputData[8]} AH19
place_ports error AC14
place_ports reset AA19
place_ports wbClk AE16



# save constraints and selecting target constraints

set_property target_constrs_file $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/bft.srcs/constrs_1/imports/xcku035-fbva900-2-e/bft_full.xdc [current_fileset -constrset]
save_constraints -force

# Run the DRC report again
report_drc -name drc_2 -ruledecks {ruledeck_1}
# Enter the following XDC constraints in the Tcl Console to fix this DRC violation
set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]

# save constraints

#save_constraints 

# Run the DRC report again
report_drc -name drc_3 -ruledecks {ruledeck_1}

}



 ## ********** Running through the steps that are required with Make **************

proc make {stopAt} {
   puts "Running until the step $stopAt"
   #set steps [list S1_openProject S2_observeReport S3_addPriConstr S4_addGenConstr S5_genReport]
   set limit [string tolower $stopAt]
   switch $limit {
      step1  { copyProject }
      step2  { make step1; openProject }
      step3  { make step2; examineBftDesign }
      all    { make step3 }
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

