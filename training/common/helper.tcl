#!/usr/bin/env tclsh

#
#*******************************************************************************************************************************************
#
# Helper file contains procs to support tcl scripts
#
# See Doxygen generated documenation
#
#
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
#
# History:
#    2022/04/26 - LR - Added "@@@ helper.tcl - " to messages to make them easier to find and which tcl file is producing them when debugging, please do not remove
#    2022/03/28 - WK - zc702 was marked as deprecated which isn't correct for ZSA classes. removed warning
#    2022/01/24 - WK - wierd problem with loading subordinate helper scripts - cleaned up process of determining what directories were used as source
#    2022/01/21 - LR - 2021.2 - added support for vck190es & vmk180es
#    2022/01/20 - WK - 2021.2 - updated for Doxygen compatibility
#    2021/07/19 - LR - 2021.1 - added "regsub -all {\\} $trainingPath / trainingPath;" for linux path
#    2021/07/19 - WK - 2021.1 - added diagnostic capabilities to the latestVersion proc
#    2021/04/12 - WK - 2020.2 - removed excess environment variables, added quick search environment variable option for find7z, cleaned up determining when running for student or startingPoint
#    2020/07/31 - WK - improved getPathToJava to better support both Linux and Windows environments. Still not 100%, but should be working.
#    2020/07/14 - WK - updated getPathToJava to use environment variable: javaPreferred. this allows user to specify specific version and saves search time
#    2020/06/27 - WK - cleaned up some issues with the self-check stuff. strace only works in linux, not windows
#    2020/06/19 - WK - added several list and string procs; changed loadedProcs to a list where each elements is name,descr
#    2020/05/31 - WK - moved environment variable test into this tcl script. This should shorten many of the using scripts
#    2020/01/14 - WK - moved "use" to completer script, added error capture to copyIfNewer
#    2019/06/12 - WK - added internal error management (6/24 - updated paths to test is the trainingPath was already set or not) (6/29 - added trainingpath)
#    2019/05/10 - WK - added copyFiles
#    2019/05/06 - WK - added support for ZCU111 and ZCU102. minor code cleanup. fix to findDirectories.
#    2019/01/16 - AM - Added Linux paths
#    2018/04/10 - WK - copyIfNewer - added protection for missing source file
#    2018/04/03 - WK - added failed delete protection
#    2018/03/29 - WK - added new filesDelete and changed the old filesDelete to directoryWipe, findFiles now has a third argument for recursive searching
#    2018/03/27 - WK - added check to see if verbose was defined or not (to prevent "no such variable" errors), tested runJava proc, added logForceOpen
#    2017/11/28 - WK - added additional use capability - QEMU
#    08/28/2017 - WK - added getLatestXilinxVersion
#    08/28/2017 - WK - fixed activePeripheralList failure to initialize, cleaned up "use", added debug variable
#    07/31/2017 - WK - updated for 2017.1 including removal of SVN access (see developer_helper.tcl)
#    11/01/2016 - WK - added numerous procs to support 2016.3 and future releases
#    07/25/2016 - WK - added numerous procs to support 2016.1 release
#    04/15/2016 - WK - initial coding
#
#*******************************************************************************************************************************************
#
#!/usr/bin/tclsh

#
# identify the OS that we are currently running in...
variable hostOS [lindex $tcl_platform(os) 0];

# if the badEnv variable has not been created by the script that called helper.tcl, create it and issue a warning
if {![info exists badEnv]} {
   set badEnv 0;
   puts "@@@ helper.tcl - WARNING! badEnv variable wasn't set by the calling script to helper.tcl - now set in helper.tcl";
   #set trace [strace]
   #set thisLevel [info level]
   # since trace is still sitting on the stack we have to go up two instead of one
   #set upTwoLevels [expr $thisLevel - 2]
   #set thisLevelName [lindex $trace $upTwoLevels]
   #puts "@@@ helper.tcl - This likely means that an absolute path was used in the calling script ($thisLevelName) which is a bad practice!";
}

# is verbose mode defined?
if {![info exists verbose]} {
   variable verbose 0;        # just define the verbose variable and keep it disabled
}

# variables commonly used by CustEd procs
variable language              undefined;
variable platform              undefined;
variable lastStep              notStarted;
variable processor             undefined;
variable activePeripheralList  "";
variable debugLog              0;
variable usingQEMU             0;
variable myLocation            [file normalize [info script]];
variable suppressLogErrors     0;

# *********************************** DEBUG ***********************************
# here's the issue: we need to determine if the helper scripts are available 
# from either the training directory which is where the students would use it 
# from or the repository which is where developers building the student starting
# points would draw it from. We've been using a fairly convoluted logic process
# to determine this and we'll replace it 7/13/22 with a much simpler approach which
# uses the existing buildingStartingPoint variable which will be present and set to 1
# if this was called from the starting point building flow and will not be present 
# for the student. Based on this, we'' set the value of custEdIP so that the script
# can load what is needed
#
puts "@@@ helper.tcl - checking environment to see if this is a builder use or a student use";

# if buildingStartingPoint is defined and set to 1, then we know that we're building from the repository and the CustEd location variable needs to reflect that
# otherwise the student is using this script and we should grab stuff from the training directory
if {[info exists buildingStartingPoint]} {
   puts "@@@ helper.tcl - Developer mode - pull scripts from repository";
   # make sure the repository is defined, if not, then bail
   # NOTE: by definition the REPOSITORY variable points to the useable aspect (i.e. \Xilinx_SVN\trunk)
   if {[catch {variable repo $::env(REPOSITORY)} emsg]} {
      puts stderr "ERROR!!! REPOSITORY environment variable not defined - therefore this cannot be a startingPoint build!"
      set badEnv 1;
   } else {
      # looks like a startingPoint build so we can use the $REPOSITORY as the custEdIP directory and not worry about using trainingPath stuff as it may not have been copied yet
      set custEdIP $repo/custEdIP;
      regsub -all {\\} $custEdIP / custEdIP;
      puts "@@@ helper.tcl - building starting point operational mode";
   }
} else {
   puts "@@@ helper.tcl - Student mode - pull scripts from TRAINING_PATH ($trainingPath)";
	   
	# make sure the training path exists, if it doesn't, then bail!
	if {[catch {set trainingPath $::env(TRAINING_PATH)} emsg]} {
		puts stderr "ERROR!!! TRAINING_PATH environment variable not defined!"
		set badEnv 1;
	} else {
		puts "@@@ helper.tcl - trainingPath variable set - checking for drive specifiers to see if this is a windows or linux situation";
		# if we were called from an FPGA or language script then FPGA will be set to '1' otherwise it will not exist
		if {![info exists FPGA]} {
			set FPGA 0
		}
		if {$FPGA} {
			set custEdIP $trainingPath/common
			regsub -all {\\} $custEdIP / custEdIP;
		} else {
			set custEdIP $trainingPath;
			append custEdIP / CustEdIP;
			regsub -all {\\} $custEdIP / custEdIP;

			puts "@@@ helper.tcl - custEdIP - checking if a drive was specified";
			puts "@@@ helper.tcl - checking $custEdIP now...";
			set driveDesignatorPresent [string first \: $custEdIP];
			if {$driveDesignatorPresent > -1} {
				puts "@@@ helper.tcl - custEdIP - drive specified - stripping";
				set custEdIP [string range $custEdIP 2 [string length $custEdIP]]; # strip the drive: from the path
			#puts "@@@ helper.tcl - custEdIP - custEdIP now set to $custEdIP";
			} else {
				puts "@@@ helper.tcl - custEdIP - no drive specification found, running with $custEdIP";
			}
		}
		regsub -all {\\} $trainingPath / trainingPath;
	}
}

