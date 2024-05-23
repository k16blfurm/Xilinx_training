#
#*****************************************************************************************************************************************
#
# Helper file contains procs to support tcl scripts - File Operations
#
#    See Doxygen for complete documentation set
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
#    2022/01/19 - WK - updated comments to become Doxygen friendly
#    2020/08/14 - WK - stolen from helper.tcl which has become bloated
#
#*****************************************************************************************************************************************
#

#************************************************************************
#
# user file management procs: fileOpen, fileWrite, fileRead, fileClose
#
#************************************************************************
variable fileHandle;
variable fileName;
variable fileStatus CLOSED;

##
#  proc:  fileOpen
#  descr: sets globals fileHandle, fileName, and fileStatus
#         requires that fileStatus be set to CLOSED otherwise there is no file activity
#  @remark <list of searchable terms>
#  @param fName - name (with path) of the file to open
#  @param mode  - w for writing, a for appending
#  @return file status
#
proc fileOpen {fName mode} {
   variable fileName;
   variable fileHandle;
   variable fileStatus;

   # is the file already open?
   set isClosed [expr [string compare -nocase $fileStatus CLOSED]==0];
   if {$isClosed} {
      # ready to open
      set fileName $fName;
      set fileHandle [open $fName $mode];    # attempt to open the file
      if {$fileHandle != null} {     
         if {[strMatch $mode w]} {
            set fileStatus OPEN_FOR_WRITING;
         } elseif {[strMatch $mode a]} {
            set fileStatus OPEN_FOR_APPENDING;
         } elseif {[strMatch $mode r]} {
            set fileStatus OPEN_FOR_READING;
         } else {
            puts "helper_files.tcl:fileOpen - unknown mode: $mode";
            set fileStatus OPEN_ERROR;
         }
      } 
   } else {
      # file failed to open
      puts "helper_files.tcl:fileOpen - file must be closed before it can be reopened, currently in state: $fileStatus";
      set fileStatus OPEN_ERROR;
   }

   return fileStatus;
}
##
# proc:  fileWrite
# descr: writes msg to a file with a newLine character
# @remark <list of searchable terms>
# @param msg - message to display
# @return none
proc fileWrite {msg} {
   variable fileName;
   variable fileHandle;
   variable fileStatus;
   if {[strMatch $fileStatus OPEN_FOR_WRITING] || [strMatch $fileStatus OPEN_FOR_APPENDING]} {
      puts $fileHandle $msg
      # ensure that this buffer gets pushed to the file in case of a crash
      flush $fileHandle
   } else {
      errorMsg "helper.tcl:fileWrite:Cannot write to $fileName because it's status is currently listed as: $fileStatus"
   }
}
##
# proc:  fileWriteNoNL
# descr: writes msg to a file without a newline
# @remark <list of searchable terms>
# @param msg - message to display
# @return none
proc fileWriteNoNL {msg} {
   variable fileName;
   variable fileHandle;
   variable fileStatus;
   if {[strMatch $fileStatus OPEN_FOR_WRITING] || [strMatch $fileStatus OPEN_FOR_APPENDING]} {
      puts $fileHandle -nonewline $msg
      # ensure that this buffer gets pushed to the file in case of a crash
      flush $fileHandle
   } else {
      errorMsg "helper.tcl:fileWrite:Cannot write to $fileName because it's status is currently listed as: $fileStatus"
   }
}
##
# proc:  fileRead
# descr:
# @remark <list of searchable terms>
# @return single line read from the currently opened file. If not file is open, an error is added to the error message system and a null string is returned
proc fileRead {} {
   variable fileName
   variable fileHandle
   variable fileStatus

   set rtnStr READ_FAILURE

   if {[strMatch $fileStatus OPEN_FOR_READING]} {
      if {[atEOF]} {
        errorMsg "helper.tcl:fileRead:Can't read from $fileName because we are at the end of file and there is no more data"
     } else {
         set readString [gets $fileHandle]
       return $readString
     }
   } else {
      errorMsg "helper.tcl:fileRead:Can't read from $fileName because it is currently $fileStatus"
   }
   return ""
}
##
# proc:  atEOF
# descr: indicates if the currently open file is at the end-of-file
# @remark end of file
# @retval true if the file pointer is at the end-of-file
# @retval false if the file pointer is NOT at the end-of-file
# @code{.tcl}
proc atEOF {} {
   variable fileHandle
   variable fileStatus

   if {![strMatch $fileStatus CLOSED]} {
      set status [eof $fileHandle]
      return $status
   } else {
      errorMsg "helper.tcl:atEOF:Can't read from $fileName because it is currently in state: $fileStatus"
   }
}
# @endcode
##
# proc:  fileClose
# descr: flushes file buffer and closes the file. all internal statuses updated
# @remark file close
# @return status of file closing operation
proc fileClose {} {
   variable fileName;
   variable fileHandle;
   variable fileStatus;

   if {![strMatch $fileStatus CLOSED]} {
      if {[strMatch $fileStatus OPEN_FOR_APPENDING] || [strMatch $fileStatus OPEN_FOR_WRITING]} {
         flush $fileHandle;
     }
     set status [close $fileHandle];
     set fileStatus CLOSED;
   } else {
      errorMsg "helper.tcl:fileClose:Can't close $fileName because it is already closed!";
   }
   return status;
}


