#
#*********************************************************************************************************************************************
#
# Helper file contains procs to support tcl scripts - Log File Operations
#
# See Doxygen created documentation
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
# History
#    2022/01/20 - WK - 2021.2 - updated for Doxygen compatibility
#    2021/12/01 - WK - enhanced documentation and failed load detector code
#    2020/08/14 - WK - stolen from helper.tcl which has become bloated
#
#*********************************************************************************************************************************************
#

#
# how many procs in this file?
set nProcsInThisFile 17;
#
# how many procs have already been defined?
set nProcsDefinedOnEntry [llength $loadedProcs];

#*****************************************************************************
#
# log file management procs and variables
#
#*****************************************************************************
variable log;
variable logPath;

##
# proc:  print
# descr: prints to both STDOUT and log file (if opened)
# @remark <list of searchable terms> 
# @param msg  
#
proc print { msg } {
   puts $msg;
   logWrite $msg;
}
lappend loadedProcs {print "prints the argement to the console and log file"};
##
# proc:  printNNL
# descr: prints to both STDOUT and log file (if opened) without a newline
# @remark <list of searchable terms> 
# @param msg  
#
proc printNNL { msg } {
   puts -nonewline $msg;
   logWriteNNL $msg;
}
lappend loadedProcs {print "prints the argement to the console and log file"};

# use these procs moving foward, the other procs are present for backward compatability
##
# proc:  logExist
# descr: 
# @remark <list of searchable terms> 
#
proc logExist { } {
   variable log;
   variable logPath;
   # is the log file already open?
   if {[info exist log] == 1} {
      return 1;
   }
   return 0;
}
lappend loadedProcs {logExist "Returns 1 if the log file has been opened, 0 otherwise"};
##
# proc:  logExists
# descr: 
# @remark <list of searchable terms> 
#
proc logExists {} { logExist; }
lappend loadedProcs {logExists "Returns 1 if the log file has been opened, 0 otherwise"};

