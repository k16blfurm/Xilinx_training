###########################################################################
## Vivado IP Flow Completer Script
###########################################################################

# load the standard helper file
source -quiet ../../fpgaSupport_scripts/script1.tcl
source -quiet ../../fpgaSupport_scripts/script2.tcl

# project constants
set verbose 	1
set tcName 	IP_Flow
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
   
if {!$isLangNotSelected} {
      puts "Please type: use VHDL | Verilog"
      puts "   then rerun the projectCreate"
   } elseif {!$isPlatNotSelected} {
      puts "Please type: use KCU105 | KC705 | KC7xx"
      puts "   then rerun the projectCreate"
   }

# Open a project
set projName.xpr {append $projName .xpr}
open_project $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.xpr

}

 
 ## ********** Step 3 : Building and Instantiating the clk_core Core **************

proc buildInstClkCore {} {
variable platform
variable language
variable tcName
variable demoOrLab 
variable projName
variable fileName
variable TRAINING_PATH

set projName.xpr {append $projName .xpr}
set projName.srcs {append $projName .srcs}
set projName.ip_user_files {append $projName .ip_user_files}
set projName.cache {append $projName .cache}

if {$platform == "KCU105"} {
create_ip -name clk_wiz -vendor xilinx.com -library ip -version 6.0 -module_name clk_core -dir $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.srcs/sources_1/ip

set_property -dict [list CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} CONFIG.PRIM_IN_FREQ {300.000} CONFIG.CLKOUT2_USED {true} CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {200.000} CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {200.000} CONFIG.CLKIN1_JITTER_PS {33.330000000000005} CONFIG.MMCM_DIVCLK_DIVIDE {3} CONFIG.MMCM_CLKIN1_PERIOD {3.333} CONFIG.MMCM_CLKOUT0_DIVIDE_F {5.000} CONFIG.MMCM_CLKOUT1_DIVIDE {5} CONFIG.NUM_OUT_CLKS {2} CONFIG.CLKOUT1_JITTER {113.676} CONFIG.CLKOUT2_JITTER {113.676} CONFIG.CLKOUT2_PHASE_ERROR {98.575}] [get_ips clk_core]
set_property -dict [list CONFIG.USE_PHASE_ALIGNMENT {true} CONFIG.SECONDARY_SOURCE {Single_ended_clock_capable_pin} CONFIG.CLKOUT1_DRIVES {Buffer} CONFIG.CLKOUT2_DRIVES {Buffer} CONFIG.CLKOUT3_DRIVES {Buffer} CONFIG.CLKOUT4_DRIVES {Buffer} CONFIG.CLKOUT5_DRIVES {Buffer} CONFIG.CLKOUT6_DRIVES {Buffer} CONFIG.CLKOUT7_DRIVES {Buffer}] [get_ips clk_core]

generate_target {instantiation_template} [get_files $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.srcs/sources_1/ip/clk_core/clk_core.xci]
generate_target all [get_files  $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.srcs/sources_1/ip/clk_core/clk_core.xci]

catch { config_ip_cache -export [get_ips -all clk_core] }
export_ip_user_files -of_objects [get_files $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.srcs/sources_1/ip/clk_core/clk_core.xci] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.srcs/sources_1/ip/clk_core/clk_core.xci]
launch_runs -jobs 6 clk_core_synth_1
export_simulation -of_objects [get_files $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.srcs/sources_1/ip/clk_core/clk_core.xci] -directory $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.ip_user_files/sim_scripts -ip_user_files_dir $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.ip_user_files -ipstatic_source_dir $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.ip_user_files/ipstatic -lib_map_path [list {modelsim=$TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.cache/compile_simlib/modelsim} {questa=$TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.cache/compile_simlib/questa} {riviera=$TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.cache/compile_simlib/riviera} {activehdl=$TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.cache/compile_simlib/activehdl}] -use_ip_compiled_libs -force -quiet

}

 # Copy completed source code
  set completedfilePath $TRAINING_PATH/$tcName/support/completed_files
  set path $TRAINING_PATH/$tcName/$demoOrLab/$platform/$language/$projName.srcs/sources_1/imports		

 # load all the completed file as the working file               
    if {$language == "vhdl"} { 
        file copy -force $completedfilePath/clk_gen_IP_Flow.vhd $path/clk_gen_IP_Flow.vhd
    } 
    if {$language == "verilog"} { 
        file copy -force $completedfilePath/clk_gen_IP_Flow.v $path/clk_gen_IP_Flow.v
    }			

 }
 
# In order to make sure that the clk_core ip is included in the wave_gen design, refresh the Hierarchy from the sources window before running the next proc.

 ## ********** Step 4 : Implementing the Design **************

proc ImplDsgn {} {

update_compile_order -fileset sources_1

# Open implemented design
implementationRun

#Report Utilization
report_utilization -name utilization_1
}


 ## ********** Running only the steps that are required with Make **************

proc make {stopAt} {

   puts "Running until the step $stopAt"
   #set steps [list S1_openProject S2_observeReport S3_addPriConstr S4_addGenConstr S5_genReport]
   set limit [string tolower $stopAt]
   switch $limit {
	  step1  { copyProject }
      step2  { make step1; openProject }
      step3  { make step2; buildInstClkCore }
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