##
# proc for downloading a URL to the local directory
# descr:
# @remark
# @return
package require http;
##
# proc:  urlFileGetText
# descr:
# @remark <list of searchable terms>
# @param url
# @param fName
#
proc urlFileGetText { url fName } {
   set fp [open $fName w]
   # no cleanup, so we lose some memory on every call
   append urlFile $url $fName
   puts $fp [ ::http::data [ ::http::geturl $urlFile ] ]
   close $fp
}
##
# proc:  urlFileGetBinary
# descr: downloads a binary file from the internet
# @remark download binary file executable internet exe
# @param url
# @param fName
#
proc urlFileGetBinary { url fName } {
   set fp [open $fName w];
   # no cleanup, so we lose some memory on every call
   append urlFile $url $fName;
   puts "Complete URL: $urlFile";
   set r [http::geturl $urlFile -binary 1];
   fconfigure $fp -translation binary;
   puts -nonewline $fp [http::data $r];
   close $fp;
   ::http::cleanup $r;
}
##
# proc:  copyIfNewer
# descr: copies a file from src to dst if src is newer
# @remark copy overwrite newer move file
# @param src source file to copy
# @param dst destination file to target
# @retval 1  if successfully copies
# @retval 0  if src found, but not copied because dst was the same or newer
# @retval -1 if src not found
# @retval -2 if src found, but copy was attempted and failed
# @retval -3 if src started copy to dst and failed
#
proc copyIfNewer { src dst } {
   variable verbose;

   # check if source file exists
   if {[file exist $src] == 1} {
      infoMsg "helper_files.tcl:copyIfNewer: found $src, will attempt to copy to $dst";
      
      # does the destination exist? If so, then we have to figure out if it's newer or not, otherwise we can just copy
      if {[file exist $dst] == 0} {
         # make sure that the full path to the destination exists
         set hierarchyList [str2List $dst /];
         set listLenMinusOne [expr [llength $hierarchyList] - 1];    # assumes that the hierarchy has at least one level to it      
         set hierarchyList [lreplace $hierarchyList $listLenMinusOne $listLenMinusOne]; #remove the last element of the list which is the file name
         set firstElement [lindex $hierarchyList 0];
         if {$firstElement == {}} {
            set hierarchyList [lreplace $hierarchyList 0 0];         # remove the first element (which will be blank)
         }
         set builtHierarchy "";
         foreach thisHierarchyLevel $hierarchyList {
            append builtHierarchy / $thisHierarchyLevel;
			# todo: if first level of hierarchy is a drive indicator, then remove the initial slash
            if {[file isdir $builtHierarchy] == 0} {
               file mkdir $builtHierarchy;
            }
         }
         
         # attempt the copy
         if {[catch {file copy -force -- $src $dst} errMsg] } {
            errorMsg "helper_files.tcl:copyIfNewer: failed to copy existing $src to non-existant $dst: $errMsg";
            return -2;
         } else {
            infoMsg "helper_files.tcl:copyIfNewer: copy to non-existant destination worked";
            return 1;
         }
      } else {
         # destination DOES exists, look at times...
         set srcTimeDate [file mtime $src];
         set dstTimeDate [file mtime $dst];
         if {$srcTimeDate > $dstTimeDate} {
            if {[catch {file copy -force -- $src $dst} errMsg]} {
               errorMsg "helper_files.tcl:copyIfNewer - failed to copy existing $src to existing $dst: $errMsg";
               return -2;
            } else {
               # no error message thrown, assume success
               infoMsg "helper_files.tcl:copyIfNewer - source date newer, copy successful";               
               return 1;         # successful copy
            }            
         } else {
            infoMsg "helper_files.tcl:copyIfNewer: source date older or same - no copy attempted";
            return 0;   # dst was up-to-date, no copy needed
         }
      }      
   } else {
      errorMsg "helper_files.tcl:copyIfNewer: attempted to copy $src to $dst, but source doesn't exist!";
      return -1;
   }
}