##
# proc:  logForceOpen
# descr: 
# @remark <list of searchable terms> 
# @param logFileName  
#
proc logForceOpen { logFileName } {
   variable log;
   variable logPath;
   # is the log file already open?
   if {[info exist log] == 1} {
     errorMsg "Log file already open when attempting to open new log file: $logFileName. Closing existing log file and opening new one";
     logClose;
   }
   
   # does the logFileName already end in .log?
   if {[strEndsWith $logFileName .log] != 0} {
      set logPath $logFileName;
   } else {
      set logPath "";
      append logPath $logFileName .log;
   }
   set log [open $logPath w];

   # start the log
   set today [clock format [clock seconds] -format %Y-%m-%d];
   set now   [clock format [clock seconds] -format %H:%M:%S];
   print "$logFileName started at $now on $today";
   logWrite "\n\n";
}
lappend loadedProcs {logForceOpen "Forces the specified log file name to be opened. does not yet return status"};
##
# proc:  logNameGet
# descr: returns the name of the opened log file, "LOG FILE NOT OPEN" otherwise
# @remark get log name path
# @return name of log file (if opened)
#
proc logNameGet {} {
   variable log;
   variable logPath;
   # if the log file is open, return the log path
   if {[info exist log] == 1} {
      return $logPath;
   }
   # otherwise return the failure string
   return "LOG FILE NOT OPEN";
}
lappend loadedProcs {logNameGet "Returns the name of the log file if it is open, error message if not"};
##
# proc:  logOpen
# descr: 
# @remark <list of searchable terms> 
# @param logFileName  
# @return - no value returned
#
proc logOpen { logFileName } {
   variable log;
   variable logPath;
   # is the log file already open?
   if {[info exist log] == 1} {
     errorMsg "Log file already open when attempting to open new log file: $logFileName. Will continue with existing log file.";
     print "Log file already open when attempting to open new log file: $logFileName. Will continue with existing log file.";
     set today [clock format [clock seconds] -format %Y-%m-%d];
     set now   [clock format [clock seconds] -format %H:%M:%S];
     print "attempt to open $logFileName at $now on $today failed. Continuing to use $logPath"    ;
     logWrite "\n\n"     ;
   } else {
     # open the file normally
     logForceOpen $logFileName;
   }
}
lappend loadedProcs {logOpen "opens the specified log name. does not yet return status"};
##
# proc:  logOpenForAppending
# descr: 
# @remark <list of searchable terms> 
# @param logFileName  
#
proc logOpenForAppending { logFileName } {
   variable log;
   variable logPath;
   
   # does the logFileName already end in .log?
   if {[strEndsWith $logFileName .log] != 0} {
      set logPath $logFileName;
   } else {
      set logPath "";
      append logPath $logFileName .log;
   }

   # now open   
   if {[fileExists $logPath]} {
      set log [open $logPath a+];
   } else {
      errorMsg "Log file name ($logPath) doesn't exist; therefore, can't append to it. Will open it normally.";
      logOpen $logPath;
   }
}
lappend loadedProcs {logOpenForAppending "opens log file for appeneding if open, otherwise a new log file is opened"};
##
# proc:  logWrite
# descr: 
# @remark <list of searchable terms> 
# @param s  
#
proc logWrite {s} {
   variable log;
   variable debugLog;
   variable suppressLogErrors;
   if {$debugLog} { puts "in logWrite"; }
   # get the string into the output buffer
   if {[logIsOpen]} { 
      puts $log $s;
      # ensure that this buffer gets pushed to the file in case of a crash
      flush $log;
   } else {
      if { $suppressLogErrors == 0} { puts "log file wasn't open!!!";  }
   }
   logFlush;
}
lappend loadedProcs {logWrite "writes the passed string to the end of the log file"};
##
# proc:  logWriteNNL
# descr: writes to log file suppressing the newline character
# @remark <list of searchable terms> 
# @param s  
#
proc logWriteNNL {s} {
   variable log;
   variable debugLog;
   variable suppressLogErrors;
   if {$debugLog} { puts -nonewline "in logWriteNNL"; }
   # get the string into the output buffer
   if {[logIsOpen]} { 
      puts -nonewline $log $s;
      # ensure that this buffer gets pushed to the file in case of a crash
      #flush $log;   # flushing causes a NL to be added to the file?
   } else {
      if { $suppressLogErrors == 0} { puts "log file wasn't open!!!";  }
   }
   logFlush;
}
lappend loadedProcs {logWriteNNL "writes the passed string to the end of the log file without a new line character"}
##
# proc:  logFlush
# descr: 
# @remark <list of searchable terms> 
#
proc logFlush {} {
   variable log;
   variable debugLog;
   if {$debugLog} { puts "in logFlush"; }
   
   # get the string into the output buffer
   if {[logIsOpen]} {    
      flush $log;
   } else {
      if {$debugLog} { puts "in logFlush: log not open - can't flush!"; }
   }
}
lappend loadedProcs {logFlush "Flushes the contents of the buffer to the log file."};
##
# proc:  logClose
# descr: 
# @remark <list of searchable terms> 
#
proc logClose {} {
   variable log;
   variable logPath;
   
   # if there is a log to close...
   if { [info exists log] } {
   
      # show the time/date stamp for the closing
      set today [clock format [clock seconds] -format %Y-%m-%d];
      set now   [clock format [clock seconds] -format %H:%M:%S]    ; 
     
      # dump the message to the log file and console
      print "$logPath closed at $now on $today";
      logWrite "\n";
   
      # empty the buffer and close the file
      flush $log;
      close $log;
     
      # remove the log so that it is no longer defined and that info exists will return 0 showing log is closed
      unset log;
   } else {
      puts "*Error* No log file open";
   }
}
lappend loadedProcs {logClose "Flushes the log buffer and closes the log file"};
##
# proc:  logIsOpen
# descr: 
# @remark <list of searchable terms> 
#
proc logIsOpen {} {
   variable log;
   variable debugLog;
   if {$debugLog} { puts "in logIsOpen"; }
   return [info exists log];
}
lappend loadedProcs {logIsOpen "Returns 1 if the log file is currently open, 0 otherwise"};
##
# proc:  infoMsg
# descr: 
# @remark <list of searchable terms> 
# @param msg  
#
proc infoMsg { msg } {
   if {[logIsOpen] == 1} {
      logWrite "----- Info: $msg";
    }
    puts "----- Info: $msg";
}
lappend loadedProcs {infoMsg "Write the passed string to the log file marked as an info level message"};
##
# proc:  warningMsg
# descr: 
# @remark <list of searchable terms> 
# @param msg  
#
proc warningMsg { msg } {
   if {[logIsOpen] == 1} {
      logWrite "===== Warning: $msg";
   }
   puts "===== Warning: $msg";
}
lappend loadedProcs {warningMsg "Write the passed string to the log file marked as a warning level message"};
##
# proc:  errorMsg
# descr: 
# @remark <list of searchable terms> 
# @param msg  
#
proc errorMsg { msg } {
   if {[logIsOpen] == 1} {
      logWrite "!!!!! Error: $msg"   ;   
   }
   puts "!!!!! Error: $msg";
   helperErrorAdd $msg;
}
lappend loadedProcs {errorMsg "Write the passed string to the log file marked as an error level message"};
##
# proc:  errorMsgNoTracking
# descr: dumps the passed message to the log file. Does NOT add the message to the internal error tracking
#        intended to be used when list of errors is dumped to the log file without re-writing each error back into the list
# @remark <list of searchable terms> 
# @param msg  
#
proc errorMsgNoTracking { msg } {
   if {[logIsOpen] == 1} {
      logWrite "!!!!! Error: $msg"  ;    
   }
   puts "!!!!! Error: $msg";
}
lappend loadedProcs {infoMsg "Write the passed string to the log file marked as an error level message, but does not register it in the internal error tracker"};

#
# was this a successful load?
set nProcsDefinedOnExit [llength $loadedProcs];
if {[expr $nProcsDefinedOnExit - $nProcsDefinedOnEntry] == $nProcsInThisFile} {
   puts "Successful load of helper_logging.tcl";
   return 1;
} else {
   puts stderr "*** failed load of helper_logging.tcl";
   puts stderr "    started with $nProcsDefinedOnEntry defined procs";
   puts stderr "    [expr $nProcsDefinedOnExit - $nProcsDefinedOnEntry] out of $nProcsInThisFile loaded";
   for {set i 0} {$i < $nProcsDefinedOnExit} {incr i} {
      set thisPair [lindex $loadedProcs $i];
      set procName [lindex $thisPair 0];
      set procDesr [lindex $thisPair 1];
      puts stderr "   $procName => $procDesr";
   }
   return 0;
}



