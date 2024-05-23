#
#*******************************************************************************************************************************************
#
# Helper file contains procs to support tcl scripts - String Operations
#
# See Doxygen produced documentation 
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
#    2021/07/19 - WK - added stringDiff
#    2020/08/14 - WK - stolen from helper.tcl which has become bloated
#
#*******************************************************************************************************************************************
#

##
# proc:  numberOfOccurances
# descr: replaces multiple sequential spaces with a single space
#        
# @remark <list of searchable terms> 
# @param s - string s is the item being scanned
# @param c - character to count
# @return integer count of the number of times char appears in str
#
proc numberOfOccurances { s c } {
   set nOccurrances 0;
   set length [string length $s];
   for {set charIndex 0} {$charIndex < $length} {incr charIndex} {
      if {[string index $s $charIndex] == $c} { incr nOccurrances; }
   }
   return $nOccurrances;
}

##
# proc:  removeDoubledSpaces
# descr: replaces multiple sequential spaces with a single space
#        
# @remark <list of searchable terms> 
# @param str - string to remove multiple spaces from
# @return cleaned string
#
proc removeDoubledSpaces { s } {
   set initialLength -1;
   set finalLength   0;
   while {$initialLength != $finalLength} {
      set initialLength [string length $s];
      set s [string map {"  " " "} $s];
      set finalLength [string length $s];
   }
   return $s;
}

##
# proc:  strReplace
# descr: returns string s where character x is replaced by character c
# @remark <list of searchable terms> 
# @param s  
# @param target  
# @param replacement  
# @return string s where character x is replaced by character c
#
proc strReplace {s target replacement} {
   set retStr [regsub -all $target $s $replacement]
   return $retStr
}

##
# proc:  strlen
# descr: returns number of characters in a
# @remark <list of searchable terms> 
# @param a  
# @return number of characters in a
#
proc strlen {a} {
   return [string length $a]
}


##
# proc:  strcmp
# descr: performs case insensitive comparison
# @remark <list of searchable terms> 
# @param a  
# @param b  
# @returns-1 if a<b, 0 if a=b, 1 if a>b
#
proc strcmp {a b} {
   return [string compare -nocase $a $b];
}

##
# proc:  strsame
# descr: performs case insensitive comparison
# @remark <list of searchable terms> 
# @param a  
# @param b  
# @return 1 if the strings are the same (case not withstanding), otherwise 0
#
proc strsame {a b} {
   set comparisonValue [string compare -nocase $a $b];
   if {$comparisonValue == 0} { return 1 } else { return 0 }
}

##
# proc:  lastIndexOf
# descr: locates the last occurrance of the given symbol
# @remark <list of searchable terms> 
# @param s  
# @param c  
#
proc lastIndexOf { s c } {
   string last $c $s
   infoMsg "Obsolete - use strLastIndex instead of lastIndexOf"
}

##
# proc:  strLastIndex
# descr: searches for the last occurrence of string 'b' in string 'a'
# @remark find string index last final
# @param a - string to search in
# @param b - target string
# @return returns the index of b in a. if b is NOT in a, returns -1
#
proc strLastIndex {a b} {
   set pos [string last $b $a]
   return $pos
}
##
# proc:  strMatch
# descr: 
# @remark <list of searchable terms> 
# @param a  
# @param b  
# @return 1 if and b are case insensitive matches, 0 otherwise
#
proc strMatch {a b} {
   set comparisonValue [string compare -nocase $a $b]
   if {$comparisonValue == 0} { return 1 } else { return 0 }
}
##
# proc:  strContains
# descr: 
# @remark <list of searchable terms> 
# @param a  
# @param b  
# @return 1 if b is in a
#
proc strContains {a b} {
   set pos [string first $b $a]
   if {$pos > -1} { return 1; }
   return 0;
}
##
# proc:  strPosition
# descr: 
# @remark <list of searchable terms> 
# @param a  
# @param b  
# @return position of b if in a, -1 otherwise
#
proc strPosition {a b} {
   set pos [string first $b $a]
   if {$pos > -1} { return $pos; }
   return -1;
}
##
# proc:  substr
# descr: returns sub-string from start to end
# @remark <list of searchable terms> 
# @param s     - string to use
# @param start - starting point
# @param end   - last point
# @return substring of s from start to end
#
proc substr {s start end} {
   set retVal "Error in substring $s $start $end";
   if {[strlen $s] >= $start} { 
      if {[strlen $s] >= $end} {
        set retVal [string range $s $start $end]
     }
   }
   return $retVal;
}
##
# proc:  strEndsWith
# descr: does string a end with string b?
# @remark string final end ends 
# @param a - string to test
# @param b - string to see if a ends with 
# @return 1 if true, 0 otherwise
#
proc strEndsWith {a b} {
   set A [string toupper $a]
   set B [string toupper $b]
   set endsWith [string last $B $A]
   set endPosShouldBe [expr [string length $A] - [string length $B]]
   if { $endsWith == $endPosShouldBe } {
      return 1;
   } else {
      return 0;
   }
}
##
# proc:  strStartsWith
# descr: returns 1 if string a starts with string b
# @remark start starts with begins
# @param a - string to search in
# @param b - target string
# @return 1 if a starts with b, 0 otherwise
#
proc strStartsWith {a b} {
   set A [string toupper $a]
   set B [string toupper $b]
   set startsWith [string first $B $A]
   set startPosShouldBe 0; # [expr [string length $A] - [string length $B]]
   if { $startsWith == $startPosShouldBe } {
      return 1;
   } else {
      return 0;
   }
}
##
# proc:  strStripFirstAndLast
# descr: removes leading and trailing white space then removes the first and last characters
# @remark inside braces brackets parenthesis strip 
# @param a - string to process
# @return 1 ideally, everything inside the square, curly braces or parenthesis
#
proc strStripFirstAndLast { s } {
   set trimmedS [string trim $s]
   set start 1
   set end   [expr [string length $trimmedS] - 2]
   set firstAndLastGone [string range $trimmedS $start $end]
   return $firstAndLastGone
}