proc copyIfNewerTest {} {
   # E = exists
   # X = doesn't exist
   # N = dst newer than src
   # O = dst older than src   
   #            src     dst
   # test 1 -    X       X
   # test 2 -    E       X
   # test 3 -    E       N
   # test 4 -    E       O
   # test 5 -    E       hierarchy X (additional hierarchy for dst to test if copy manages creation of additional layers of hierarcy during copy)
   
   puts "***** helper_files.tcl:copyIfNewerTest *****";
   infoMsg "***** helper_files.tcl:copyIfNewerTest *****";
   
   # erase the test directory if it exists
   set testDir /training/test/copyIfNewer;
   rm-R $testDir;
   
   # create the test directory (copyIfNewer dir holds sources, copies to target)
   if {[catch {file mkdir $testDir} errMsg]} {
      puts stderr "Failed to create the test directory for copyIfNewerTest ($testDir)";
      return;
   } else {
      puts stderr "copyIfNewerTest test directory created ($testDir)";
   }
   
   # test 1 - attempt a copy of file that isn't there
   set src /training/test/copyIfNewer/src.txt;
   set dst /training/test/copyIfNewer/target/dst.txt;
   puts "Running test 1 - attempting to copy a file that doesn't exist to the destination";
   set result [copyIfNewer $src $dst];
   puts "   test 1 result: $result";
   
   # create text source
   set fileHandle [open $src w];
   puts -nonewline $fileHandle "this is a test\nto generate a meaningless\nASCII text file\n";
   close $fileHandle;
   
   # test 2 - now that the source exists, try copying it to the destination which shouldn't exist
   puts "Running test 2 - attempting to copy an existing file to the non existant destination";
   set result [copyIfNewer $src $dst];
   puts "   test 2 result: $result";
   
   # test 3 - now that the destination exists, if we wait a moment and re-build the source, then the destination will be older than the source and it should copy
   # sleep for 5 seconds for destination to become older than source
   puts -nonewline "Test will resume in...";
   for {set i 5} {$i>-1} {incr i -1} { puts -nonewline "$i..."; sleep 1; }; puts "continuing...";
   set fileHandle [open $src w];
   puts -nonewline $fileHandle "this is a test\nto generate a meaningless\nASCII text file\nupdated\n";
   close $fileHandle;   
   puts "Running test 3 - attempting to copy an existing file to a destination that already exists and is older than the source";
   set result [copyIfNewer $src $dst];
   puts "   test 3 result: $result";  
   
   # test 4 - source exists and will be copied to dst which also exists, but is newer than the src
   puts -nonewline "Test will resume in...";
   for {set i 5} {$i>-1} {incr i -1} { puts -nonewline "$i..."; sleep 1; }; puts "continuing...";
   set fileHandle [open $dst w];
   puts -nonewline $fileHandle "this is a test to ensure that the destination is newer than the source\n";
   close $fileHandle;   
   puts "Running test 4 - attempting to copy an existing file to a destination that already exists and is newer than the source";
   set result [copyIfNewer $src $dst];
   puts "   test 4 result: $result";    
   
   # test 5 - source exists and will be copied to non-existant destination, but now additional layers of hierarchy must by created to get to where the dst is it bo
   set dst /training/test/copyIfNewer/target/deeper/and/deeper/dst.txt;
   puts "Running test 5 - attempting to copy an existing file to a destination non-existant destination in a place where the hierarchy hasn't been created";
   set result [copyIfNewer $src $dst];
   puts "   test 5 result: $result";     
   
   puts "\n***** copyIfNewer test suite complete *****\n";
}
##
# proc:   copySVNfiles
# descr:  copies files from the SVN > domain > topicClusters > tcName to \training\<tcName>
# Warning! this is ONLY for custEd use and is not intended as a general purpose action
# @remark copy duplicate move cp
# @param  domain - FPGA, lang, Embedded, etc. This tells the proc which domain to reach into when copying
# @param  tcName - name of the topic cluster. used to point to the TC within the domain and the training directory
# @param  list   - list of files to be copied from the SVN under domain > tcName to the support directory
# @return number of successfully copied files
#
proc copySVNfiles { domain tcName list } {

   # define the path to the SVN if not already done
   if {![info exists SVNloc]} {
      set SVNloc $::env(SVNloc)
      regsub -all {\\} $SVNloc / SVNloc
   }

   # make sure the source path exists. if not, return 0 for no files copied
   set sourcePath ""
   append sourcePath $SVNloc/trunk/$domain/TopicClusters/$tcName
   if {[directoryExists $sourcePath]} {
      # point to the destination
      set destinationPath ""
      append destinationPath $trainingPath/$tcName/support
      if {[directoryExists $destinationPath]} {
         # directory does exist, time to iterate through the files
         set successfulFileCopyCount 0
         foreach fileName $list {
            set srcFile $sourcePath/$fileName
            if {[fileExists $srcFile]} {
               set dstFile $destinationPath/$fileName
               file delete -force -- $dstFile;                 # ensure that the destination doesn't exist
               if { ![fileExists $dstFile] } {
                  file copy -force -- $srcFile $dstFile;       # copy
                  if { [fileExists $dstFile] } {
                     set successfulFileCopyCount [expr $successfulFileCopyCount + 1]; # if the file exists now when it didn't before, then it was copied
                  }
               } else {
                  errMsg "helper.tcl:copyFiles - destination file couldn't be deleted therefore copy is unreliable"
               }
            } else {
               errMsg "helper.tcl:copyFiles - source file must exist in order to be copied: $srcFile"
            }
         }
         return $successfulFileCopyCount
      } else {
         errMsg "helper.tcl:copyFiles - destination directory/ies must exist before files can be copied"
      }
   }
   return 0
}
##
# proc:  createDir
# descr: proc for creating a directory if it doesn't yet exist
# @remark  dir, directory, make, create, mk, mkdir
# @param dirName - name of directory to create
# @return 0 if dirName already exists, 1 if dirName newly created, -1 if tried and failed
#
proc createDir { dirName } {
   # does the directory already exist?
   if {![directoryExists $dirName]} {
      file mkdir $dirName;                   # attempt to create the directory
      # test to see if the directory was created
      if {[directoryExists $dirName]} {
         return 1;                           # all is well
      } else {
         errorMsg "Dirctory $dirName should have been created but wasn't!"
         return -1
      }
   } else {
      warningMsg "Directory $dirName already exists - no action taken"
      return 0
   }
}


