#
#*******************************************************************************************************************************************
#
# Helper file contains procs to support tcl scripts - List Operations
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
# History
#    2022/01/20 - WK - 2021.2 - updated for Doxygen compatibility
#    2020/08/14 - WK - stolen from helper.tcl which has become bloated
#
#*******************************************************************************************************************************************
#

#
# how many procs in this file?
set nProcsInThisFile 8;
#
# how many procs have already been defined?
set nProcsDefinedOnEntry [llength $loadedProcs];

##
# proc:  inList
# descr: returns true or false if item is in the list
# @remark <list of searchable terms> 
# @param item  
# @param thisList  
# @return 0 if item is not in list, 1 if it is 
#
proc inList {item thisList} {
   set result [lsearch $thisList $item];
   if {$result != -1} {return 1} 
   return 0;
}
lappend loadedProcs {inList "Returns 1 if the item was found in the list, 0 otherwise"};
##
# proc:  isInList
# descr: searches a list for a specific match of the specified item
# @remark <list of searchable terms> 
# @param target  
# @param list  
# @return 1 if target is in list, 0 otherwise
#
proc isInList {list target} {
   if {[containedIn $target $list] > -1} {
      return 1;
   }
   return 0
}
lappend loadedProcs {isInList "Returns 1 if the target is in the specified list"};
##
# proc:  stringToList2d
# descr: converts the string into a 2 dimentional list (a list of lists) with each inner list
#        having the length as specified by the len value
# @remark <list of searchable terms> 
# @param sList - 1D list which will be broken into multiple inner lists
# @param listLen - length of inner lists
# @return list of lists
#
#
proc stringToList2d { sList listLen } {
   set list {};
   
   # do a check to make sure that there are the proper number of terms
   #set numberOfElements [expr [numberOfOccurances [string trim $s] " "] + 1];
   set numberOfElements [llength $sList];
   puts "# of elements: $numberOfElements";
   set ratio [expr double($numberOfElements) / double($listLen)];   # both elements must be floats otherwise result is an integer
   if {int($ratio)==$ratio} {
      set totalTermsProcessed 0;
      
      while {$totalTermsProcessed < $numberOfElements} {
         set innerList {};                # reset to blank
         # ever listLen values, add the internal list to the big list
         puts "processing inner list";
         for {set index 0} {$index < $listLen} {incr index} {
            set thisTerm [lindex $sList $totalTermsProcessed]; #[string index $s $totalTermsProcessed];
            lappend innerList $thisTerm;
            puts "appending $thisTerm  ==> $innerList";
            incr totalTermsProcessed;
         }
         puts "created inner list of: $innerList";
         lappend list $innerList;
      }
   } else {
      puts "Incorrect number of elements in 2D list: $s with each inner list being $listLen long!";
   }
   return $list;
}
lappend loadedProcs {stringToList2d "Returns passed list as a list of lists"};
##
# proc:  hierarchyToList
# descr: returns list of directory names provided in "name". the file name will be the last element in the list
# todo:  move this to the helper_files.tcl script
# @remark <list of searchable terms> 
# @param name  
#
proc hierarchyToList { name } {
   set hierarchyList {}
   
   # are any hierarchy separators found?
   set pos [expr [strIndex $name / 0] + 1]
   while {$pos > 0 && $pos < [string length $name]} {
      set nextPos [strIndex $name / [expr $pos + 1]]
     if {$nextPos == -1} { set nextPos [string length $name] }
     set thisHierarchyName [string range $name $pos [expr $nextPos - 1]]
     lappend hierarchyList $thisHierarchyName
     set pos [expr $nextPos + 1]
   }
   
   return $hierarchyList
}
lappend loadedProcs {hierarchyToList "Returns a full path to a file as a list with the file name as the last element in that list"};
##
# proc:  containedIn
# descr: searches a list for a specific match of the specified item
# @remark <list of searchable terms> 
# @param target  
# @param list  
# @return >0 which is the index of the object in the list, -1 otherwise
#
proc containedIn {target list} {
   set result [lsearch -exact $list $target]
   if {[expr $result >= 0]} {
      set result 1
   } else {
      set result 0
   }
   return $result
}
lappend loadedProcs {containedIn "Returns a 1 if there is an exact match of the target in the list"};
#
##
# proc:  commaSeparatedStringToList
# descr: breaks the string into a list by commas
# @remark <list of searchable terms> 
# @param str  
#
proc commaSeparatedStringToList { str } {
   set list {}
   
   # are any hierarchy separators found?
   #set pos [expr [strIndex $str , 0] + 1]
   set pos [strIndex $str , 0]
   if {$pos != -1} { 
      set thisItem [string range $str 0 [expr $pos - 1]]
     lappend list $thisItem
     set pos [expr $pos + 1]
   } else {
      return $str
   }
   
   while {$pos < [string length $str]} {  
      set nextPos [strIndex $str , [expr $pos + 1]]
     if {$nextPos == -1} { set nextPos [string length $str] }
     set thisItem [string range $str $pos [expr $nextPos - 1]]
     lappend list $thisItem
     set pos [expr $nextPos + 1]
   }   
   return $list
}
lappend loadedProcs {commaSeparatedStringToList "Converts a comma separated string list into a Tcl list minus the commas"};
##
# proc:  spaceSeparatedStringToList
# descr: breaks a string into a list at each space character
# @remark <list of searchable terms> 
# @param str  
#
proc spaceSeparatedStringToList { s } {
   set list {};
   
   # scan for spaces and break into string fragments
   set space " ";
   set lastPos 0;
   set pos [string first $space $s 0];     # locate the first space in the string
   if {$pos != -1} { 
     while { $pos != -1 } {
       # if a space was found, then...
       set thisItem [string range $s $lastPos [expr $pos - 1]];    # get the substring between the last space position and the current one
       lappend list $thisItem;
       set lastPos [expr $pos + 1];
       set pos [string first $space $s $lastPos];
     }
     # this always leaves off the last of the elements, so let's get it and add it to the list...
     set pos [string length $s];
     set thisItem [string range $s $lastPos [expr $pos - 1]];
     lappend list $thisItem;
   } else {
      lappend list $s;         # no spaces found, make the string a list of one
   }
   return $list
}
lappend loadedProcs {spaceSeparatedStringToList "Converts a space separated string list into a Tcl list minus the spaces"};

# strips leading and trailing spaces from each member of the list
proc cleanList {l} {
   set cleanedList {};
   foreach thisElement $l {
      while {[string index $thisElement 0] == " "} {
         set thisElement [string range $thisElement 1 [string length $thisElement]];   # strip the first character
      }
      while {[string index $thisElement [expr [string length $thisElement] - 1]] == " "} {
         set thisElement [string range $thisElement 0 [expr [string length $thisElement] - 2]]; # strip the last character
      }
      lappend cleanedList $thisElement;
   }
   return $cleanedList;
}
lappend loadedProcs {cleanList "Removes leading and trailing spaces for every member of the list"};

proc cleanListTest {} {
   set l {};
   lappend l {a};
   lappend l {very};
   lappend l { long};
   lappend l "comma separated ";
   lappend l { string };   
   set rtnVal [cleanList $l]; 
   set listLen [llength $rtnVal];
   puts "cleanList returns: $rtnVal  which has $listLen elements in it";
}

#
# was this a successful load?
set nProcsDefinedOnExit [llength $loadedProcs];
if {[expr $nProcsDefinedOnExit - $nProcsDefinedOnEntry] == $nProcsInThisFile} {
   puts "Successful load of helper_lists.tcl";
   return 1;
} else {
   puts stderr "*** failed load of helper_lists.tcl";
   return 0;
}