#
# if everything is OK, then continue, otherwise throw an error here and quit
if {$badEnv} {
   #puts -nonewline "Hit Enter to exit ==> "
   #flush stdout
   #gets stdin
   puts stderr "Environment not properly configured! Exiting in...";
   for {set i 10} {$i > 0} {incr i -1} {
      puts stderr $i;
      after 1000;
   }
   exit 1
}

# build a manifest of each proc that is successfully loaded
if {![info exists loadedProcs]} {
   puts "@@@ helper.tcl - loadedProcs variable not defined - defining it in helper.tcl";
   variable loadedProcs {};
}

#
# load the additional helper script files
set scriptLocation $custEdIP;
if {$FPGA} {set scriptLocation $trainingPath/common; }
set scriptFiles {helper_logging.tcl helper_strings.tcl helper_files.tcl helper_lists.tcl};
foreach scriptFile $scriptFiles {
	puts "@@@ helper.tcl - attempting to source $scriptFile";
	if {[file exist $scriptLocation/$scriptFile]} {
		puts "   loading from specified script location in starting point: $scriptLocation/$scriptFile";
		source $scriptLocation/$scriptFile;
	} elseif {[info exist buildingStartingPoint]} {
		puts "   loading from repository: $repo/$scriptFile"
		source $repo/$scriptFile;
	} else {
		puts stderr "helper.tcl: failed when attempting to load $scriptFile!";
		after 5000;
		# exit 1;
	}
}
puts "@@@ helper.tcl - done sourcing helper scripts";



### Variable Definitions ###
variable helperErrorList {};        # all errors get tossed into this list. The list can then be explored or cleared

##
# proc:  helperErrorsClear
# descr: clears the internal list of errors generated by the helper scripts
# @remark internal error errors clear erase remove delete
#
proc helperErrorsClear {} {
   variable helperErrorList;
   set helperErrorList {};
}
#lappend loadedProcs {helperErrorsClear "clears the internal list of errors generated by the helper scripts"};
##
# proc:  helperErrors
# descr: returns an unsorted, unfiltered copy of the list of errors
# @remark dump error errors get internal
# @return an unsorted, unfiltered copy of the list of errors
#
proc helperErrors {} {
   variable helperErrorList;
   return $helperErrorList;
}
#lappend loadedProcs {helperErrors "returns an unsorted, unfiltered copy of the list of errors"};
##
# proc:  helperErrorsCount
# descr: get the number of errors in the list
# @remark dump error errors get internal
# @return number of errors in the internal error list
#
proc helperErrorsCount {} {
   variable helperErrorList;
   return [llength $helperErrorList];
}
#lappend loadedProcs { helperErrorsCount "get the number of errors in the list"};
##
# proc:  helperErrorAdd
# descr: adds the argument to the internal error list
# @remark add error errors append
# @param errMsg
# @return none
#
proc helperErrorAdd { errMsg } {
   variable helperErrorList;
   set helperErrorList [lappend helperErrorList $errMsg]
   # errorMsg $errMsg;         # and add it to the log file - not needed as helperErrorAdd is called by errorMsg
}
#lappend loadedProcs { helperErrorsAdd "adds the argument to the internal error list" };