##
# proc:  rm-R
# descr: manually creates a list of files, sorts them in reverse alpha and deletes everything
# @remark  delete, recursive, rmdir, remove, directory, erase
# @param startDir
# @return  1 on success;
#         -1 when files and directires could not be deleted;
#         -2 when files deleted, but not directories
#
proc rm-R {startDir} {
   set fileList [findFiles $startDir * 1];
   set fileList [lsort -decreasing -nocase $fileList];

   infoMsg "rm-R: removing files and directories from $startDir"

   foreach fileElement $fileList {
      catch {
         file delete -force $fileElement;
      } errMsg
      if {[string length $errMsg] > 0} {
         errorMsg "helper.tcl:rm-R:could not delete $fileElement - $errMsg";
         return -1
      }
   }

   set dirList [findDirectories $startDir * 1];
   set dirList [lsort -decreasing -nocase $dirList];
   foreach dirElement $dirList {
      catch {
         file delete -force $dirElement;
      } errMsg
      if {[string length $errMsg] > 0} {
         errorMsg "helper.tcl:rm-R:could not delete $dirElement - $errMsg";
         return -2;
      }
   }
   return 1;
}
#lappend loadedProcs {rm-R "recursively deletes a path"};
##
# proc:  findFiles
# descr: find files in the hierarchy <starting path, files to find, 1=recursive>
# @remark   search, find, files, recursive
# @param  basedir   - directory in which to begin the search
# @param  pattern   - which files to find (should handle wildcards)
# @param  recursive - 1 will do a recursive search, 0 will only search in current directory
# @return list of file paths
#
proc findFiles { basedir pattern recursive} {

   # Fix the directory name, this ensures the directory name is in the
   # native format for the platform and contains a final directory seperator
   set basedir [string trimright [file join [file normalize $basedir] { }]];
   set fileList [list];

   # Look in the current directory for matching files, -type {f r}
   # means ony readable normal files are looked at, -nocomplain stops
   # an error being thrown if the returned list is empty
   catch {
      foreach fileName [glob -nocomplain -type {f r} -path $basedir $pattern] {
         lappend fileList $fileName;
      }
   } errMsg;
   if {[string length $errMsg] > 0} { puts "findFiles error value: $errMsg"; }

   # Now look for any sub direcories in the current directory
   if {$recursive} {
      catch {
         foreach dirName [glob -nocomplain -type {d  r} -path $basedir *] {
            # Recusively call the routine on the sub directory and append any
            # new files to the results
            set subDirList [findFiles $dirName $pattern 1];
            if { [llength $subDirList] > 0 } {
               foreach subDirFile $subDirList {
                  lappend fileList $subDirFile;
               }
            }
         }
      } errMsg;
      if {[string length $errMsg] > 0} { puts "subdirectory errors: $errMsg"; }
   }

   return $fileList
}
#lappend loadedProcs {findFiles "locates files within the file system with options"};
##
# proc:  findDirectories
# descr: find directories in the hierarchy <starting path, directories to find, 1=recursive>
# @remark   search, find, directories, directory, recursive
# @param  basedir   - directory in which to begin the search
# @param  pattern   - which directories to find (should handle wildcards)
# @param  recursive - 1 will do a recursive search, 0 will only search in current directory
# @return list of directory paths
#
proc findDirectories { basedir pattern recursive } {

   # Fix the directory name, this ensures the directory name is in the
   # native format for the platform and contains a final directory seperator
   set basedir [string trimright [file join [file normalize $basedir] { }]]
   set dirList {}

   # Look in the current directory for matching files, -type {f r}
   # means ony readable normal files are looked at, -nocomplain stops
   # an error being thrown if the returned list is empty
   catch {
      foreach dirName [glob -nocomplain -type {d r} -path $basedir $pattern] {
         lappend dirList $dirName
      }
   } errMsg
   if {[string length $errMsg] > 0} {
      errorMsg "helper.tcl:findDirectories:error value: $errMsg"
   }

   # Now look for any sub direcories in the current directory
   if {$recursive} {
      catch {
         foreach dirName [glob -nocomplain -type {d  r} -path $basedir *] {
            # Recusively call the routine on the sub directory and append any
            # new files to the results
            set subDirList [findDirectories $dirName $pattern 1]
            if { [llength $subDirList] > 0 } {
               foreach subDirFile $subDirList {
                  lappend dirList $subDirFile
               }
            }
         }
      } errMsg
      if {[string length $errMsg] > 0} {
         puts "subdirectory errors: $errMsg"
         errorMsg "helper.tcl:findDirectories:subdirectory errors: $errMsg"
      }
   }

   return $dirList
}
#lappend loadedProcs {findDirectories "locates directories within the file system with options"};
##
# proc:   findDir
# descr:  find a directory in the hierarchy starting from a given location (recursively)
# todo:   update this to use findDirectories and return count of found directories > 0
# @remark   find, search, browse, directory, dir
# @param  basedir - starting location of the search
# @param  pattern - name of directory to find (will accept wildcards. returns true if any variant of the wildcard is found)
# @return true if indicated directory is found, false (0) otherwise
#
proc findDir { basedir pattern } {

   # Fix the directory name, this ensures the directory name is in the native format for the platform and contains a final directory seperator
   set basedir [string trimright [file join [file normalize $basedir] { }]]
   set fileList {}

   # Look in the current directory for matching files, -type {d} means ony directories are looked at, -nocomplain stops an error being thrown if the returned list is empty
   set targetName [glob -nocomplain -type {d} -path $basedir $pattern]
   #if {[llength $targetName] > 0} { puts "found!"; return 1 }

   # Now look for any sub direcories in the current directory and recurse
   foreach dirName [glob -nocomplain -type {d  r} -path $basedir *] {
      set foundInThisBranch 0
      if {[catch {set findInThisBranch [findDir $dirName $pattern]} result]} {
         # puts "Error Management in the true portion of the if statement: $result"
      }
      if { $foundInThisBranch == 1 } { return 1; }
   }
   return 0
}
#lappend loadedProcs {xxx "1"};
##
# proc:   findInThisBranch
# descr:  finding directory names in the hierarchy - only one level of hierarchy depth
# todo:   obsolete this proc in favor of findDirectories with recursion set to 0
# @remark   find, search, file, name, directory
# @param  basedir
# @param  pattern
# @return list of directory names
#
proc findInThisBranch { basedir pattern } {

    # Fix the directory name, this ensures the directory name is in the
    # native format for the platform and contains a final directory seperator
    set basedir [string trimright [file join [file normalize $basedir] { }]]
    set fileList {}

    # Look in the current directory for matching files, -type {f r}
    # means ony readable normal files are looked at, -nocomplain stops
    # an error being thrown if the returned list is empty
    foreach fileName [glob -nocomplain -type {d r} -path $basedir $pattern] {
        lappend fileList $fileName
    }

    # Now look for any sub direcories in the current directory
    #foreach dirName [glob -nocomplain -type {d  r} -path $basedir $pattern] {
        # Recusively call the routine on the sub directory and append any
        # new files to the results
        #set subDirList [findFiles $dirName $pattern]
        #if { [llength $subDirList] > 0 } {
        #    foreach subDirFile $subDirList {
        #        lappend fileList $subDirFile
        #    }
        #}
   #  lappend fileList $dirName
    #}
    return $fileList
}
#lappend loadedProcs {xxx "2"};
##
# proc:   getDirectories
# descr:  finding directory names in the hierarchy - only one level of hierarchy depth.
# @remark   directory, list, directories, find, search, name
# @param  basedir
# @param  pattern
# @return list of directory names
#
proc getDirectories { startingPoint } {
   set dirList [findInThisBranch $startingPoint *]
}
#lappend loadedProcs {xxx "3"};
##
# proc:   fileExists
# descr:  identifies if a file exists
# @remark   file, exist, exists
# @param  target
# @return true/1 if file is found, false/0 otherwise
#
proc fileExists {target} {
   # does anything by this name exist?
   if {[file exist $target]} {
      # but is it a file?
      if {[file isfile $target]} {
         return 1;                     # yes, it is
      } else {                         # it exists, but it's not a file!
         warningMsg "helper.tcl:fileExists: something exists by the name of $target, but it's not a file!";
      }
   } else {
      warningMsg "helper.tcl:fileExists: file does NOT exist - $target";
   }
   return 0
}
##
# proc:   fileExistsSilent
# descr:  identifies if a file exists, but does not generate any warning messages
# @remark   file, exist, exists
# @param  target
# @return true/1 if file is found, false/0 otherwise
#
proc fileExistsSilent {target} {
   # does anything by this name exist?
   if {[file exist $target]} {
      # but is it a file?
      if {[file isfile $target]} {
         return 1;                     # yes, it is
      } else {                         # it exists, but it's not a file!
         # warningMsg "helper.tcl:fileExists: something exists by the name of $target, but it's not a file!";
      }
   } else {
      # warningMsg "helper.tcl:fileExists: file does NOT exist - $target";
   }
   return 0
}
##
# proc:  isFile
# descr:
# @remark <list of searchable terms>
# @param target
#
proc isFile { target } {
   set fexist 0;
   if {[fileExists $target]} {
      set fexist [file isfile $target];
   }
   return $fexist;
}
##
# proc:  directoryExists
# descr: identify if a directory exists
# @remark <list of searchable terms>
# @param target
# @return 1 if the directory is found, 0 otherwise
#
proc directoryExists {target} { return [file isdirectory $target]; }
##
# proc:   isDirectory
# descr:
# @remark   file, exist, exists
# @param  target
# @return true/1 if file is found, false/0 otherwise
#
proc isDirectory {target} { return [file isdirectory $target]; }

