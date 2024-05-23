##########################################################################################################################################
#
#  Steps to create completed project
#
##########################################################################################################################################
  1. Run the Tcl script.
     a. Locate the Tcl console in the Vivado Design Suite. 
               
     b. Enter the following command to change the directory to Tcl completer directory:
	[Linux Users]: cd /home/amd/training/Constr_Wizard/completed
 
     c. Enter the following Tcl command to source the script:
        source Constr_Wizard_completer.tcl

  2. Set Tcl variables.
     a. Enter the following Tcl commands in the Tcl Console:
        use <platform>    
        use <language> 
 
        Where <language> is either Verilog or VHDL
              <platform> is KCU105

  3. Create a Completed project
     a. Enter the following command to run all the steps of the lab and create the completed project:
        make all

##########################################################################################################################################
#
# <copyright-disclaimer-start>
//  **************************************************************************************************************
//  * © 2023 Advanced Micro Devices, Inc. All rights reserved.                                                   *
//  * DISCLAIMER                                                                                                 *
//  * The information contained herein is for informational purposes only, and is subject to change              *
//  * without notice. While every precaution has been taken in the preparation of this document, it              *
//  * may contain technical inaccuracies, omissions and typographical errors, and AMD is under no                *
//  * obligation to update or otherwise correct this information.  Advanced Micro Devices, Inc. makes            *
//  * no representations or warranties with respect to the accuracy or completeness of the contents of           *
//  * this document, and assumes no liability of any kind, including the implied warranties of noninfringement,  *
//  * merchantability or fitness for particular purposes, with respect to the operation or use of AMD            *
//  * hardware, software or other products described herein.  No license, including implied or                   *
//  * arising by estoppel, to any intellectual property rights is granted by this document.  Terms and           *
//  * limitations applicable to the purchase or use of AMD’s products are as set forth in a signed agreement     *
//  * between the parties or in AMD's Standard Terms and Conditions of Sale. GD-18                               *
//  *                                                                                                            *
//  **************************************************************************************************************
# <copyright-disclaimer-end>