##
# proc:  strIndex
# descr: finds the first occurance of the character c in string s
# @remark <list of searchable terms> 
# @param s    - string to search
# @param c    - character to find
# @param from - where to begin looking
# @return first occurance of c in s starting at from
#
proc strIndex {s c from} {
   return [string first $c $s $from]
}

##
# proc:  repeatChar
# descr: 
# @remark <list of searchable terms> 
# @param c  
# @param n  
#
proc repeatChar { c n } {
   set s ""
   for {set i 0} {$i < $n} {incr i} {
      append s $c
   }
   return $s
}

##
# proc:  isDigit
# descr: 
# @remark <list of searchable terms> 
# @param c  
# @return 0 if the character is not a digit, 1 otherwise
#
proc isDigit {c} {
   if {[string length $c] == 0} { return 0; }
   set c [string range $c 0 1 ]
   if {$c>=0&$c<=9} { return 1 }
   return 0
}

##
# proc:  extractIntegerFromString
# descr: extracts all digits from within a string - 123ABC456 => 123456
# @remark <list of searchable terms> 
# @param s  
# @return exracts all integers from a string - even if the digits are separated by other characters
#
proc extractIntegerFromString {s} {
   set integer ""
   for {set i 0} {$i < 10} {incr i} {
      set thisChar [string range $s $i [expr $i + 0]]
      if { [isDigit $thisChar] } { append integer $thisChar; }
   }
   return $integer
}
#lappend loadedProcs {xxx "11"};

##
# proc:  toHex
# descr: 
# @remark <list of searchable terms> 
# @param decVal  
# @return a hexidecimal value corresponding to decVal in the form 0x???
#
proc toHex { decVal } {
   return [format 0x%x $decVal]
}

##
# proc:  catonate
# descr: appends Y to X
# @remark <list of searchable terms> 
# @param x  
# @param y  
# @return returns xy
#
proc catonate {x y} { 
   set z ""
   append z $x $y
   return $z
} 

##
# proc:  str2List
# descr: converts a string into a list based on the designated separators
# @remark string to list
# @param s  
# @param separator  
# @return list of values found between the separators
#todo: what happens if the separator is the first character? it then returns a zero length string as the first element
proc str2List {s separator} {
   set list {};
   while {[string length $s] > 0} {
      set pos [string first $separator $s];
      if {$pos == -1} {
         lappend list $s;
         return $list;
      } else {
         set thisPiece [string range $s 0 [expr $pos - 1]];
         lappend list $thisPiece;
         set s [string range $s [expr $pos + 1] [expr [string length $s] + 1]];
      }
   }
   return $list;
}
##
#  str2ListTest is the testing proc for str2List
#
proc str2ListTest {} {
   set s {a,very, long, comma separated, string};
   set separator ,;
   set rtnVal [str2List $s $separator];
   #set rtnVal [cleanList $rtnVal];  # from helper_strings.tcl
   set listLen [llength $rtnVal];
   puts "str2List returns: $rtnVal  which has $listLen elements in it";
}

##
# proc:  strDiff
# descr: does a character-by-character comparison between string a and string b
# @remark string difference comparison
# @param a
# @param b 
# @return number of differences
#
proc strDiff {a b} {  
   # check lengths
   if {[string length $a] > [string length $b]} {
      #puts "String lengths are different: $a is [string length $a] characters long while $b is [string length $b] characters long";
      set finishCompareIndex [string length $b];   # stop at end of b
   } elseif {[string length $a] < [string length $b]} {
      #puts "String lengths are different: $a is [string length $a] characters long while $b is [string length $b] characters long";
      set finishCompareIndex [string length $a];   # stop at end of b
   } else {
      #puts "Strings are of the same length";
      set finishCompareIndex [string length $a];
   }
   
   # now do the compare
   set nDifferences 0;
   for {set index 0} {$index < $finishCompareIndex} {incr index} {
      set aChar [string index $a $index];
      set bChar [string index $b $index];
      if {$aChar != $bChar} {
         #if {$debug} { puts "position $index: $aChar is different than $bChar"; }
         incr nDifferences;
      }
   }
   #puts "there are $nDifferences between the two strings";
   return $nDifferences;
}