##
# proc:   directoryWipe
# descr:  removes directory and everything in it - equivalent to rm -r, then recreates it
# @remark   directory, erase, delete, wipe, clean
# @param  target
# @return 1 for success, 0 indicates target directory didn't exist,
#         -1 indicates failure to delete, -2 indicates directory was wiped, but not recreated
#
proc directoryWipe { target } {
   if {[directoryExists $target]} {
      infoMsg "wiping directory: $target";
      set status [directoryDelete $target]
      if {$status == 1} {
         info "directoryWipe: succesful deletion of $target";
         return 1;
      } else {
         errorMsg "helper.tcl:directoryWipe:Failed to wipe directory $target with return message of $status";
      }
      return -1;
   } else {
      warningMsg "directoryWipe: Directory $target does not exist therefore directoryWipe has nothing to work on";
      return 0;
   }
   # recreate the deleted directory
   file mkdir $target;
   if {directoryExists $target } {
      return 1;
   } else {
      return -2;
   }
}
#lappend loadedProcs {xxx "4"};
# renamed as directoryWipe may wind up with a different behavior
##
# proc:   directoryDelete
# descr:  deletes directory and everything in it.
# @remark   delete, directory, remove, rmdir
# @param  target
# @return -1 for failure, 0 for no directory to work on, 1 success
#
proc directoryDelete { target } {
   if {[directoryExists $target]} {
      if { [catch {file delete -force $target} fid] } {
         puts stderr "Could not delete $target: $fid";
         exit -1;
      }
      if {[directoryExists $target]} {
         warningMsg "failed to delete $target";
         return -1;
      }
      return 1;
   } else {
      warningMsg "Directory $target does not exist therefore directoryWipe has nothing to work on";
      return 0;
   }
}
##
# proc:  directoryWipe
# descr: erases all the files in the specified directory, but leaves the directory
# todo:  needs testing as this manually removes all of the files before removing the directories
# @remark <list of searchable terms>
# @param list
#
#proc directoryWipe { target } {
#   set fileList [getFiles $target]
#   foreach thisFile $fileList {
#      fileDelete $thisFile
#   }
#}

