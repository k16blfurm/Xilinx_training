#*******************************************************************************************************************************************
#
# helper_time.tcl
#    contains many time related supporting procs particularly w.r.t. formatting
#
# Formatting Notes:
#    setFormat - sets the format for time use
#       %a . . . . Abbreviated weekday name (Mon, Tue, etc.)
#       %A . . . . Full weekday name (Monday, Tuesday, etc.)
#       %b . . . . Abbreviated month name (Jan, Feb, etc.)
#       %B . . . . Full month name (January, February, etc.)
#       %d . . . . Day of month
#       %j . . . . Julian day of year
#       %m . . . . Month number (01-12)
#       %y . . . . Year in century
#       %Y . . . . Year with 4 digits
#       %H . . . . Hour (00-23)
#       %I . . . . Hour (00-12)
#       %M . . . . Minutes (00-59)
#       %S . . . . Seconds(00-59)
#       %p . . . . PM or AM
#       %D . . . . Date as %m/%d/%y
#       %r . . . . Time as %I:%M:%S %p
#       %R . . . . Time as %H:%M
#       %T . . . . Time as %H:%M:%S
#       %Z . . . . Time Zone Name
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
# history
#    2022/01/20 - WK - 2021.2 - updated for Doxygen compatibility
#
#*******************************************************************************************************************************************

variable timeFormatString {%H:%M:%S};
variable timerFormatString {%H:%M:%S};
proc timeFormat { str } {
   variable timeFormatString;
   set timeFormatString str;
}
##
# get time - returns current time in the specified format
# @return returns the current system time in the selected format specified in timeFormatString
proc getTime {} {
   variable timeFormatString;
   set now [clock seconds];
   set formattedTime [clock format $now -format $timeFormatString];
   return $formattedTime;
}
##
# getRawTime
# @return returns the current system time in seconds from the epoch
proc getRawTime {} {
   return [clock seconds];
}
variable startTime;
variable endTime;
proc timerStart {} { variable startTime [clock milliseconds]; }
proc timerStop  {} { variable endTime   [clock milliseconds]; }
proc getRawElapsedTime {} { 
   variable startTime;
   variable endTime;
   return [expr $endTime - $startTime];
}
proc getElapsedTime {} {
   variable startTime;
   variable endTime;
   variable timerFormatString;
   set rawElapsedTime [expr $endTime - $startTime];
   set milliseconds [expr $rawElapsedTime % 1000];     # lowest three digits will always be milliseconds
   set rawElapsedTime [expr $rawElapsedTime / 1000];   # now strip off the milliseconds
   set hours [expr $rawElapsedTime / 3600];            # integer portion represents hours
   set rawElapsedTime [expr $rawElapsedTime - ($hours * 3600)];
   set minutes [expr $rawElapsedTime / 60];
   set rawElapsedTime [expr $rawElapsedTime - ($minutes * 60)];
   set seconds $rawElapsedTime;
   set elapsedTimeString "";
   append elapsedTimeString $hours : [twoPlaces $minutes] : [twoPlaces $seconds] . $milliseconds;
   return $elapsedTimeString;
}

# todo: return warning if more than 2 places
proc twoPlaces { x } {
   if { $x > 9 } { 
      return $x; 
   } else {
      set str 0;
      append str $x;
      return $str;
   }
}

