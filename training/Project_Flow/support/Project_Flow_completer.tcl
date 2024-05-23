# ##########################################################################
#
# Project_Flow Completer Script
#
# ##########################################################################

# manage the training path environment variable
set badEnv 0;
if {[catch {variable trainingPath $::env(TRAINING_PATH)} emsg]} {
   puts "ERROR!!! TRAINING_PATH environment variable not defined!";
    set badEnv 1;
} else {
   regsub -all {\\} $trainingPath / trainingPath;
}

# load the pseudo-environment variables
set CustEd_INSTALL /opt/amd
set CustEd_VERSION 2023.1

# load the helper script
set FPGA 1
source $trainingPath/common/completer_helper.tcl;

# identify the PS's configuration
variable APSoCactivePeripheralList { CONFIG.PCW_USE_M_AXI_GP0             1                         
							         CONFIG.PCW_UART1_PERIPHERAL_ENABLE   1
							         CONFIG.PCW_EN_CLK0_PORT              1
				                     CONFIG.PCW_EN_RST0_PORT              1
							       }	
variable MPSoCactivePeripheralList { CONFIG.PSU__USE__M_AXI_GP2                 1 
                                     CONFIG.PSU__USE__M_AXI_GP0                 1
                                     CONFIG.PSU__USE__S_AXI_GP2                 1
                                     CONFIG.PSU__MAXIGP2__DATA_WIDTH           64
                                     CONFIG.PSU__GPIO_EMIO__PERIPHERAL__ENABLE  1
								     CONFIG.PSU__GPIO_EMIO__PERIPHERAL__IO     32
                                     CONFIG.PSU__FPGA_PL0_ENABLE                1
                                     CONFIG.PSU__USE__FABRIC__RST               1
									 CONFIG.PSU__QSPI__PERIPHERAL__ENABLE       1
									 CONFIG.PSU__UART0__PERIPHERAL__ENABLE      1	
                                   }	
								   
# build the table of steps
#   1 - Creating a New project
#   2 - Adding Simulation Source file to the project
#   3 - Exporing the Vivado IDE
#   4 - Simulating the Design
set stepList {{openVivado projectCreate design_sources_add constraintFilesDefaultAdd}\
              {connectGPIO UARTadd}\
			  {connectionsComplete}
             }

# project constants
set verbose 	1;
set tcName 	    Project_Flow;
set labName     $tcName;
set demoOrLab 	lab;
set projName 	uart_led;

# default language and target
use vhdl;
use kcu105;


proc openVivado {} {
	# null function
}

proc design_sources_add {} {
	variable trainingPath;
	variable tcName;
	variable design_sources;
	set path $trainingPath;
	append path "/common/LED_UART_design";
	
	# list of sources from the common directory
	# note extensions automatically applied for the selected language during import
	set design_sources {led_ctl meta_harden uart_baud_gen uart_led uart_rx uart_rx_ctl}; 	
	set pathed_sources {};
	foreach this_source $design_sources {
		lappend pathed_sources $path/$this_source;
	}
	sourcesAdd $pathed_sources;
}

proc simSrcVHDLadd {} {
	variable trainingPath;
	variable tcName
	set path $trainingPath;
	append path "/" $tcName "/support"
    set list_of_src_lib_pairs{ {$path/string_utilities_sim_pkg.vhd utilities_lib}\
				               {$path/string_utilities_synth_pkg.vhd utilities_lib}\
				               {$path/time_utilities_pkg.vhd utilities_lib}\
				               {$path/tb_fifo_pkg.vhd specific_support_lib}
	                         };
	set list_of_sim_sources {$path/tb_resp_checker.vhd $path/tb_uart_driver.vhd $path/test_uart_rx.vhd}
	simSourcesAdd list_of_sim_sources;		# goes into the usual simulation library
	lib_sources_add list_of_src_lib_pairs;	# goes into specific libraries
}

proc simSrcVerilogAdd {} {
	variable trainingPath;
	variable tcName
	set path $trainingPath;
	append path "/" $tcName "/support"
	set verilog_list { $path/tb_fifo_Project_Flow.v $path/tb_resetgen_Project_Flow.v $path/tb_resp_checker_Project_Flow.v $path/tb_uart_driver_Project_Flow.v $path/tb_uart_rx_Project_Flow.v $path/test_uart_rx_Project_Flow.v };

	sourcesAdd $verilog_list
	simSourcesAdd
}


# ########################################################
#
# Step 1 : Copying the project
#
# ########################################################
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