##
# proc:   filesDelete
# descr:  deletes all the files in the given list
# @remark   list, delete, files
# @param  list - paths to the files to delete
# @return sum of statuses. If all went properly, this value will be equal to the list length
#
proc filesDelete { list } {
   set statusSum 0;
   foreach thisFile $list {
      set status [fileDelete $thisFile];
      if {$status == 1} {
         puts "$thisFile successfully deleted";
      } else {
         puts "$thisFile failed to be deleted!   <<<===";
      }
      set statusSum [expr $statusSum + $status];
   }
   return $statusSum;
}
##
# proc:   fileDelete
# descr:  deletes a single file
# @remark   file, delete, remove, erase
# @param  target - path to file to delete
# @return 1 if successful, 0 if not
#
proc fileDelete { target } {
   if {[fileExists $target]} {
      catch {
         file delete -force $target;
      } errMsg
      if {[string length $errMsg] > 0} {
         puts "could not delete $target - $errMsg";
         if {[logExist]} {
            logWrite "could not delete $target - $errMsg";
         }
         return -1;
      }
   } else {
      warningMsg "File $target does not exist therefore fileDelete has nothing to work on"
      return 0;
   }
   return 1;
}
#lappend loadedProcs {xxx "5"};
##
# proc:   fileRename
# descr:  renames a single file
# @remark   file, ren, rename, mov
# @param  orgName - path to file to rename
# @param  newName - full path to rename this file as
# @return 1 if successful, 0 if not, -1 if file exists, but could not be renamed
#
proc fileRename { orgName newName } {
   if {[fileExists $orgName]} {
      catch {
         file rename -force $orgName $newName
      } errMsg
      if {[string length $errMsg] > 0} {
         puts "fileRename: could not rename $orgName - $errMsg"
         if {[logExist]} {
            logWrite "fileRename: could not rename $orgName - $errMSg"
         }
         return -1;
      }
   } else {
      warningMsg "fileRename: File $orgName does not exist therefore fileRename has nothing to work on"
      return 0;
   }
   return 1;
}
##
# proc:   getFiles
# descr:  returns a list of all files in this directory
# @remark   get, file, list
# @param  target
# @return list of all files in the directory
#
proc getFiles { target } {
    set basedir [string trimright [file join [file normalize $target] { }]]
    set fileList {}

    # Look in the current directory for matching files, -type {f r}
    # means ony readable normal files are looked at, -nocomplain stops
    # an error being thrown if the returned list is empty
    foreach fileName [glob -nocomplain -type {f r} -path $basedir *] {
        lappend fileList $fileName
    }
    return $fileList
 }