##
# Status - not fully validated, used in helper.tcl
# proc:  nextTerminator
# descr: comma separated list within the parenthesis
# @remark <list of searchable terms>
# @param str  (comma separated list)
# @return integer location of next terminator in the passed string (comma or closing parenthesis)
#
proc nextTerminator {str} {
   set nextCommaPos    [string first , $str];  # arguments are delimited by commas within the parenthesis
   set closingParenPos [string first ) $str]

   # if there is no comma or closing parenthesis, then we have a problem!
   if {$nextCommaPos < 0 && $closingParenPos < 0} {
      puts "@@@ helper.tcl - missing closing parenthesis!"
   } else {

      # is there a comma?
      if {$nextCommaPos > -1} {
         #set rtnStr [string range $str 0 $nextCommaPos]
       return $nextCommaPos
      } else {
         # no commas remain therefore this must close with a parenthesis
        #set rtnStr [string range 0 $closingParenPos]
       return $closingParenPos
      }
   }
   return -1;
}
#lappend loadedProcs {nextTerminator "returns integer location of next terminator in the passed string (comma or closing parenthesis)" };
##
# proc:  use
# descr: proc for doing wide range of configurable items
# @remark <list of searchable terms>
# @param thing
#
proc use { thing } {
   variable processor;
   variable hdfName;
   variable language;
   variable platform;
   variable userIO;
   variable ACAPactivePeripheralList;
   variable MPSoCactivePeripheralList;
   variable APSoCactivePeripheralList;
   variable activePeripheralList;
   variable usingQEMU;
   variable verbose;

   # if the variable is not yet in use, initialize it
   if {[info exists processor] == 0} { set processor undefined }
   if {[info exists hdfName] == 0}   { set hdfName   undefined }
   if {[info exists language] == 0}  { set language  undefined }
   if {[info exists platform] == 0}  { set platform  undefined }
   if {[info exists userIO] == 0}    { set userIO    base }
   if {[info exists usingQEMU] == 0} { set usingQEMU 0}

   if {$verbose} { puts "@@@ helper.tcl - setting environment to use $thing"; }

   # what kind of platform is being used? Determine the hdf name and type of processor
   if { [strsame $thing VCK190] } {
      set platform VCK190;
      set processor A72;
      if { ![strsame $processor MicroBlaze] } {

         set processor psv_cortexa72_0;                                 # validate - this is a guess

         if {[info exists ACAPactivePeripheralList]} {
           set activePeripheralList $ACAPactivePeripheralList;
         } else {
           puts "@@@ helper.tcl - Variable ACAPactivePeripheralList must be defined and filled with user defined peripherals.";
           puts "@@@ helper.tcl - In order to keep this script running, this variable will be defined, but not filled with any peripherals";
           set activePeripheralList {};
         }
      } else {
         # processor is a MicroBlaze
      }
      if {$verbose} { puts "@@@ helper.tcl - platform: $thing; using $processor" }

   } elseif { [strsame $thing VMK180] } {
      puts "@@@ helper.tcl - !!! Warning - settings still in validation!!! - VMK180 not officially supported, please select VCK190 or VCK190es";
      set platform VMK180;
      set processor A72;
      if { ![strsame $processor MicroBlaze] } {

         set processor psv_cortexa72_0;                                 # validate - this is a guess

         if {[info exists ACAPactivePeripheralList]} {
           set activePeripheralList $ACAPactivePeripheralList;
         } else {
           puts "@@@ helper.tcl - Variable ACAPactivePeripheralList must be defined and filled with user defined peripherals.";
           puts "@@@ helper.tcl - In order to keep this script running, this variable will be defined, but not filled with any peripherals";
           set activePeripheralList {};
         }
      } else {
         # processor is a MicroBlaze
      }
      if {$verbose} { puts "@@@ helper.tcl - platform: $thing; using $processor" }

   } elseif { [strsame $thing ZCU102] } {
      puts "@@@ helper.tcl - !!! Warning - ZCU102 not a generally supported board - do you mean ZCU104??? !!!"
      set platform ZCU102
      set processor A53
      puts "@@@ helper.tcl - Processor is $processor"
      if { ![strsame $processor MicroBlaze] } {
         if {$verbose} { puts "@@@ helper.tcl - platform: ZCU102; using A53" }
         set processor psu_cortexa53_0

         if {[info exists MPSoCactivePeripheralList]} {
           set activePeripheralList $MPSoCactivePeripheralList
         } else {
           puts "@@@ helper.tcl - Variable MPSoCactivePeripheralList must be defined and filled with user defined peripherals."
           puts "@@@ helper.tcl - In order to keep this script running, this variable will be defined, but not filled with any peripherals"
           set activePeripheralList {}
         }
      } else {
         # processor is a MicroBlaze
         if {$verbose} { puts "@@@ helper.tcl - platform: ZCU102; using uB" }
      }
   } elseif { [strsame $thing ZCU104] } {
      set platform ZCU104
      set processor A53
      puts "@@@ helper.tcl - Processor is $processor"
      if { ![strsame $processor MicroBlaze] } {
         if {$verbose} { puts "@@@ helper.tcl - platform: ZCU104; using A53" }
         set processor psu_cortexa53_0

         if {[info exists MPSoCactivePeripheralList]} {
           set activePeripheralList $MPSoCactivePeripheralList
         } else {
           puts "@@@ helper.tcl - Variable MPSoCactivePeripheralList must be defined and filled with user defined peripherals."
           puts "@@@ helper.tcl - In order to keep this script running, this variable will be defined, but not filled with any peripherals"
           set activePeripheralList {}
         }
      } else {
         # processor is a MicroBlaze
         if {$verbose} { puts "@@@ helper.tcl - platform: ZCU104; using uB" }
      }
   } elseif { [strsame $thing ZC702] } {
      #warningMsg "helper.use: ZC702 is a deprecated board for CustEd classes - consider if this is the proper target"
      set platform  ZC702
      if { ![strsame $processor "MicroBlaze"]} {
         if {$verbose} { puts "@@@ helper.tcl - platform: ZC702; using A9" }
         set processor ps7_cortexa9_0

         if {[info exists APSoCactivePeripheralList]} {
           set activePeripheralList $APSoCactivePeripheralList
         } else {
           puts "@@@ helper.tcl - Variable APSoCactivePeripheralList must be defined and filled with user defined peripherals."
           puts "@@@ helper.tcl - In order to keep this script running, this variable will be defined, but not filled with any peripherals"
           set activePeripheralList {}
         }
      } else {
         # processor is a MicroBlaze
         if {$verbose} { puts "@@@ helper.tcl - platform: ZC702; using uB" }
      }
   } elseif { [strsame $thing "Zed"] } {
      #warningMsg "helper.use: Zed is a deprecated board for CustEd classes - consider if this is the proper target"
      set platform  Zed
      if { ![strsame $processor "MicroBlaze"] } {
        if {$verbose} { puts "@@@ helper.tcl - platform: Zed; using A9" }
         set processor ps7_cortexa9_0

        # assign peripheral list
       if {[info exists APSoCactivePeripheralList]} {
          set activePeripheralList $APSoCactivePeripheralList
        } else {
          puts "@@@ helper.tcl - Variable APSoCactivePeripheralList must be defined and filled with user defined peripherals."
          puts "@@@ helper.tcl - In order to keep this script running, this variable will be defined, but not filled with any peripherals"
         set activePeripheralList {}
       }
     } else {
        # processor is a microblaze
       if {$verbose} { puts "@@@ helper.tcl - platform: Zed; using uB" }
     }
   } elseif { [strsame $thing KC705] } {
       set processor microblaze_0
       set platform  KC705
       puts "@@@ helper.tcl - !!! Deprecated board! (KC705) !!!"
   } elseif { [strsame $thing ZCU111] } {
      set processor zynq_ultra_ps_e_0
      set platform ZCU111;
      if {[info exists MPSoCactivePeripheralList]} {
         puts "@@@ helper.tcl - setting the peripheral list for this device"
         set activePeripheralList $MPSoCactivePeripheralList
      }
   } elseif {[strsame $thing "RFSoC"] } {
      set processor zynq_ultra_ps_e_0
      set platform ZCU111;
      if {[info exists MPSoCactivePeripheralList]} {
         puts "@@@ helper.tcl - setting the peripheral list for this device"
         set activePeripheralList $MPSoCactivePeripheralList
      }
   }  elseif { [strsame $thing "KC705"] } {
        set platform KC705
        #warningMsg "helper.use: KC705 is a deprecated board for CustEd classes - consider if this is the proper target"
   } elseif { [strsame $thing "KCU105"] } {
        set platform KCU105
        #warningMsg "helper.use: KCU105 is a deprecated board for CustEd classes - consider if this is the proper target"
   #} elseif { [strsame $thing "KC7xx"] } {
    #   set platform KC7xx
   } elseif {[strsame $thing "vhdl"] } {
        set language vhdl
   } elseif {[strsame $thing "verilog"] } {
        set language verilog
   } elseif {[strsame $thing "netlist"] } {
        set language netlist
   } elseif { [strsame $thing "base"] } {
      set userIO base
   } elseif { [strsame $thing "FMC-CE"] } {
      set userIO FMC-CE
      puts "@@@ helper.tcl - FMC-CE has been deprecated!"
   } elseif {[strsame $thing "A9"] } {
      set processor ps7_cortexa9_0
   } elseif {[strsame $thing "ps7_cortexa9_0"] } {
      set processor ps7_cortexa9_0
   } elseif {[strsame $thing "APU"] } {
      set processor A53
   } elseif {[strsame $thing "A53"] } {
      set processor A53
   } elseif {[strsame $thing "RPU"] } {
      set processor R5
   } elseif {[strsame $thing "R5"] } {
      set processor R5
   } elseif {[strsame $thing "PMU"] } {
      set processor MicroBlaze
   } elseif {[strsame $thing "MicroBlaze"] } {
      set processor MicroBlaze
   } elseif {[strsame $thing "microblaze_0"] } {
      set processor MicroBlaze
   } elseif {[strsame $thing "uB"] } {
      set processor MicroBlaze
   } elseif {[strsame $thing "QEMU"] } {
      set usingQEMU 1
   } else {
      puts "@@@ helper.tcl - Unknown use item! $thing"
      return
   }
}
#lappend loadedProcs {use "proc for doing wide range of configurable items"};
#
# make stopAfterStep
#    requires a list of list named "stepList"
#       structure is as follows: each list within stepList is a list of procs to be called
#    example of a lab which is comprised of 3 steps
#
# Example of how to create the stepList in the calling proc:
# set stepList {{step1_instruction1 step1_instruction2 step1_instruction3}\
#               {step2_instruction1}\
#               {step3_instruction1 step3_instruction2 step3_instruction3 step3_instruction4 step3_instruction5 step3_instruction6}
#              }
#
# makeStep only builds the specified step (unlike make which builds upto and including that step)
##
# proc:  makeStep
# descr: runs the procs described in the global stepList for only the specified step
# @remark make step build
# @param stepToDo
#
proc makeStep {stepToDo} {
   variable stepList;
   variable verbose;
   if { $verbose } { infoMsg "helper.makeStep $stepToDo" }

   # subtract one as the list begins at 0 and users will start at 1
   set stepToDo [expr $stepToDo - 1]

   # is it a legal step?
   set nSteps [llength $stepList]
   if {[llength $stepList] >= $stepToDo} {
      # extract the instruction list from the stepList
      set theseInstructions [lindex $stepList $stepToDo]
      if {$verbose} { infoMsg "iterating step $stepToDo which consists of the following instructions: $theseInstructions"; }

      # loop through the instructions included in this step
      for {set j 0} {$j < [llength $theseInstructions]} {incr j} {
         set hasArguments 0;
         set argList {};
         set thisInstruction [lindex $theseInstructions $j];
         infoMsg "running this instruction: $thisInstruction"
         # separate out the arguments if present
         if {[strContains $thisInstruction (]} {
            if {$verbose} { infoMsg "instruction has arguments"; }
            set hasArguments 1

            # extract just the instruction
            set instructionEndPos [string first ( $thisInstruction]
            set instruction [string range $thisInstruction 0 [expr $instructionEndPos - 1]]
            if {$verbose} { infoMsg "the instruction itself is just $instruction"; }
            # loop until closing parenthesis is found
            set remainingArgList [string range $thisInstruction [expr $instructionEndPos + 1] [string length $thisInstruction]]
            set thisInstruction $instruction
            while {[string length $remainingArgList] > 0} {
               set next [nextTerminator $remainingArgList]
               set thisArg [string range $remainingArgList 0 [expr $next - 1]]
               if {$verbose} { infoMsg "just extracted the following argument: $thisArg"; }
               lappend argList $thisArg;
               append thisInstruction " " $thisArg
               if {$verbose} { infoMsg "building the string to run: $thisInstruction"; }
               set remainingArgList [string range $remainingArgList [expr $next + 1] [string length $remainingArgList]]
               puts "@@@ helper.tcl - Remaining arguments: $remainingArgList";
            }
         } else {
            if {$verbose} { infoMsg "instruction does not have arguments"; }
         }

         # debug: may need to handle instructions with arguments differently...
         if {$verbose} { infoMsg "Attempting to launch the following instruction: $thisInstruction"; }
         if {$hasArguments} {
            set cmd "";
            if {$verbose} { puts "@@@ helper.tcl - attempting to eval the command and it's argument(s): $thisInstruction"; };
            for {set argNum 0} {$argNum < [llength $argList]} {incr argNum} {
               set thisVar [lindex $argList $argNum];
               set thisVar [string range $thisVar 1 [string length $thisVar]]; # get rid of the $ in front of the variable name
               puts "@@@ helper.tcl - creating variable $thisVar";
               append cmd "variable $thisVar; ";
            }
            append cmd $thisInstruction;
            if {$verbose} { puts "@@@ helper.tcl - going to eval command and args: $cmd"; }
            [eval $cmd];
         } else {
            if {$verbose} { puts "@@@ helper.tcl - running: $thisInstruction"; }
            $thisInstruction;
         }

         if {$verbose} { infoMsg "done running the instruction, on to the next..."; }
      }
   } else {
      infoMsg "Invalid step number: $stepToDo"
   }

  markLastStep makeStep;
}
#lappend loadedProcs { makeStep "runs the procs specified in the global variable stepList only for the step specified in the argument" };
##
# proc:  make
# descr: uses list of lists to carry step and instruction information. If an instruction requires arguments it is enclosed by comma separated parenthesis
# @remark make build run proc
# @param stopAfterStep
#
proc make {stopAfterStep} {
   variable verbose;
   if { $verbose } { infoMsg "helper.make will stop after step: $stopAfterStep" }
   variable stepList;

   if {![logIsOpen]} {
      if {$verbose} { puts "@@@ helper.tcl - *** opening log file! ***"; }
      logOpen "helper.log"; # open the log file if it is not already open for recording any issues...
   }

   if {[strsame $stopAfterStep all]} {
      set stopAtStepN [llength $stepList]
      if {$verbose} {
         infoMsg "All detected. Changed to stop after step number $stopAtStepN. This includes all instructions within each step."
      }
   } else {
      # what is the number of the step to stop after?
      set stopAtStepN [extractIntegerFromString $stopAfterStep]
      if {$verbose} { infoMsg "stopping after $stopAtStepN";}
   }

   # is stopAfterStep within the total number of available taskLists?
   if {[llength $stepList] >= $stopAtStepN} {
      # process all tasks for all the lists below and including this stepList (that is, loop through all selected steps)
      for {set i 0} {$i < $stopAtStepN} {incr i} {

         set humanStep [expr $i + 1];
         if {$verbose} { puts "@@@ helper.tcl - calling makeStep for step #$humanStep"; }
         makeStep $humanStep;

         # # extract the instruction list from the stepList
         # set theseInstructions [lindex $stepList $i]
         # if {$verbose} { infoMsg "iterating step [expr $i + 1] which consists of the following instructions: $theseInstructions"; }

         # # loop through the instructions included in this step
         # for {set j 0} {$j < [llength $theseInstructions]} {incr j} {
            # set hasArguments 0;
            # set thisInstruction [lindex $theseInstructions $j];
            # infoMsg "running this instruction: Step [expr $i+1].[expr $j+1]:$thisInstruction";
            # set commandAndArgumentString "";

            # # separate out the arguments if present
            # if {[strContains $thisInstruction (]} {
               # set hasArguments 1;
               # if {$verbose} { puts "@@@ helper.tcl - argument(s) found!"; };
               # # extract just the instruction
               # set instructionEndPos [string first ( $thisInstruction];   # locate where the opening parenthesis is
               # set instruction [string range $thisInstruction 0 [expr $instructionEndPos - 1]]; # strip out the instruction
               # append commandAndArgumentString $instruction " {"; # start building the special command and argument string
               # if {$verbose} { infoMsg "the instruction itself is just $instruction and the under-construction cmd and arg is $commandAndArgumentString"; }
               # # loop until closing parenthesis is found
               # set remainingArgList [string range $thisInstruction [expr $instructionEndPos + 1] [string length $thisInstruction]]; # get the argument(s) and closing parenthesis
               # while {[string length $remainingArgList] > 0} {
                  # set next [nextTerminator $remainingArgList];     # nextTerminator return the location of either the next comma, or closing parenthisis
                  # set thisArg [string range $remainingArgList 0 [expr $next - 1]];
                  # infoMsg "checking if $thisArg is literal or a variable";
                  # if {[strStartsWith $thisArg {$}]} {
                     # # treat the value of $thisArg as the new argument
                     # #set thisArg [indirect $thisArg];      # this seems to have been obsoleted.
                     # set thisArg *;                         # we need to tell the receiving function that this was processed as a string instead of passing the actual thing itself
                     # append thisArg [join $thisArg];           # this converts the argument into a simple string. if we do this, then whatever function gets this will need to ensure that it handles it properly

                     # puts "@@@ helper.tcl - make - thisArg is $thisArg";;

                     # # # expand the argument (i.e. do an indirect - what does this variable hold?)
                     # # infoMsg "it's a variable that needs to be expanded: "
                     # # warningMsg "thisArg = $thisArg"
                     # # set indirectedValue [subst $thisArg]
                     # # warningMsg "subst thisArg = $indirectedValue]"
                     # # infoMsg ">>> [strStripFirstAndLast [subst $thisArg]]"
                     # # # variable [strStripFirstAndLast [subst $thisArg]]
                     # # variable $indirectedValue;
                     # # set thisArg [strStripFirstAndLast [subst $thisArg]]
                     # # infoMsg "value of $thisArg is $value"
                  # } else {
                     # # no expansion needed
                     # #set thisArg $thisArg
                  # }
                  # if {$verbose} { infoMsg "just extracted the following argument: $thisArg"; }
                  # append commandAndArgumentString " " $thisArg; # append this argument to the string under construction
                  # if {$verbose} { infoMsg "building the string to run: $thisInstruction"; }
                  # set remainingArgList [string range $remainingArgList [expr $next + 1] [string length $remainingArgList]]
                # }
               # append commandAndArgumentString " }";     # close the list
            # }
            # # debug: may need to handle instructions with arguments differently...
            # if {$verbose} { infoMsg "Attempting to launch the following instruction: $thisInstruction"; }
            # if {$verbose} { infoMsg "Attempting to launch the following command and argument: $commandAndArgumentString"; }
            # if {$hasArguments} {
               # eval $commandAndArgumentString
            # } else {
               # $thisInstruction
            # }
            # if {$verbose} {
               # # see if there are more instruction to process...
               # if {$j < [expr [llength $theseInstructions] - 1]} {
                  # infoMsg "done running this instruction, on to the next...";
               # } else {
                  # if {$i < [expr $stopAtStepN - 1]} {
                     # infoMsg "no more instructions in this step, on to the next step...";
                  # } else {
                     # infoMsg "no more steps. moving to complete...";
                  # }
               # }
            # };      # end of debug block to determine what instructions and steps come next.
         # };         # end of instruction processing
         doneWithStep [expr $i + 1]
      }
      boxedMsg "Done with \"Make\"";
    } else {
       infoMsg "Specify the level to which you want the lab re-built to:";
       infoMsg "   n | Sn | Stepn - builds to the end of Step n (<[llength $stepList])"
       infoMsg "   All - builds all steps"
    }
    if {[logIsOpen]} { logClose; };  # close the log file if it is not already open for recording any issues...
}
#lappend loadedProcs { makeStep "runs the procs specified in the global variable stepList only for the step specified in the argument" };
##
# proc:  doneWithStep
# descr: graphic reminder that the section of the script has completed
# @remark <list of searchable terms>
# @param n - step number is argument
#
proc doneWithStep { n } {
   print "**************************";
   print "*  Done Running Step $n *";
   print "**************************";
}
#lappend loadedProcs { doneWithStep "internal call used by make and makeStep to indicate completion of a command list"; }
##
# proc:  pause
# descr: prompts user to press a key to continue. proc returns after key-press
# @remark wait, user, input, pause
#
proc pause {} {
    # puts -nonewline message "Hit Enter to continue ==> "
    puts -nonewline "Hit Enter to continue ==> "
    flush stdout
    gets stdin
}
#lappend loadedProcs { pause "prompts user to press a key to continue. proc returns after key-press" }
##
# proc:  sleep
# descr: sleep for N seconds
# @remark wait, user, sleep
#
proc sleep {N} {
    after [expr {int($N * 1000)}]
}
#lappend loadedProcs { sleep "delay for N seconds" };
#


##
# proc:   getPathToJava
# descr:  identifying the newest version of JRE assuming that java was installed into one of the two default directories
#         optionally uses environment variable: javaPreferred. this allows user to specify specific version and saves search time
# notes:  Linux system do not (yet) perform a directory search. Windows will search only in Program Files and Program Files (x86)
# @remark   java, jre, jdk, path, windows, linux, javaPreferred
# @return single path to the latest version of java OR value of environment variable: javaPreferred, if defined
#
proc getPathToJava {} {
   variable hostOS;

   # check to see if there is a user prefered version of java
   if {[catch {set manualPathToJava $::env(javaPreferred)} result]} {
      puts "@@@ helper.tcl - the javaPreferred environment variable is absent, so a search of the system will be done to find the latest version of java.";
   } else {
      puts "@@@ helper.tcl - the user prefers: $manualPathToJava";
      regsub -all {\\} $manualPathToJava / manualPathToJava;
      if {[fileExists $manualPathToJava]} {
         puts "@@@ helper.tcl - and the file exists, so we're sending it's path back...";
         return $manualPathToJava;
      } else {
         puts "@@@ helper.tcl - $manualPathToJava was selected through the environment variable javaPreferred, but it does not exist! Will perform the search for a Java executable.";
      }
   }

   # if we've gotten here, then the manual path was not specified. We now have to figure out where to start
   # looking as this is going to be OS dependent
   # if { $hostOS != "Windows" } { return "/usr/bin/java" }

   set allJavaDirs {};
   set maxVal "";
   set maxLength 0;
   if {$hostOS == "Windows"} {
      set javaDirs86 [glob -directory "c:/Program Files (x86)/Java" -type d -nocomplain *];
      set javaDirs   [glob -directory "c:/Program Files/Java" -type d -nocomplain *];
      append allJavaDirs $javaDirs " " $javaDirs86;
   } else {
      puts "@@@ helper.tcl - todo: helper.tcl.getPathToJava - Linux search for java";
      #set vitisJava $::env(VITIS_PATH)/tps/lnx64;
      #set javaVitis [glob -directory $vitisJava -type d -nocomplain *];
      #set javaEtc [glob -directory "/etc" -type d -nocomplain *];
      #append allJavaDirs $javaVitis " " $javaEtc;
   }

   # allJavaDirs will contain a mix of jres and jdks. we need to look at both...
   set cleanListOfJREs {};
   set cleanListOfJDKs {};
   foreach dir $allJavaDirs {
      set dirList [hierarchyToList $dir];
      set dirName [lindex $dirList [expr [llength $dirList] - 1]];

      set type [string range $dirName 0 2];
      if {[strsame $type jre]} { lappend cleanListOfJREs $dir; };
      if {[strsame $type jdk]} { lappend cleanListOfJDKs $dir; };
   }

   # were any Java directories found? If not, we can't continue!
   set nothingFound true;
   if {[llength $cleanListOfJDKs] > 0} { set nothingFound false; };
   if {[llength $cleanListOfJREs] > 0} { set nothingFound false; };

   if { $nothingFound } {
     errorMsg "helper.tcl:getPathToJava:No Java installation found! Cannot continue!";
     errorMsg "helper.tcl:getPathToJava:Please install Java JRE/JDK in its default location!";
     errorMsg "helper.tcl:getPathToJava:go to Java.com and download the free tool";
     return "";
   };

   # if some directories were found, then we can continue...

   # JDKs are numbered as follows jdk-<release>.<major>.<minor>
   if {[llength $cleanListOfJDKs] > 0} {
      set maxJDKpath "";
      set maxJDKversion "";
      foreach dir $cleanListOfJDKs {

         # isolate just the directory name from the full path
         set firstIndex [string first jdk- $dir];
         set version    [string range $dir $firstIndex [string length $dir]];

         # compare this trimmedVersion to the previous one - if it is greater, then update both the maxTrimmed and maxJDKpath
         if {[string compare $version $maxJDKversion] > 0 } {
            set maxJDKversion $version;
            set maxJDKpath    $dir;
         }
      }

      # convert the JDK into a class code
      set firstDashLoc  [string first "-" $maxJDKversion 0];
      set firstDotLoc   [string first "." $maxJDKversion [expr $firstDashLoc + 1]];
      set jdkMajor [string range $maxJDKversion [expr $firstDashLoc + 1] [expr $firstDotLoc - 1]];
      switch $jdkMajor {
         "14" { set jdkCode 58; }
         "13" { set jdkCode 57; }
         "12" { set jdkCode 56; }
         "11" { set jdkCode 55; }
         "10" { set jdkCode 54; }
         "9"  { set jdkCode 53; }
         "8"  { set jdkCode 52; }
         "7"  { set jdkCode 51; }
         "6"  { set jdkCode 50; }
         "5"  { set jdkCode 49; }
         default {
           puts "@@@ helper.tcl - Could not find JDK code for version $jdkMajor";
           set jdkCode 59;           # probably not found because it is newer
         }
      }
   } else {
      set jdkCode 0;
   }

   # JREs are numbered as follows jre<release>.<major>.<minor>_<#>
   if {[llength $cleanListOfJREs] > 0} {
      set maxJREpath "";
      set maxJREversion "";
      foreach dir $cleanListOfJREs {
         # isolate just the directory name from the full path
         set firstIndex [string first jre1 $dir];
         set version    [string range $dir $firstIndex [string length $dir]];

         # compare this trimmedVersion to the previous one - if it is greater, then update both the maxTrimmed and maxPath
         if {[string compare $version $maxJREversion] > 0 } {
            set maxJREversion $version;
            set maxJREpath    $dir;
         }
      }

      # convert the JRE into a class code
      set firstDotLoc  [expr [string first "." $maxJREversion 0] + 0];
      set secondDotLoc [string first "." $maxJREversion [expr $firstDotLoc + 1]];
      set jreMajor     [string range $maxJREversion [expr $firstDotLoc + 1] [expr $secondDotLoc - 1]];
      switch $jreMajor {
         "14" { set jreCode 58; }
         "13" { set jreCode 57; }
         "12" { set jreCode 56; }
         "11" { set jreCode 55; }
         "10" { set jreCode 54; }
         "9"  { set jreCode 53; }
         "8"  { set jreCode 52; }
         "7"  { set jreCode 51; }
         "6"  { set jreCode 50; }
         "5"  { set jreCode 49; }
         default {
           puts "@@@ helper.tcl - Could not find JRE code for version $jreMajor";
           set jreCode 59;           # probably not found because it is newer
         }
      }
   } else {
      set jreCode 0;
   }

   # compare class codes
   if {$jdkCode > $jreCode} {
      puts "@@@ helper.tcl - Using java at $maxJDKpath/bin";
      set useJavaAt "$maxJDKpath/bin/java";
   } else {
      set useJavaAt  "$maxJREpath/bin/java";
   }

   # is it windows or linux?
   if {$hostOS == "Windows"} {
      append useJavaAt ".exe";
   }

   return $useJavaAt;
}
#lappend loadedProcs {getPathToJava "uses environment variable javaPreferred as the path - if absent, it attempts to find the newest version of Java." }


##
# proc:  runDedScript
# descr: proc for launching the directed editor
# @remark  directed, editor, ded, edit
# @param path_to_source
# @param path_to_script
# todo: return a value indicating if the edit was successful or not
#
proc runDedScript {path_to_source path_to_script} {
   variable java
   variable tools
   set java [getPathToJava]
   set arguments ""
   append arguments $path_to_source "," $path_to_script
   regsub -all {' '} $arguments ',' arguments
   infoMsg $arguments
   exec $java -jar $tools/directedEditor.jar $path_to_source $path_to_script
}
##
# proc:  runDedScriptExtra
# descr:
# @remark <list of searchable terms>
# @param path_to_source
# @param path_to_script
# @param path_to_destination
#
proc runDedScriptExtra {path_to_source path_to_script path_to_destination} {
   variable java
   variable tools
   set java [getPathToJava]
   set arguments ""
   append arguments $tools/directedEditor.jar "," $path_to_source "," $path_to_script
   regsub -all {' '} $arguments ',' arguments
   infoMsg $arguments
   exec $java -jar $tools/directedEditor.jar $path_to_source $path_to_destination
}
##
# proc:  runDedScriptExtra
# descr:
# @remark <list of searchable terms>
# @param commaSeparatedArgList
#
proc runDedScript {commaSeparatedArgList} {
   variable java
   variable tools
   set java [getPathToJava]
   #set arguments ""
   #append arguments $tools/directedEditor.jar $commaSeparatedArgList
   infoMsg $commaSeparatedArgList
   exec $java -jar $tools/directedEditor.jar $commaSeparatedArgList
}
# assumes toolName contains full path
# warning: this can be pretty picky with quotes in the argument list
##
# proc:  runJava
# descr:
# @remark <list of searchable terms>
# @param toolName
# @param arguments
#
proc runJava {toolName arguments} {
   variable verbose
   set verbose 1
   set java [getPathToJava]
   # iterate through the arguments list
   if {$verbose} {
      puts "@@@ helper.tcl - listing passed arguments...$arguments"
      puts "@@@ helper.tcl - now individually: "
   }
   set argumentString ""
   set argCount 0
   foreach argument $arguments {
      if {$verbose} { puts "@@@ helper.tcl - $argCount: $argument" }
      append argumentString $argument
      incr argCount
      if {$argCount < [llength $arguments]} {
         append argumentString ","
      }
   }
   if {$verbose} {
      puts "@@@ helper.tcl - argument string is $argumentString"
      puts "@@@ helper.tcl - java location: $java"
      puts "@@@ helper.tcl - tool name with path: $toolName"
   }
   puts "@@@ helper.tcl - getting ready to run the tool"
   # catch any errors to avoid breaking the calling routine
   if {[catch {exec $java -jar $toolName $argumentString} resultText]} {
      puts "@@@ helper.tcl - failed execution: $::errorInfo"
   } else {
      puts "@@@ helper.tcl - successful execution - application returned $resultText"
   }
}
#########################################################################
# proc for launching the choicesGUI
#########################################################################
##
# proc:  runChoicesGUI
# descr:
# @remark <list of searchable terms>
# @param path_to_source
# @param argList
#
proc runChoicesGUI {path_to_source argList} {
   variable java
   set java [getPathToJava]
   exec $java -jar $path_to_source $argList
}
#########################################################################
# proc for fixing slashes from Windows to Linux
#########################################################################
##
# proc:  fixSlashes
# descr:
# @remark <list of searchable terms>
# @param path
#
proc fixSlashes {path} {

   # replace below with the following and verify
   regsub -all {\\} $path / path

   # set len [string length $path]
   # for {set i 0} {$i < $len} {incr i} {
      # set c [string index $path $i]
      # if {$c == "\\"} {
         # set path [string replace $path $i $i "/"]
      # }
   # }
   return $path
}

##
# proc:  unfixSlashes
# descr: fixes slashes from Linux to Windows
# @remark <list of searchable terms>
# @param path
#
proc unfixSlashes {path} {

   # replace below with the following and verify
   regsub -all / $path {\\} path

   return $path
}

##
# proc:  invertLogic
# descr: inverts the passed logic value
# @remark invert binary
# @param x - string representing the logical value
# @return "yes"  if "no" is passed and visa-versa
#           "1"    if "0"  is passed and visa-versa
#           "true" if "false" is passed and visa-versa
#
proc invertLogic {x} {
   if {[strsame $x "yes"]} {
      return "no"
   } elseif {[strsame $x "no"]} {
      return "yes"
   } elseif {$x != 0} {
      return 1
   } elseif {$x == 0} {
      return 1
   } elseif {[strsame $x "true"]} {
      return "false"
   } elseif {[strsame $x "false"]} {
      return "true"
   } else {
      return "?"
   }
}
##
# proc:  logicValue
# descr: returns 1 or 0 based on x
# @remark binary equivalent true false yes no
# @param x - string to test (case insensitive)
# @return a 1 when x is yes, true, or 1; 0 otherwise
#
proc logicValue {x} {
   if {[strsame $x "yes"]} {
      return 1
   } elseif {[strsame $x "true"]} {
      return 1
   } elseif {[strsame $x "1"]} {
      return 1
   }
   return 0
}
##
# proc:  markLastStep
# descr: marks (remembers) the step that was just completed (internal only)
# @remark <list of searchable terms>
# @param lastStepName
#
proc markLastStep { lastStepName } {
   variable lastStep
   set lastStep $lastStepName
}
##
# proc:  getLastStep
# descr: returns the last successfully executed step (internal use only)
# @remark <list of searchable terms>
# @return last set step value
#
proc getLastStep {} { variable lastStep; return $lastStep }
##
# proc:  getLanguage
# descr: returns the selected language (set by "use")
# @remark discover language retrieve
# @return string represting the selected language as set by "use" proc
#
proc getLanguage {} { variable language; return $language }

##
# proc:  boxedMsg
# descr: dumps message to the log file and terminal surrounded by asterisks
# history:
#    centered - 11/04/2016 WK
#    todo: - add wrap
# @remark pretty box message display
# @param x - message to display
#
proc boxedMsg { x } {
   set minWidth 50

   # how wide is the message?
   # future - adjust for cr/lfs in the msg (wrap)
   set xWidth [string length $x]
   # 5 for the leading 2 *s, 2 for the trailing *s, 1 for the each space btwn * and msg
   set totalWidth [expr $xWidth + 2 + 2 + 2]

   # ensure that there is a minimum width
   if {$totalWidth < $minWidth} { set totalWidth $minWidth }

   # build the top 2 lines (blank line and all asterisks)
   print ""
   set allAsterisks [repeat * $totalWidth]
   print "\t$allAsterisks"

   # 3rd line is asterisks at front and back of line
   set blankedLine ""
   append blankedLine "**" [repeatChar " " [expr $totalWidth - 4]] "**"
   print "\t$blankedLine"

   # 4th line contains the message
   # if smaller than minWidth, then center in the fields
   # first half is totalWidth/2 - "** " - half of the msg width
   set firstHalfBuffer  [expr $totalWidth / 2 - 3 - $xWidth / 2]
   # second half is what ever is left over to account for rounding: including "**" and "**" and whole word
   set secondHalfBuffer [expr $totalWidth - $firstHalfBuffer - $xWidth - 6]
   set msgLine ""
   append msgLine "\t** " [repeatChar " " $firstHalfBuffer] $x [repeatChar " " $secondHalfBuffer] " **"
   print "$msgLine"

   # finish up with what we started with
   print "\t$blankedLine"
   print "\t$allAsterisks"
   print ""
}
#lappend loadedProcs {xxx "9"};


##
# proc:  latestVersion
# descr: identifies the newest version of the named IP
# @remark version, IP, newest
# @param IPname
# @return the newest version of that IP
#
proc latestVersion { IPname } {
   # find the package type
   set packageTypes {iclg }
   set lastPos [strLastIndex $IPname :]; # strip off everything beyond the third colon (as this contains the version info)
   set IPnameNoVer [string range $IPname 0 $lastPos]

   set listOfAllIP [get_ipdefs]
   foreach pieceOfIP $listOfAllIP {
      set lastPos [strLastIndex $pieceOfIP :]; # strip off everything beyond the third colon (as this contains the version info)
      set pieceOfIPnoVer [string range $pieceOfIP 0 $lastPos];
      if {[string compare $pieceOfIPnoVer $IPnameNoVer] == 0} {
         return $pieceOfIP
      }
   }
}
##
# proc:  latestBoardVersion
# descr: identifies the newest version of the named board
# @remark version, board, newest
# @param boardName
# @return the newest version of the specified board
#
proc latestBoardVersion { boardName } {
   variable verbose;
   # sometimes there is a "part x:" string in there which really doesn't belong. If the word "part" is in there, get rid of it.
   set partLoc [expr [string first part $boardName] - 1];   # get to the beginning of "part"
   if {$partLoc != -1} {
      set colonLoc [expr $partLoc + 7];    # "part" + $ + ":" = 6
      set tempBoardName [string range $boardName 0 $partLoc];
      append tempBoardName [string range $boardName $colonLoc [string length $boardName]];
      set boardName $tempBoardName;
   }

   # remove the version information
   set lastPos [expr [strLastIndex $boardName :] - 1]; # strip off everything beyond the third colon (as this contains the version info)
   set boardNameWoVer [string range $boardName 0 $lastPos];

   set listOfAllBoards [get_boards];
   foreach board $listOfAllBoards {
      set lastPos [expr [strLastIndex $board :] - 1]; # strip off everything beyond the third colon (as this contains the version info)
      set boardWoVer [string range $board 0 $lastPos];
      #puts "@@@ helper.tcl - comparing: $boardWoVer to $boardNameWoVer";
      if {[string compare $boardWoVer $boardNameWoVer] == 0} {
         return $board;
      }
   }
   if {$verbose} { puts "@@@ helper.tcl - latestBoardVersion: could not update the board version $boardName - may not be supported"; }
}

##
# proc:  supportedPart
# descr: checks if the specified part is supported. If not, and it is an es part, then check if a non-es part is supported
# @remark version, part, device, newest, es, non-es
# @param partName
# @return the newest version of the specified part
#
proc supportedPart { partName } {
   # is this part in the list
   set listOfAllParts [get_parts];
   if {[lsearch $listOfAllParts $partName] != -1} {
      return $partName;
   } else {
      # was it not found because it was an es part?
      set esLoc [string last -e-S $partName];
      if { $esLoc != -1} {
         # this is NOT an es part - something else is wrong
         puts "@@@ helper.tcl - $partName *NOT* found in the list of parts for this tool installation. The could be due to either a bad part number or the parts library containing this part may not have been loaded.";
         return "part not found: $partName";
      } else {
         # it is an ES part, strip the ES and look up the part
         set newPartName [string range $partName 0 $esLoc];
         if {[lsearch $listOfAllParts $newPartName] != -1} {
            # yes, the no-ES version of the part was found, return it
            return $newPartName;
         } else {
            # no, something else happened
            puts "@@@ helper.tcl - $partName *NOT* found in the list of parts for this tool installation. The could be due to either a bad part number or the parts library containing this part may not have been loaded.";
            return "part not found: $partName";
         }
      }
   }
}

##
# proc:  closestPart
# descr:
# proc for identifying the closest part number
# pass in a partial part name and this function will return the first match of this part
# matches to core part minus speed grade, temp grade, es, etc.
# this is useful when a specific part is not required, rather only a member of a family
# and size
# todo: add wildcards
# @remark <list of searchable terms>
# @param partNumber
#
proc closestPart { partNumber } {
   # before we go through the lengthly process of searching, is this part already in the list?
   set partList [get_parts]
   set exactResult [lsearch $partList $partNumber]
   if {$exactResult > -1} {
      return $partNumber;
   }

   # list of known packages
   set packages {clg iclg sclg ifbg isbg sbg fbg fbv ifbv iffg iffv fbg ffg ffv cl rf rb ffvb ffvc ffvd sfva sfvc}

   # strip off the package id
   foreach thisPkg $packages {
      # set pkgPos [strLastIndex $partNumber $packages]; # look for this package in the part
      # if pkgPos > -1 means that it's found
      set pkgPos [strLastIndex $partNumber $thisPkg]
      if {$pkgPos > -1} {
       set partialPart [substr $partNumber 0 $pkgPos]
         append partialPart "*"
         # now find the first partial match...
         set fullPartPosition [lsearch $partList $partialPart]
         set fullPart [lindex $partList $fullPartPosition]
         return $fullPart
      }
   }
   return "???"
}
#lappend loadedProcs {xxx "10"};


##
# proc:  callingProcName
# descr:
# @remark <list of searchable terms>
# @return the name of the proc this proc is called from
#
proc callingProcName {} {
   set trace [strace]
   set thisLevel [info level]
   # since trace is still sitting on the stack we have to go up two instead of one
   set upTwoLevels [expr $thisLevel - 2]
   set thisLevelName [lindex $trace $upTwoLevels]
   return $thisLevelName
}

##
# proc:  dumpStack
# descr:
# @remark <list of searchable terms>
#
proc dumpStack {} {
    set trace [strace]
    puts "@@@ helper.tcl - Trace:"
    foreach t $trace {
        puts "@@@ helper.tcl - * ${t}"
    }
}

##
# proc:  strace
# descr:
# @remark <list of searchable terms>
#
proc strace {} {
    set ret {}
    set r [catch {expr [info level] - 1} l]
    if {$r} { return {""} }
    while {$l > -1} {
        incr l -1
        lappend ret [info level $l]
    }
    return $ret
}

##
# proc:  getScriptLocation
# descr:
# @remark <list of searchable terms>
#
proc getScriptLocation {} {
   variable myLocation
   return [file dirname $myLocation]
}



##
# proc:  msSleep
# descr: requires Tcl 8.4
# @remark sleep delay wait milli second
# @param ms
#
proc msSleep { ms } {
     after $ms;
 }

##
# proc:  randName
# descr: creates a random string of length
# @remark <list of searchable terms>
# @param len
# @return returns a string of random letters and number of the specified len
#
proc randName {len} {
   set retStr ""
   for {set i 0} {$i<$len} {incr i} {
      set value [expr int(rand()*127)]
      set char [format %c $value]
      if {(($value >= 48) && ($value <=  57) && ($i > 0)) ||
          (($value >= 65) && ($value <=  90)) ||
           (($value >= 97) && ($value <= 122)) } {
          # this is a legal symbol and should be appended to the return string
         append retStr $char
      } else {
        # this is an illegal symbol and should be skipped
        incr i -1;
      }
   }
   return $retStr;
 }


##
# proc:  find7z
# descr:
# @remark zip compress 7zip 7z locate find
# @return the path to 7z including the executable name or dumps an error on failure
#
proc find7z {} {
   # point to the 7zip tool which may be called if there is unzipping to be done

   # because it takes so @#$% long to search (which also kicks up a lot of stuff on the screen) we can short-circuit
   # this search by starting in the directory pointed to by 7zPath. If it's not found, then we can fall back to the old search
   if {[info exists ::env(7zPath)]} {
      set 7zPath $::env(7zPath);                # since the environment variable exists, assume that it's ok and assign it to a local variable
      regsub -all {\\} $7zPath / 7zPath;        # make sure the hierarchy separators work for Tcl
      set zipToolExe $7zPath/7z.exe;            # generate the path to the tool
      if {[file exist $zipToolExe]} {
         return $zipToolExe;
      } else {
         errorMsg "find7z - could not locate 7z tool at the given environment variable path $7zPath";
         return "";
      }
   }

   # no environment variable, so we need to do it the hard way...
   set zipTool [findFiles {c:/Program Files (x86)} 7z.exe 1];      # assumes default location
   if {[llength $zipTool] == 0} {
      set zipTool [findFiles {c:/Program Files} 7z.exe 1];         # assumes the other default location
   }

   # was anything found?
   if {[llength $zipTool] == 1} {
      set zipToolExe [lindex $zipTool 0];
      return $zipToolExe;
   } else {
      errorMsg "find7z - could not locate 7 zip utility in the default installation site"
   }

   return "";
}

##
# proc:  zipIt
# descr: uses find7z to locate the zipTool/zip tool then attempts to zip srcDirName
#   into a zip file given by destFileName.
# @remark <list of searchable terms>
# @param srcDirName
# @param destFileName
#
proc zipIt {srcDirName destFileName} {
   # point to the 7zip tool which may be called if there is unzipping to be done
   set zipTool [find7z]

   # confirm that the source is valid
   if {[isDirectory $srcDirName]} {
      exec $zipTool a -tzip $destFileName $srcDirName;           # zip it!
   } else {
      warningMsg "zipIt - source directory not found: $srcDirName"
   }
}
# same a zipIt, but with a flat directory structure
proc zipItFlat {srcDirName destFileName} {
   # point to the 7zip tool which may be called if there is unzipping to be done
   set zipTool [find7z]

   # confirm that the source is valid
   if {[isDirectory $srcDirName]} {
      exec $zipTool a -tzip $destFileName $srcDirName/*;           # zip it!
   } else {
      warningMsg "zipIt - source directory not found: $srcDirName"
   }
}
#lappend loadedProcs {xxx "12"};

##
# proc:  numberOfCPUs
# descr: stolen from: https://stackoverflow.com/questions/29482303/how-to-find-the-number-of-cpus-in-tcl
# @remark <list of searchable terms>
# @return the number of processors available in this environment regardless of os
#
proc numberOfCPUs {} {
    # Windows puts it in an environment variable
    global tcl_platform env
    if {$tcl_platform(platform) eq "windows"} {
        return $env(NUMBER_OF_PROCESSORS)
    }

    # Check for sysctl (OSX, BSD)
    set sysctl [auto_execok "sysctl"]
    if {[llength $sysctl]} {
        if {![catch {exec {*}$sysctl -n "hw.ncpu"} cores]} {
            return $cores
        }
    }

    # Assume Linux, which has /proc/cpuinfo, but be careful
    if {![catch {open "/proc/cpuinfo"} f]} {
        set cores [regexp -all -line {^processor\s} [read $f]]
        close $f
        if {$cores > 0} {
            return $cores
        }
    }

    # No idea what the actual number of cores is; exhausted all our options
    # Fall back to returning 1; there must be at least that because we're running on it!
    return 1
}
lappend loadedProcs {numberOfCPUs "Returns the number of available CPUs in this environment"};
##
# proc:  militaryMonthName
# descr:
# @remark calendar month name abbreviated
# @param monthNumber (1-12)
# @return military style month name (capitalized three letter month name)
#
proc militaryMonthName {monthNumber} {
   switch $monthNumber {
      1  { return JAN }
      2  { return FEB }
      3  { return MAR }
      4  { return APR }
      5  { return MAY }
      6  { return JUN }
      7  { return JUL }
      8  { return AUG }
      9  { return SEP }
      10 { return OCT }
      11 { return NOV }
      12 { return DEC }
      default { return ???; }
   }
}
lappend loadedProcs {militaryMonthName "Returns the miliarty 3 letter month name"};
##
# proc:  getScriptName
# descr: returns the name of the script that is currently running
# @remark  script name tcl
# @return name of currently running script
#
proc getScriptName {} {
   set fullScriptPath [info script];
   set onlyScriptName [getLastHierarchy $fullScriptPath];
   return $onlyScriptName
}
lappend loadedProcs {getScriptName "Returns the name of the script that is currently running"};


# return
##
# proc:  matchStop
# descr: finds the position of the character where two strings stop matching. Requires that comparison strings be the same length
# todo: remove same length requirement
# todo: make verbosity either debug or remove
# @remark  script name tcl
# @param a - first string
# @param b - second string
# @return position of first mismatch between the two strings, -1 if strings match
#
proc matchStop {a b} {
   # strings have to be the same length
   if {[string length $a] == [string length $b]} {
      for {set i 0} {$i < [string length $a]} {incr i} {
         set aChar [string index $a $i];
         set bChar [string index $b $i];
         puts "@@@ helper.tcl - comparing $aChar to $bChar";
         if {$aChar != $bChar} {
            puts "@@@ helper.tcl - The first difference between the two input strings occurs in position $i where the character from the first argument is $aChar vs. $bChar from the second argument.";
            return $i;
         } else {
            puts "@@@ helper.tcl - this character matches!";
         }
      }
      return -1;  # indicates that no difference were found
   } else {
      puts "@@@ helper.tcl - This proc only works when the two input strings are the same length.";
   }
}

###################################################### Executable Code #######################################################

# Note: does not display if run in quiet mode
variable helper_loaded 1;