# ########################################################
#
# Step 2 : Creating a new project and adding source files
#
# ########################################################
proc createProj {} {
	variable language
	variable platform
	variable sourceList
	variable tcName
	variable demoOrLab
	variable projName
	variable TRAINING_PATH

	# Creates the project, adds source files
	projectCreate 

	if {$projName == "uart_led"} {
		if {$language == "vhdl"} {
			set sourceList [list led_ctl meta_harden uart_baud_gen uart_led uart_led_pkg uart_rx_Project_Flow uart_rx_ctl]
		} elseif {$language == "verilog"} {
			set sourceList [list led_ctl meta_harden uart_baud_gen uart_led uart_rx uart_rx_ctl]
		} 
	} 

	sourcesAdd $sourceList

	if {$projName == "uart_led"} {
	   set constraintFileList [list uart_led_Project_Flow.xdc] 
	} elseif {$projName == "wave_gen"} {
	   set constraintFileList [list wave_gen_timing_Project_Flow.xdc]
	}

	constraintFilesAdd $constraintFileList
}

# #########################################
#
# Step 3 : Adding Simulation source files
#
# #########################################
proc addSimFiles {} {
   variable tcName
   variable language
   variable platform
   variable verbose
   variable demoOrLab
   variable projName
   variable sourceList
   variable TRAINING_PATH

	if {$projName == "uart_led"} {
		# uart_led design
		if {$language == "vhdl"} {
			set sourceList [list uart_led_pkg time_utilities_pkg test_uart_rx tb_uart_driver_UART tb_resp_checker_UART tb_fifo_pkg string_utilities_sim_pkg string_utilities_synth_pkg]
		} elseif {$language == "verilog"} {
			set sourceList [list test_uart_rx tb_uart_rx tb_uart_driver tb_resp_checker tb_resetgen tb_fifo]
		}
	} elseif {$projName == "wave_gen"} {
		# wave_gen design
		if {$language == "vhdl"} {
			set sourceList [list string_utilities_sim_pkg_Project_Flow tb_cmd_gen_Project_Flow tb_fifo_Project_Flow tb_resetgen_Project_Flow tb_resp_checker_Project_Flow tb_uart_driver_Project_Flow tb_uart_monitor_Project_Flow tb_wave_gen_Project_Flow tb_wave_gen_helper_pkg_Project_Flow tb_wavegen_model_Project_Flow time_utilities_pkg_Project_Flow wavegen_commands_Project_Flow.txt]
		} elseif {$language == "verilog"} {
			set sourceList [list tb_cmd_gen_Project_Flow tb_fifo_Project_Flow tb_ram_Project_Flow tb_resetgen_Project_Flow tb_resp_checker_Project_Flow tb_uart_driver_Project_Flow tb_uart_monitor_Project_Flow tb_wave_gen_Project_Flow test_wave_gen_Project_Flow]
		}
	}

	simSourceListAdd $sourceList

	if {$language == "vhdl"} {
		set_property library utilities_lib [get_files  $TRAINING_PATH/$tcName/$demoOrLab/KCU105/vhdl/uart_led.srcs/sim_1/imports/support/string_utilities_synth_pkg.vhd]
		set_property library utilities_lib [get_files  $TRAINING_PATH/$tcName/$demoOrLab/KCU105/vhdl/uart_led.srcs/sim_1/imports/support/string_utilities_sim_pkg.vhd]
		set_property library utilities_lib [get_files  $TRAINING_PATH/$tcName/$demoOrLab/KCU105/vhdl/uart_led.srcs/sim_1/imports/support/time_utilities_pkg.vhd]
		set_property library specific_support_lib [get_files  $TRAINING_PATH/$tcName/$demoOrLab/KCU105/vhdl/uart_led.srcs/sim_1/imports/support/tb_fifo_pkg.vhd]
	}
}

#********************************************
#
# Step 4: Exploring the Vivado IDE
#
#********************************************

#********************************************
#
# Step 5 : Simulating the design
#
#********************************************
proc simDesign {} {
	variable language;

	update_compile_order -fileset sources_1;
	update_compile_order -fileset sim_1;

	## Disabling source management mode.  This is to allow the top design properties to be set without GUI intervention.
	#  set_property source_mgmt_mode None [current_project]

	## Setting the top module for simulation
	set_property top test_uart_rx [get_filesets sim_1];
	set_property top_lib xil_defaultlib [get_filesets sim_1];

	## Re-enabling previously disabled source management mode.
	set_property source_mgmt_mode All [current_project];

	## Running a Behavioral Simulation
	launch_simulation;
	if {$language == "Verilog"} {
		puts "Adding signals to wave";
		add_wave {{/test_uart_rx/tb/uart_rx_i0/clk_rx}} {{/test_uart_rx/tb/uart_rx_i0/rst_clk_rx}} {{/test_uart_rx/tb/uart_rx_i0/rxd_i}} {{/test_uart_rx/tb/uart_rx_i0/rxd_clk_rx}} {{/test_uart_rx/tb/uart_rx_i0/rx_data}} {{/test_uart_rx/tb/uart_rx_i0/rx_data_rdy}} {{/test_uart_rx/tb/uart_rx_i0/frm_err}} {{/test_uart_rx/tb/uart_rx_i0/baud_x16_en}} 
	}
	restart;
	run all;
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
		step3  { make step2; addSimFiles }
		step4  { make step3; simDesign }
		all    { make step4 }
		default { 
		puts "Call the make proc, Should be make step*" 
		}	
	}	
}


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