##
# proc:   stripLastHierarchy
# descr:  removes last level of hierarchy from the specified path
#         generally used to remove the file name from the path
#         limited protection, needs further testing
# @remark   remove, file, name, strip, filename
# @param  path - path to strip from
# @return returns the path minus the last level of hierarchy
#
proc stripLastHierarchy {path} {
   set lastHierarchySeparator [string last / $path]
   set lastHierarchySeparator [expr $lastHierarchySeparator - 1]
   if {$lastHierarchySeparator > -1} {
      set returnString [string range $path 0 $lastHierarchySeparator]
   } else {
      set returnString ""
   }
   return $returnString
}
##
# proc:   getLastHierarchy
# descr:  conjugate to stripLastHierarchy
#         limited protection, needs further testing
# @remark   hierarhcy break separate file name
# @param  path
# @return returns last level of hierarchy from the path
#
proc getLastHierarchy {path} {
   set lastHierarchySeparator [string last / $path]
   set lastHierarchySeparator [expr $lastHierarchySeparator + 1]
   if {$lastHierarchySeparator > -1} {
      set returnString [string range $path $lastHierarchySeparator [string length $path]]
   } else {
      set returnString ""
   }
   return $returnString
}
##
# proc:    stripExtension
# descr:   removes extension from the passed string
# @remark    strip extract remove extension ext file name
# @param   path  - string to work on
# @returns path minus any characters beyond the last "."
#
proc stripExtension {path} {
   variable verbose
   if {$verbose} { puts "helper.tcl:stripExtension" }
   set lastDot [expr [string last . $path] - 1]
   if {$lastDot > -1} {
      return [string range $path 0 $lastDot]
   }
   return {}
}
##
# proc:    scanDir
# descr:   scan directories and provides a list of all the directories at this level of hierarchy
# todo:    is this functionally identical to a previous proc like "findDirectories"?
# @remark    find, search, scan, directory,
# @param   dir  - starting point
# @returns list of directory names - not recursive
#
proc scanDir { dir } {
   set contents [glob -type d -directory $dir *]
   set list {}
   foreach item $contents {
     lappend list $item
    # append out $item
    # append out " "
   }
   return $list
}

##
# proc:   directoryCreate
# descr:  creates a directory at the specified location - checks to ensure dir doesn't already exist
# @remark   directory, make, mkdir, mk, create
# @param  dirName
# @return 1 on success, 0 on failure, -1 if it already exists
#
proc directoryCreate { dirName } {
   if { [directoryExists $dirName] } {
      return -1
   } else {
      return [createDir $dirName]
   }
}
##
# proc:  safeCopy
# descr: copies src to dst and catches any error and prevents Tcl from aborting execution of script
# @remark <list of searchable terms>
# @param src
# @param dst
#
proc safeCopy { src dst } {
   # attempt to copy and catch status of copy
   if { [catch {file copy -force -- $src $dst} fid] } {
       puts stderr "Could not copy $src to $dst\n$fid"
       writeLogFile "Could not copy $src to $dst\n$fid"
       flushLogFile
      return 0
   }
   return 1
}

##
# proc:  safeMove
# descr: catches any error and prevents Tcl from aborting execution of script
# @remark <list of searchable terms>
# @param src
# @param dst
# @return 1 on success, 0 otherwise
#
proc safeMove { src dst } {
   # attempt to copy and catch status of copy
   if { [catch {file copy -force -- $src $dst} fid] } {
      puts stderr "Could not copy $src to $dst\n$fid"
      writeLogFile "Could not copy $src to $dst\n$fid"
      flushLogFile
      return 0
   }
   # attempt to delete and catch status of deletion
   if { [catch {file delete -force -- $dst} fid] } {
      puts stderr "Could not delete $src\n$fid"
      writeLogFile "Could not delete $src\n$fid"
      flushLogFile
      return 0
   }
   return 1
}



#########################################################################
#
# procs for managing drives
#
#    getDriveList - returns a list of available drives
#
# todo: http://twapi.magicsplat.com/v3.1/disk.html for get_volume_info
#
#########################################################################
#package require twapi
#proc driveEject { target } {
# todo: make sure target is in the form: X: or X:/
#   eject_media $target
#}
#proc getDriveList {} {
#   return [file volumes];
#}


