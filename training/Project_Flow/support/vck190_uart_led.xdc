#######################################################
##
## VCK190/VMK180 RevA Master XDC - Date: 11/18/2019
##
#######################################################

set_property    PACKAGE_PIN M37         [get_ports "SYSCTLR_GPIO0"]           ; # Bank 306  VCC1V8       IO_L0P_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "SYSCTLR_GPIO0"]           ; 
set_property    PACKAGE_PIN L37         [get_ports "SYSCTLR_GPIO1"]           ; # Bank 306  VCC1V8       IO_L0N_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "SYSCTLR_GPIO1"]           ; 
set_property    PACKAGE_PIN L34         [get_ports "DC_PL_GPIO1"]             ; # Bank 306  VCC1V8       IO_L5P_HDGC_306 
set_property    IOSTANDARD LVCMOS18     [get_ports "DC_PL_GPIO1"]             ; 
set_property    PACKAGE_PIN K35         [get_ports "DC_PL_GPIO0"]             ; # Bank 306  VCC1V8       IO_L5N_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "DC_PL_GPIO0"]             ; 
set_property    PACKAGE_PIN L35         [get_ports "GPIO_LED_3_LS"]           ; # Bank 306  VCC1V8       IO_L6P_HDGC_306 
set_property    IOSTANDARD LVCMOS18     [get_ports "GPIO_LED_3_LS"]           ; 
set_property    PACKAGE_PIN K36         [get_ports "GPIO_LED_2_LS"]           ; # Bank 306  VCC1V8       IO_L6N_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "GPIO_LED_2_LS"]           ; 
set_property    PACKAGE_PIN J33         [get_ports "GPIO_LED_1_LS"]           ; # Bank 306  VCC1V8       IO_L7P_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "GPIO_LED_1_LS"]           ; 
set_property    PACKAGE_PIN H34         [get_ports "GPIO_LED_0_LS"]           ; # Bank 306  VCC1V8       IO_L7N_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "GPIO_LED_0_LS"]           ; 
set_property    PACKAGE_PIN H36         [get_ports "GPIO_DIP_SW3"]            ; # Bank 306  VCC1V8       IO_L8P_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "GPIO_DIP_SW3"]            ; 
set_property    PACKAGE_PIN H37         [get_ports "GPIO_DIP_SW2"]            ; # Bank 306  VCC1V8       IO_L8N_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "GPIO_DIP_SW2"]            ; 
set_property    PACKAGE_PIN J34         [get_ports "GPIO_DIP_SW1"]            ; # Bank 306  VCC1V8       IO_L9P_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "GPIO_DIP_SW1"]            ; 
set_property    PACKAGE_PIN J35         [get_ports "GPIO_DIP_SW0"]            ; # Bank 306  VCC1V8       IO_L9N_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "GPIO_DIP_SW0"]            ; 
set_property    PACKAGE_PIN N34         [get_ports "SYSCTLR_GPIO2"]           ; # Bank 306  VCC1V8       IO_L1P_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "SYSCTLR_GPIO2"]           ; 
set_property    PACKAGE_PIN G36         [get_ports "GPIO_PB1"]                ; # Bank 306  VCC1V8       IO_L10P_306     
set_property    IOSTANDARD LVCMOS18     [get_ports "GPIO_PB1"]                ; 
set_property    PACKAGE_PIN G37         [get_ports "GPIO_PB0"]                ; # Bank 306  VCC1V8       IO_L10N_306     
set_property    IOSTANDARD LVCMOS18     [get_ports "GPIO_PB0"]                ; 
set_property    PACKAGE_PIN M34         [get_ports "SYSCTLR_GPIO3"]           ; # Bank 306  VCC1V8       IO_L1N_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "SYSCTLR_GPIO3"]           ; 
set_property    PACKAGE_PIN M35         [get_ports "SYSCTLR_GPIO4"]           ; # Bank 306  VCC1V8       IO_L2P_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "SYSCTLR_GPIO4"]           ; 
set_property    PACKAGE_PIN M36         [get_ports "SYSCTLR_GPIO5"]           ; # Bank 306  VCC1V8       IO_L2N_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "SYSCTLR_GPIO5"]           ; 
set_property    PACKAGE_PIN L33         [get_ports "UART1_RXD_HDIO_UART_TX"]  ; # Bank 306  VCC1V8       IO_L3P_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "UART1_RXD_HDIO_UART_TX"]  ; 
set_property    PACKAGE_PIN K33         [get_ports "UART1_TXD_HDIO_UART_RX"]  ; # Bank 306  VCC1V8       IO_L3N_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "UART1_TXD_HDIO_UART_RX"]  ; 
set_property    PACKAGE_PIN K37         [get_ports "DC_PL_GPIO3"]             ; # Bank 306  VCC1V8       IO_L4P_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "DC_PL_GPIO3"]             ; 
set_property    PACKAGE_PIN J36         [get_ports "DC_PL_GPIO2"]             ; # Bank 306  VCC1V8       IO_L4N_306      
set_property    IOSTANDARD LVCMOS18     [get_ports "DC_PL_GPIO2"]             ; 
set_property    PACKAGE_PIN M20         [get_ports "QSFP1_LPMODE_LS"]         ; # Bank 406  VCC3V3       IO_L0P_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "QSFP1_LPMODE_LS"]         ; 
set_property    PACKAGE_PIN M21         [get_ports "QSFP1_INTL_LS"]           ; # Bank 406  VCC3V3       IO_L0N_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "QSFP1_INTL_LS"]           ; 
set_property    PACKAGE_PIN K18         [get_ports "HDMI_TX_HPD"]             ; # Bank 406  VCC3V3       IO_L5P_HDGC_406 
set_property    IOSTANDARD LVCMOS33     [get_ports "HDMI_TX_HPD"]             ; 
set_property    PACKAGE_PIN J18         [get_ports "HDMI_TX_CEC"]             ; # Bank 406  VCC3V3       IO_L5N_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "HDMI_TX_CEC"]             ; 
set_property    PACKAGE_PIN K20         [get_ports "HDMI_TX_EN"]              ; # Bank 406  VCC3V3       IO_L6P_HDGC_406 
set_property    IOSTANDARD LVCMOS33     [get_ports "HDMI_TX_EN"]              ; 
set_property    PACKAGE_PIN J19         [get_ports "HDMI_RX_SNK_SDA"]         ; # Bank 406  VCC3V3       IO_L6N_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "HDMI_RX_SNK_SDA"]         ; 
set_property    PACKAGE_PIN H17         [get_ports "HDMI_RX_SNK_SCL"]         ; # Bank 406  VCC3V3       IO_L7P_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "HDMI_RX_SNK_SCL"]         ; 
set_property    PACKAGE_PIN H18         [get_ports "HDMI_RX_PWR_DET"]         ; # Bank 406  VCC3V3       IO_L7N_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "HDMI_RX_PWR_DET"]         ; 
set_property    PACKAGE_PIN J20         [get_ports "HDMI_RX_HPD"]             ; # Bank 406  VCC3V3       IO_L8P_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "HDMI_RX_HPD"]             ; 
set_property    PACKAGE_PIN J21         [get_ports "HDMI_8T49N241_RST"]       ; # Bank 406  VCC3V3       IO_L8N_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "HDMI_8T49N241_RST"]       ; 
set_property    PACKAGE_PIN H19         [get_ports "HDMI_8T49N241_INT_ALM"]   ; # Bank 406  VCC3V3       IO_L9P_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "HDMI_8T49N241_INT_ALM"]   ; 
set_property    PACKAGE_PIN G20         [get_ports "HDMI_8T49N241_LOL"]       ; # Bank 406  VCC3V3       IO_L9N_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "HDMI_8T49N241_LOL"]       ; 
set_property    PACKAGE_PIN M17         [get_ports "QSFP1_MODPRSL_LS"]        ; # Bank 406  VCC3V3       IO_L1P_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "QSFP1_MODPRSL_LS"]        ; 
set_property    PACKAGE_PIN H21         [get_ports "SFP1_TX_DISABLE_B"]       ; # Bank 406  VCC3V3       IO_L10P_406     
set_property    IOSTANDARD LVCMOS33     [get_ports "SFP1_TX_DISABLE_B"]       ; 
set_property    PACKAGE_PIN G21         [get_ports "SFP0_TX_DISABLE_B"]       ; # Bank 406  VCC3V3       IO_L10N_406     
set_property    IOSTANDARD LVCMOS33     [get_ports "SFP0_TX_DISABLE_B"]       ; 
set_property    PACKAGE_PIN L17         [get_ports "QSFP1_RESETL_LS"]         ; # Bank 406  VCC3V3       IO_L1N_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "QSFP1_RESETL_LS"]         ; 
set_property    PACKAGE_PIN M19         [get_ports "QSFP1_MODSKLL_LS"]        ; # Bank 406  VCC3V3       IO_L2P_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "QSFP1_MODSKLL_LS"]        ; 
set_property    PACKAGE_PIN L19         [get_ports "HDMI_REC_CLK_OUT_R"]      ; # Bank 406  VCC3V3       IO_L2N_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "HDMI_REC_CLK_OUT_R"]      ; 
set_property    PACKAGE_PIN L18         [get_ports "HDMI_CTL_SDA"]            ; # Bank 406  VCC3V3       IO_L3P_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "HDMI_CTL_SDA"]            ; 
set_property    PACKAGE_PIN K17         [get_ports "HDMI_CTL_SCL"]            ; # Bank 406  VCC3V3       IO_L3N_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "HDMI_CTL_SCL"]            ; 
set_property    PACKAGE_PIN L20         [get_ports "HDMI_TX_SRC_SDA"]         ; # Bank 406  VCC3V3       IO_L4P_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "HDMI_TX_SRC_SDA"]         ; 
set_property    PACKAGE_PIN K21         [get_ports "HDMI_TX_SRC_SCL"]         ; # Bank 406  VCC3V3       IO_L4N_406      
set_property    IOSTANDARD LVCMOS33     [get_ports "HDMI_TX_SRC_SCL"]         ; 
#set_property   PACKAGE_PIN AL28        [get_ports "VRP_700"]                 ; # Bank 700  VCC1V2_DDR4  IO_VR   VRP_700
#set_property   IOSTANDARD LVCMOSxx     [get_ports "VRP_700"]                 ; 
set_property    PACKAGE_PIN AF47        [get_ports "DDR4_DIMM1_DQS4_T"]       ; # Bank 700  VCC1V2_DDR4  IO_L0P_XCC_N0P0_M0P0_700        
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS4_T"]       ; 
set_property    PACKAGE_PIN AF46        [get_ports "DDR4_DIMM1_DQS4_C"]       ; # Bank 700  VCC1V2_DDR4  IO_L0N_XCC_N0P1_M0P1_700        
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS4_C"]       ; 
set_property    PACKAGE_PIN AD47        [get_ports "DDR4_DIMM1_DQ39"]         ; # Bank 700  VCC1V2_DDR4  IO_L5P_N1P4_M0P10_700   
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ39"]         ; 
set_property    PACKAGE_PIN AE47        [get_ports "DDR4_DIMM1_DQ38"]         ; # Bank 700  VCC1V2_DDR4  IO_L5N_N1P5_M0P11_700   
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ38"]         ; 
set_property    PACKAGE_PIN AH43        [get_ports "DDR4_DIMM1_DQS5_T"]       ; # Bank 700  VCC1V2_DDR4  IO_L6P_GC_XCC_N2P0_M0P12_700
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS5_T"]       ; 
set_property    PACKAGE_PIN AG44        [get_ports "DDR4_DIMM1_DQS5_C"]       ; # Bank 700  VCC1V2_DDR4  IO_L6N_GC_XCC_N2P1_M0P13_700
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS5_C"]       ; 
set_property    PACKAGE_PIN AD44        [get_ports "DDR4_DIMM1_DQ43"]         ; # Bank 700  VCC1V2_DDR4  IO_L7P_N2P2_M0P14_700   
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ43"]         ; 
set_property    PACKAGE_PIN AE44        [get_ports "DDR4_DIMM1_DQ42"]         ; # Bank 700  VCC1V2_DDR4  IO_L7N_N2P3_M0P15_700   
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ42"]         ; 
set_property    PACKAGE_PIN AJ44        [get_ports "DDR4_DIMM1_DQ41"]         ; # Bank 700  VCC1V2_DDR4  IO_L8P_N2P4_M0P16_700   
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ41"]         ; 
set_property    PACKAGE_PIN AJ45        [get_ports "DDR4_DIMM1_DQ40"]         ; # Bank 700  VCC1V2_DDR4  IO_L8N_N2P5_M0P17_700   
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ40"]         ; 
set_property    PACKAGE_PIN AH45        [get_ports "DDR4_DIMM1_DM5_B"]        ; # Bank 700  VCC1V2_DDR4  IO_L9P_GC_XCC_N3P0_M0P18_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DM5_B"]        ; 
#set_property   PACKAGE_PIN AG45        [get_ports "No Connect"]              ; # Bank 700  VCC1V2_DDR4  IO_L9N_GC_XCC_N3P1_M0P19_700
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AD45        [get_ports "DDR4_DIMM1_DQ35"]         ; # Bank 700  Vcc1v2_Ddr4  Io_L1p_N0p2_M0p2_700
Set_Property    Iostandard Pod12        [Get_Ports "Ddr4_Dimm1_Dq35"]         ; 
Set_Property    Package_Pin Ak44        [Get_Ports "Ddr4_Dimm1_Dq45"]         ; # Bank 700  Vcc1v2_Ddr4  Io_L10p_N3p2_M0p20_700
Set_Property    Iostandard Pod12        [Get_Ports "Ddr4_Dimm1_Dq45"]         ; 
Set_Property    Package_Pin Ak45        [Get_Ports "Ddr4_Dimm1_Dq44"]         ; # Bank 700  Vcc1v2_Ddr4  Io_L10n_N3p3_M0p21_700
Set_Property    Iostandard Pod12        [Get_Ports "Ddr4_Dimm1_Dq44"]         ; 
Set_Property    Package_Pin Af44        [Get_Ports "Ddr4_Dimm1_Dq47"]         ; # Bank 700  Vcc1v2_Ddr4  Io_L11p_N3p4_M0p22_700
Set_Property    Iostandard Pod12        [Get_Ports "Ddr4_Dimm1_Dq47"]         ; 
Set_Property    Package_Pin Ae45        [Get_Ports "Ddr4_Dimm1_Dq46"]         ; # Bank 700  VCC1V2_DDR4  IO_L11N_N3P5_M0P23_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ46"]         ; 
set_property    PACKAGE_PIN AF39        [get_ports "DDR4_DIMM1_DQS6_T"]       ; # Bank 700  VCC1V2_DDR4  IO_L12P_GC_XCC_N4P0_M0P24_700
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS6_T"]       ; 
set_property    PACKAGE_PIN AF40        [get_ports "DDR4_DIMM1_DQS6_C"]       ; # Bank 700  VCC1V2_DDR4  IO_L12N_GC_XCC_N4P1_M0P25_700
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS6_C"]       ; 
set_property    PACKAGE_PIN AC39        [get_ports "DDR4_DIMM1_DQ51"]         ; # Bank 700  VCC1V2_DDR4  IO_L13P_N4P2_M0P26_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ51"]         ; 
set_property    PACKAGE_PIN AD40        [get_ports "DDR4_DIMM1_DQ50"]         ; # Bank 700  VCC1V2_DDR4  IO_L13N_N4P3_M0P27_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ50"]         ; 
set_property    PACKAGE_PIN AH40        [get_ports "DDR4_DIMM1_DQ49"]         ; # Bank 700  VCC1V2_DDR4  IO_L14P_N4P4_M0P28_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ49"]         ; 
set_property    PACKAGE_PIN AH41        [get_ports "DDR4_DIMM1_DQ48"]         ; # Bank 700  VCC1V2_DDR4  IO_L14N_N4P5_M0P29_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ48"]         ; 
set_property    PACKAGE_PIN AE46        [get_ports "DDR4_DIMM1_DQ34"]         ; # Bank 700  VCC1V2_DDR4  IO_L1N_N0P3_M0P3_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ34"]         ; 
set_property    PACKAGE_PIN AG41        [get_ports "DDR4_DIMM1_DM6_B"]        ; # Bank 700  VCC1V2_DDR4  IO_L15P_XCC_N5P0_M0P30_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DM6_B"]        ; 
#set_property   PACKAGE_PIN AF41        [get_ports "No Connect"]              ; # Bank 700  VCC1V2_DDR4  IO_L15N_XCC_N5P1_M0P31_700
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AH39        [get_ports "DDR4_DIMM1_DQ52"]         ; # Bank 700  VCC1V2_DDR4  IO_L16P_N5P2_M0P32_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ52"]         ; 
set_property    PACKAGE_PIN AJ40        [get_ports "DDR4_DIMM1_DQ53"]         ; # Bank 700  VCC1V2_DDR4  IO_L16N_N5P3_M0P33_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ53"]         ; 
set_property    PACKAGE_PIN AE40        [get_ports "DDR4_DIMM1_DQ55"]         ; # Bank 700  VCC1V2_DDR4  IO_L17P_N5P4_M0P34_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ55"]         ; 
set_property    PACKAGE_PIN AD41        [get_ports "DDR4_DIMM1_DQ54"]         ; # Bank 700  VCC1V2_DDR4  IO_L17N_N5P5_M0P35_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ54"]         ; 
set_property    PACKAGE_PIN AE38        [get_ports "DDR4_DIMM1_DQS7_T"]       ; # Bank 700  VCC1V2_DDR4  IO_L18P_XCC_N6P0_M0P36_700
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS7_T"]       ; 
set_property    PACKAGE_PIN AF37        [get_ports "DDR4_DIMM1_DQS7_C"]       ; # Bank 700  VCC1V2_DDR4  IO_L18N_XCC_N6P1_M0P37_700
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS7_C"]       ; 
set_property    PACKAGE_PIN AC37        [get_ports "DDR4_DIMM1_DQ59"]         ; # Bank 700  VCC1V2_DDR4  IO_L19P_N6P2_M0P38_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ59"]         ; 
set_property    PACKAGE_PIN AD37        [get_ports "DDR4_DIMM1_DQ58"]         ; # Bank 700  VCC1V2_DDR4  IO_L19N_N6P3_M0P39_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ58"]         ; 
set_property    PACKAGE_PIN AH47        [get_ports "DDR4_DIMM1_DQ33"]         ; # Bank 700  VCC1V2_DDR4  IO_L2P_N0P4_M0P4_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ33"]         ; 
set_property    PACKAGE_PIN AG37        [get_ports "DDR4_DIMM1_DQ56"]         ; # Bank 700  VCC1V2_DDR4  IO_L20P_N6P4_M0P40_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ56"]         ; 
set_property    PACKAGE_PIN AH38        [get_ports "DDR4_DIMM1_DQ57"]         ; # Bank 700  VCC1V2_DDR4  IO_L20N_N6P5_M0P41_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ57"]         ; 
set_property    PACKAGE_PIN AG39        [get_ports "DDR4_DIMM1_DM7_B"]        ; # Bank 700  VCC1V2_DDR4  IO_L21P_XCC_N7P0_M0P42_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DM7_B"]        ; 
#set_property   PACKAGE_PIN AF38        [get_ports "No Connect"]              ; # Bank 700  VCC1V2_DDR4  IO_L21N_XCC_N7P1_M0P43_700
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AH37        [get_ports "DDR4_DIMM1_DQ60"]         ; # Bank 700  VCC1V2_DDR4  IO_L22P_N7P2_M0P44_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ60"]         ; 
set_property    PACKAGE_PIN AJ38        [get_ports "DDR4_DIMM1_DQ61"]         ; # Bank 700  VCC1V2_DDR4  IO_L22N_N7P3_M0P45_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ61"]         ; 
set_property    PACKAGE_PIN AD38        [get_ports "DDR4_DIMM1_DQ63"]         ; # Bank 700  VCC1V2_DDR4  IO_L23P_N7P4_M0P46_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ63"]         ; 
set_property    PACKAGE_PIN AD39        [get_ports "DDR4_DIMM1_DQ62"]         ; # Bank 700  VCC1V2_DDR4  IO_L23N_N7P5_M0P47_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ62"]         ; 
set_property    PACKAGE_PIN AE42        [get_ports "DDR4_DIMM1_SMA_CLK_P"]    ; # Bank 700  VCC1V2_DDR4  IO_L24P_GC_XCC_N8P0_M0P48_700
set_property    IOSTANDARD DIFF_SSTL12  [get_ports "DDR4_DIMM1_SMA_CLK_P"]    ; 
set_property    PACKAGE_PIN AF43        [get_ports "DDR4_DIMM1_SMA_CLK_N"]    ; # Bank 700  VCC1V2_DDR4  IO_L24N_GC_XCC_N8P1_M0P49_700
set_property    IOSTANDARD DIFF_SSTL12  [get_ports "DDR4_DIMM1_SMA_CLK_N"]    ; 
set_property    PACKAGE_PIN AJ47        [get_ports "DDR4_DIMM1_DQ32"]         ; # Bank 700  VCC1V2_DDR4  IO_L2N_N0P5_M0P5_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ32"]         ; 
set_property    PACKAGE_PIN AD42        [get_ports "DDR4_DIMM1_RESET_B"]      ; # Bank 700  VCC1V2_DDR4  IO_L25P_N8P2_M0P50_700
set_property    IOSTANDARD LVCMOS12     [get_ports "DDR4_DIMM1_RESET_B"]      ; 
set_property    PACKAGE_PIN AD43        [get_ports "DDR4_DIMM1_ALERT_B"]      ; # Bank 700  VCC1V2_DDR4  IO_L25N_N8P3_M0P51_700
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_ALERT_B"]      ; 
set_property    PACKAGE_PIN AF42        [get_ports "DDR4_DIMM1_DEBUG"]        ; # Bank 700  VCC1V2_DDR4  IO_L26P_N8P4_M0P52_700
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_DEBUG"]        ; 
#set_property   PACKAGE_PIN AG43        [get_ports "No Connect"]              ; # Bank 700  VCC1V2_DDR4  IO_L26N_N8P5_M0P53_700
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AH46        [get_ports "DDR4_DIMM1_DM4_B"]        ; # Bank 700  VCC1V2_DDR4  IO_L3P_XCC_N1P0_M0P6_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DM4_B"]        ; 
#set_property   PACKAGE_PIN AG46        [get_ports "No Connect"]              ; # Bank 700  VCC1V2_DDR4  IO_L3N_XCC_N1P1_M0P7_700
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AK46        [get_ports "DDR4_DIMM1_DQ37"]         ; # Bank 700  VCC1V2_DDR4  IO_L4P_N1P2_M0P8_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ37"]         ; 
set_property    PACKAGE_PIN AK47        [get_ports "DDR4_DIMM1_DQ36"]         ; # Bank 700  VCC1V2_DDR4  IO_L4N_N1P3_M0P9_700
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ36"]         ; 
#set_property   PACKAGE_PIN AN46        [get_ports "No Connect"]              ; # Bank 701  VCC1V2_DDR4  IO_L0P_XCC_N0P0_M0P54_701
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AP47        [get_ports "DDR4_DIMM1_ODT1"]         ; # Bank 701  VCC1V2_DDR4  IO_L0N_XCC_N0P1_M0P55_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_ODT1"]         ; 
set_property    PACKAGE_PIN AM46        [get_ports "DDR4_DIMM1_A17"]          ; # Bank 701  VCC1V2_DDR4  IO_L5P_N1P4_M0P64_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_A17"]          ; 
set_property    PACKAGE_PIN AN47        [get_ports "DDR4_DIMM1_A8"]           ; # Bank 701  VCC1V2_DDR4  IO_L5N_N1P5_M0P65_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_A8"]           ; 
set_property    PACKAGE_PIN AR46        [get_ports "DDR4_DIMM1_CK0_T"]        ; # Bank 701  VCC1V2_DDR4  IO_L6P_GC_XCC_N2P0_M0P66_701
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_CK0_T"]        ; 
set_property    PACKAGE_PIN AT46        [get_ports "DDR4_DIMM1_CK0_C"]        ; # Bank 701  VCC1V2_DDR4  IO_L6N_GC_XCC_N2P1_M0P67_701
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_CK0_C"]        ; 
set_property    PACKAGE_PIN AP43        [get_ports "DDR4_DIMM1_A7"]           ; # Bank 701  VCC1V2_DDR4  IO_L7P_N2P2_M0P68_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_A7"]           ; 
#set_property   PACKAGE_PIN AP44        [get_ports "No Connect"]              ; # Bank 701  VCC1V2_DDR4  IO_L7N_N2P3_M0P69_701
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AT44        [get_ports "DDR4_DIMM1_A9"]           ; # Bank 701  VCC1V2_DDR4  IO_L8P_N2P4_M0P70_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_A9"]           ; 
set_property    PACKAGE_PIN AU44        [get_ports "DDR4_DIMM1_A1"]           ; # Bank 701  VCC1V2_DDR4  IO_L8N_N2P5_M0P71_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_A1"]           ; 
set_property    PACKAGE_PIN AT47        [get_ports "DDR4_DIMM1_BG1"]          ; # Bank 701  VCC1V2_DDR4  IO_L9P_GC_XCC_N3P0_M0P72_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_BG1"]          ; 
set_property    PACKAGE_PIN AR47        [get_ports "DDR4_DIMM1_ACT_B"]        ; # Bank 701  VCC1V2_DDR4  IO_L9N_GC_XCC_N3P1_M0P73_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_ACT_B"]        ; 
set_property    PACKAGE_PIN AL46        [get_ports "DDR4_DIMM1_A0"]           ; # Bank 701  VCC1V2_DDR4  IO_L1P_N0P2_M0P56_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_A0"]           ; 
set_property    PACKAGE_PIN AU45        [get_ports "DDR4_DIMM1_A13"]          ; # Bank 701  VCC1V2_DDR4  IO_L10P_N3P2_M0P74_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_A13"]          ; 
set_property    PACKAGE_PIN AU46        [get_ports "DDR4_DIMM1_CKE1"]         ; # Bank 701  VCC1V2_DDR4  IO_L10N_N3P3_M0P75_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_CKE1"]         ; 
set_property    PACKAGE_PIN AR44        [get_ports "DDR4_DIMM1_A2"]           ; # Bank 701  VCC1V2_DDR4  IO_L11P_N3P4_M0P76_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_A2"]           ; 
set_property    PACKAGE_PIN AR45        [get_ports "DDR4_DIMM1_CKE0"]         ; # Bank 701  VCC1V2_DDR4  IO_L11N_N3P5_M0P77_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_CKE0"]         ; 
set_property    PACKAGE_PIN AK40        [get_ports "DDR4_DIMM1_CAS_B"]        ; # Bank 701  VCC1V2_DDR4  IO_L12P_GC_XCC_N4P0_M0P78_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_CAS_B"]        ; 
#set_property   PACKAGE_PIN AK41        [get_ports "No Connect"]              ; # Bank 701  VCC1V2_DDR4  IO_L12N_GC_XCC_N4P1_M0P79_701
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN AK37        [get_ports "No Connect"]              ; # Bank 701  VCC1V2_DDR4  IO_L13P_N4P2_M0P80_701
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AK38        [get_ports "DDR4_DIMM1_A11"]          ; # Bank 701  VCC1V2_DDR4  IO_L13N_N4P3_M0P81_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_A11"]          ; 
set_property    PACKAGE_PIN AL41        [get_ports "DDR4_DIMM1_A4"]           ; # Bank 701  VCC1V2_DDR4  IO_L14P_N4P4_M0P82_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_A4"]           ; 
set_property    PACKAGE_PIN AM41        [get_ports "DDR4_DIMM1_A3"]           ; # Bank 701  VCC1V2_DDR4  IO_L14N_N4P5_M0P83_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_A3"]           ; 
set_property    PACKAGE_PIN AL47        [get_ports "DDR4_DIMM1_BA1"]          ; # Bank 701  VCC1V2_DDR4  IO_L1N_N0P3_M0P57_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_BA1"]          ; 
#set_property   PACKAGE_PIN AL39        [get_ports "No Connect"]              ; # Bank 701  VCC1V2_DDR4  IO_L15P_XCC_N5P0_M0P84_701
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AK39        [get_ports "DDR4_DIMM1_WE_B"]         ; # Bank 701  VCC1V2_DDR4  IO_L15N_XCC_N5P1_M0P85_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_WE_B"]         ; 
set_property    PACKAGE_PIN AM39        [get_ports "DDR4_DIMM1_ODT0"]         ; # Bank 701  VCC1V2_DDR4  IO_L16P_N5P2_M0P86_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_ODT0"]         ; 
set_property    PACKAGE_PIN AM40        [get_ports "DDR4_DIMM1_CS1_B"]        ; # Bank 701  VCC1V2_DDR4  IO_L16N_N5P3_M0P87_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_CS1_B"]        ; 
set_property    PACKAGE_PIN AL37        [get_ports "DDR4_DIMM1_A5"]           ; # Bank 701  VCC1V2_DDR4  IO_L17P_N5P4_M0P88_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_A5"]           ; 
set_property    PACKAGE_PIN AM38        [get_ports "DDR4_DIMM1_A6"]           ; # Bank 701  VCC1V2_DDR4  IO_L17N_N5P5_M0P89_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_A6"]           ; 
set_property    PACKAGE_PIN AP40        [get_ports "DDR4_DIMM1_DQS3_T"]       ; # Bank 701  VCC1V2_DDR4  IO_L18P_XCC_N6P0_M0P90_701
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS3_T"]       ; 
set_property    PACKAGE_PIN AP41        [get_ports "DDR4_DIMM1_DQS3_C"]       ; # Bank 701  VCC1V2_DDR4  IO_L18N_XCC_N6P1_M0P91_701
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS3_C"]       ; 
set_property    PACKAGE_PIN AM37        [get_ports "DDR4_DIMM1_DQ24"]         ; # Bank 701  VCC1V2_DDR4  IO_L19P_N6P2_M0P92_701
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ24"]         ; 
set_property    PACKAGE_PIN AN38        [get_ports "DDR4_DIMM1_DQ25"]         ; # Bank 701  VCC1V2_DDR4  IO_L19N_N6P3_M0P93_701
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ25"]         ; 
set_property    PACKAGE_PIN AM44        [get_ports "DDR4_DIMM1_CS3_B"]        ; # Bank 701  VCC1V2_DDR4  IO_L2P_N0P4_M0P58_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_CS3_B"]        ; 
set_property    PACKAGE_PIN AR39        [get_ports "DDR4_DIMM1_DQ26"]         ; # Bank 701  VCC1V2_DDR4  IO_L20P_N6P4_M0P94_701
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ26"]         ; 
set_property    PACKAGE_PIN AT39        [get_ports "DDR4_DIMM1_DQ27"]         ; # Bank 701  VCC1V2_DDR4  IO_L20N_N6P5_M0P95_701
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ27"]         ; 
set_property    PACKAGE_PIN AR42        [get_ports "DDR4_DIMM1_DM3_B"]        ; # Bank 701  VCC1V2_DDR4  IO_L21P_XCC_N7P0_M0P96_701
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DM3_B"]        ; 
#set_property   PACKAGE_PIN AR41        [get_ports "No Connect"]              ; # Bank 701  VCC1V2_DDR4  IO_L21N_XCC_N7P1_M0P97_701
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AT40        [get_ports "DDR4_DIMM1_DQ28"]         ; # Bank 701  VCC1V2_DDR4  IO_L22P_N7P2_M0P98_701
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ28"]         ; 
set_property    PACKAGE_PIN AT41        [get_ports "DDR4_DIMM1_DQ29"]         ; # Bank 701  VCC1V2_DDR4  IO_L22N_N7P3_M0P99_701
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ29"]         ; 
set_property    PACKAGE_PIN AP39        [get_ports "DDR4_DIMM1_DQ30"]         ; # Bank 701  VCC1V2_DDR4  IO_L23P_N7P4_M0P100_701
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ30"]         ; 
set_property    PACKAGE_PIN AN40        [get_ports "DDR4_DIMM1_DQ31"]         ; # Bank 701  VCC1V2_DDR4  IO_L23N_N7P5_M0P101_701
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ31"]         ; 
set_property    PACKAGE_PIN AM43        [get_ports "DDR4_DIMM1_PARITY"]       ; # Bank 701  VCC1V2_DDR4  IO_L24P_GC_XCC_N8P0_M0P102_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_PARITY"]       ; 
set_property    PACKAGE_PIN AN43        [get_ports "DDR4_DIMM1_BA0"]          ; # Bank 701  VCC1V2_DDR4  IO_L24N_GC_XCC_N8P1_M0P103_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_BA0"]          ; 
set_property    PACKAGE_PIN AM45        [get_ports "DDR4_DIMM1_CS2_B"]        ; # Bank 701  VCC1V2_DDR4  IO_L2N_N0P5_M0P59_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_CS2_B"]        ; 
#set_property   PACKAGE_PIN AK42        [get_ports "No Connect"]              ; # Bank 701  VCC1V2_DDR4  IO_L25P_N8P2_M0P104_701
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AL42        [get_ports "DDR4_DIMM1_A10"]          ; # Bank 701  VCC1V2_DDR4  IO_L25N_N8P3_M0P105_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_A10"]          ; 
set_property    PACKAGE_PIN AN42        [get_ports "DDR4_DIMM1_A12"]          ; # Bank 701  VCC1V2_DDR4  IO_L26P_N8P4_M0P106_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_A12"]          ; 
set_property    PACKAGE_PIN AP42        [get_ports "DDR4_DIMM1_BG0"]          ; # Bank 701  VCC1V2_DDR4  IO_L26N_N8P5_M0P107_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_BG0"]          ; 
set_property    PACKAGE_PIN AP45        [get_ports "DDR4_DIMM1_CK1_T"]        ; # Bank 701  VCC1V2_DDR4  IO_L3P_XCC_N1P0_M0P60_701
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_CK1_T"]        ; 
set_property    PACKAGE_PIN AN45        [get_ports "DDR4_DIMM1_CK1_C"]        ; # Bank 701  VCC1V2_DDR4  IO_L3N_XCC_N1P1_M0P61_701
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_CK1_C"]        ; 
set_property    PACKAGE_PIN AL43        [get_ports "DDR4_DIMM1_CS0_B"]        ; # Bank 701  VCC1V2_DDR4  IO_L4P_N1P2_M0P62_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_CS0_B"]        ; 
set_property    PACKAGE_PIN AL44        [get_ports "DDR4_DIMM1_RAS_B"]        ; # Bank 701  VCC1V2_DDR4  IO_L4N_N1P3_M0P63_701
set_property    IOSTANDARD SSTL12       [get_ports "DDR4_DIMM1_RAS_B"]        ; 
set_property    PACKAGE_PIN AY47        [get_ports "DDR4_DIMM1_DQS8_T"]       ; # Bank 702  VCC1V2_DDR4  IO_L0P_XCC_N0P0_M0P108_702
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS8_T"]       ; 
set_property    PACKAGE_PIN BA46        [get_ports "DDR4_DIMM1_DQS8_C"]       ; # Bank 702  VCC1V2_DDR4  IO_L0N_XCC_N0P1_M0P109_702
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS8_C"]       ; 
set_property    PACKAGE_PIN AY46        [get_ports "DDR4_DIMM1_CB7"]          ; # Bank 702  VCC1V2_DDR4  IO_L5P_N1P4_M0P118_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_CB7"]          ; 
set_property    PACKAGE_PIN AW47        [get_ports "DDR4_DIMM1_CB6"]          ; # Bank 702  VCC1V2_DDR4  IO_L5N_N1P5_M0P119_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_CB6"]          ; 
set_property    PACKAGE_PIN AY45        [get_ports "DDR4_DIMM1_DQS2_T"]       ; # Bank 702  VCC1V2_DDR4  IO_L6P_GC_XCC_N2P0_M0P120_702
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS2_T"]       ; 
set_property    PACKAGE_PIN BA44        [get_ports "DDR4_DIMM1_DQS2_C"]       ; # Bank 702  VCC1V2_DDR4  IO_L6N_GC_XCC_N2P1_M0P121_702
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS2_C"]       ; 
set_property    PACKAGE_PIN AW44        [get_ports "DDR4_DIMM1_DQ19"]         ; # Bank 702  VCC1V2_DDR4  IO_L7P_N2P2_M0P122_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ19"]         ; 
set_property    PACKAGE_PIN AV45        [get_ports "DDR4_DIMM1_DQ18"]         ; # Bank 702  VCC1V2_DDR4  IO_L7N_N2P3_M0P123_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ18"]         ; 
set_property    PACKAGE_PIN BC45        [get_ports "DDR4_DIMM1_DQ17"]         ; # Bank 702  VCC1V2_DDR4  IO_L8P_N2P4_M0P124_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ17"]         ; 
set_property    PACKAGE_PIN BD45        [get_ports "DDR4_DIMM1_DQ16"]         ; # Bank 702  VCC1V2_DDR4  IO_L8N_N2P5_M0P125_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ16"]         ; 
set_property    PACKAGE_PIN BB44        [get_ports "DDR4_DIMM1_DM2_B"]        ; # Bank 702  VCC1V2_DDR4  IO_L9P_GC_XCC_N3P0_M0P126_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DM2_B"]        ; 
#set_property   PACKAGE_PIN BB45        [get_ports "No Connect"]              ; # Bank 702  VCC1V2_DDR4  IO_L9N_GC_XCC_N3P1_M0P127_702
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AV46        [get_ports "DDR4_DIMM1_CB3"]          ; # Bank 702  VCC1V2_DDR4  IO_L1P_N0P2_M0P110_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_CB3"]          ; 
set_property    PACKAGE_PIN BD44        [get_ports "DDR4_DIMM1_DQ20"]         ; # Bank 702  VCC1V2_DDR4  IO_L10P_N3P2_M0P128_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ20"]         ; 
set_property    PACKAGE_PIN BE45        [get_ports "DDR4_DIMM1_DQ21"]         ; # Bank 702  VCC1V2_DDR4  IO_L10N_N3P3_M0P129_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ21"]         ; 
set_property    PACKAGE_PIN AY44        [get_ports "DDR4_DIMM1_DQ23"]         ; # Bank 702  VCC1V2_DDR4  IO_L11P_N3P4_M0P130_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ23"]         ; 
set_property    PACKAGE_PIN AW45        [get_ports "DDR4_DIMM1_DQ22"]         ; # Bank 702  VCC1V2_DDR4  IO_L11N_N3P5_M0P131_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ22"]         ; 
set_property    PACKAGE_PIN AY42        [get_ports "DDR4_DIMM1_DQS1_T"]       ; # Bank 702  VCC1V2_DDR4  IO_L12P_GC_XCC_N4P0_M0P132_702
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS1_T"]       ; 
set_property    PACKAGE_PIN BA43        [get_ports "DDR4_DIMM1_DQS1_C"]       ; # Bank 702  VCC1V2_DDR4  IO_L12N_GC_XCC_N4P1_M0P133_702
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS1_C"]       ; 
set_property    PACKAGE_PIN AV42        [get_ports "DDR4_DIMM1_DQ10"]         ; # Bank 702  VCC1V2_DDR4  IO_L13P_N4P2_M0P134_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ10"]         ; 
set_property    PACKAGE_PIN AV43        [get_ports "DDR4_DIMM1_DQ11"]         ; # Bank 702  VCC1V2_DDR4  IO_L13N_N4P3_M0P135_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ11"]         ; 
set_property    PACKAGE_PIN BC42        [get_ports "DDR4_DIMM1_DQ8"]          ; # Bank 702  VCC1V2_DDR4  IO_L14P_N4P4_M0P136_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ8"]          ; 
set_property    PACKAGE_PIN BC43        [get_ports "DDR4_DIMM1_DQ9"]          ; # Bank 702  VCC1V2_DDR4  IO_L14N_N4P5_M0P137_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ9"]          ; 
set_property    PACKAGE_PIN AV47        [get_ports "DDR4_DIMM1_CB2"]          ; # Bank 702  VCC1V2_DDR4  IO_L1N_N0P3_M0P111_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_CB2"]          ; 
set_property    PACKAGE_PIN BB43        [get_ports "DDR4_DIMM1_DM1_B"]        ; # Bank 702  VCC1V2_DDR4  IO_L15P_XCC_N5P0_M0P138_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DM1_B"]        ; 
#set_property   PACKAGE_PIN BA42        [get_ports "No Connect"]              ; # Bank 702  VCC1V2_DDR4  IO_L15N_XCC_N5P1_M0P139_702
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BD42        [get_ports "DDR4_DIMM1_DQ13"]         ; # Bank 702  VCC1V2_DDR4  IO_L16P_N5P2_M0P140_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ13"]         ; 
set_property    PACKAGE_PIN BE42        [get_ports "DDR4_DIMM1_DQ12"]         ; # Bank 702  VCC1V2_DDR4  IO_L16N_N5P3_M0P141_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ12"]         ; 
set_property    PACKAGE_PIN AW42        [get_ports "DDR4_DIMM1_DQ15"]         ; # Bank 702  VCC1V2_DDR4  IO_L17P_N5P4_M0P142_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ15"]         ; 
set_property    PACKAGE_PIN AW43        [get_ports "DDR4_DIMM1_DQ14"]         ; # Bank 702  VCC1V2_DDR4  IO_L17N_N5P5_M0P143_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ14"]         ; 
set_property    PACKAGE_PIN AY41        [get_ports "DDR4_DIMM1_DQS0_T"]       ; # Bank 702  VCC1V2_DDR4  IO_L18P_XCC_N6P0_M0P144_702
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS0_T"]       ; 
set_property    PACKAGE_PIN BA41        [get_ports "DDR4_DIMM1_DQS0_C"]       ; # Bank 702  VCC1V2_DDR4  IO_L18N_XCC_N6P1_M0P145_702
set_property    IOSTANDARD DIFF_POD12   [get_ports "DDR4_DIMM1_DQS0_C"]       ; 
set_property    PACKAGE_PIN AU41        [get_ports "DDR4_DIMM1_DQ3"]          ; # Bank 702  VCC1V2_DDR4  IO_L19P_N6P2_M0P146_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ3"]          ; 
set_property    PACKAGE_PIN AV41        [get_ports "DDR4_DIMM1_DQ2"]          ; # Bank 702  VCC1V2_DDR4  IO_L19N_N6P3_M0P147_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ2"]          ; 
set_property    PACKAGE_PIN BC46        [get_ports "DDR4_DIMM1_CB0"]          ; # Bank 702  VCC1V2_DDR4  IO_L2P_N0P4_M0P112_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_CB0"]          ; 
set_property    PACKAGE_PIN BE41        [get_ports "DDR4_DIMM1_DQ0"]          ; # Bank 702  VCC1V2_DDR4  IO_L20P_N6P4_M0P148_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ0"]          ; 
set_property    PACKAGE_PIN BF41        [get_ports "DDR4_DIMM1_DQ1"]          ; # Bank 702  VCC1V2_DDR4  IO_L20N_N6P5_M0P149_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ1"]          ; 
set_property    PACKAGE_PIN BC41        [get_ports "DDR4_DIMM1_DM0_B"]        ; # Bank 702  VCC1V2_DDR4  IO_L21P_XCC_N7P0_M0P150_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DM0_B"]        ; 
#set_property   PACKAGE_PIN BB41        [get_ports "No Connect"]              ; # Bank 702  VCC1V2_DDR4  IO_L21N_XCC_N7P1_M0P151_702
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BG41        [get_ports "DDR4_DIMM1_DQ4"]          ; # Bank 702  VCC1V2_DDR4  IO_L22P_N7P2_M0P152_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ4"]          ; 
set_property    PACKAGE_PIN BF42        [get_ports "DDR4_DIMM1_DQ5"]          ; # Bank 702  VCC1V2_DDR4  IO_L22N_N7P3_M0P153_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ5"]          ; 
set_property    PACKAGE_PIN AW40        [get_ports "DDR4_DIMM1_DQ7"]          ; # Bank 702  VCC1V2_DDR4  IO_L23P_N7P4_M0P154_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ7"]          ; 
set_property    PACKAGE_PIN AW41        [get_ports "DDR4_DIMM1_DQ6"]          ; # Bank 702  VCC1V2_DDR4  IO_L23N_N7P5_M0P155_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DQ6"]          ; 
#set_property   PACKAGE_PIN BF43        [get_ports "No Connect"]              ; # Bank 702  VCC1V2_DDR4  IO_L24P_GC_XCC_N8P0_M0P156_702
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN BF44        [get_ports "No Connect"]              ; # Bank 702  VCC1V2_DDR4  IO_L24N_GC_XCC_N8P1_M0P157_702
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BC47        [get_ports "DDR4_DIMM1_CB1"]          ; # Bank 702  VCC1V2_DDR4  IO_L2N_N0P5_M0P113_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_CB1"]          ; 
#set_property   PACKAGE_PIN BD43        [get_ports "No Connect"]              ; # Bank 702  VCC1V2_DDR4  IO_L25P_N8P2_M0P158_702
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN BE44        [get_ports "No Connect"]              ; # Bank 702  VCC1V2_DDR4  IO_L25N_N8P3_M0P159_702
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN BG43        [get_ports "No Connect"]              ; # Bank 702  VCC1V2_DDR4  IO_L26P_N8P4_M0P160_702
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN BG44        [get_ports "No Connect"]              ; # Bank 702  VCC1V2_DDR4  IO_L26N_N8P5_M0P161_702
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BB46        [get_ports "DDR4_DIMM1_DM8_B"]        ; # Bank 702  VCC1V2_DDR4  IO_L3P_XCC_N1P0_M0P114_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_DM8_B"]        ; 
#set_property   PACKAGE_PIN BA47        [get_ports "No Connect"]              ; # Bank 702  VCC1V2_DDR4  IO_L3N_XCC_N1P1_M0P115_702
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BE46        [get_ports "DDR4_DIMM1_CB4"]          ; # Bank 702  VCC1V2_DDR4  IO_L4P_N1P2_M0P116_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_CB4"]          ; 
set_property    PACKAGE_PIN BD47        [get_ports "DDR4_DIMM1_CB5"]          ; # Bank 702  VCC1V2_DDR4  IO_L4N_N1P3_M0P117_702
set_property    IOSTANDARD POD12        [get_ports "DDR4_DIMM1_CB5"]          ; 
set_property    PACKAGE_PIN BF39        [get_ports "LPDDR4_3_DMI2"]           ; # Bank 703  VCC1V1_LP4   IO_L0P_XCC_N0P0_M1P0_703        Actual Schem Name: LPDDR4_3_DMI2
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DMI2"]           ; 
set_property    PACKAGE_PIN BG38        [get_ports "LPDDR4_3_CSB1"]           ; # Bank 703  VCC1V1_LP4   IO_L0N_XCC_N0P1_M1P1_703        Actual Schem Name: LPDDR4_3_CSB1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CSB1"]           ; 
set_property    PACKAGE_PIN BG40        [get_ports "LPDDR4_3_DQ16"]           ; # Bank 703  VCC1V1_LP4   IO_L5P_N1P4_M1P10_703           Actual Schem Name: LPDDR4_3_DQ22
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ16"]           ; 
set_property    PACKAGE_PIN BG39        [get_ports "LPDDR4_3_DQ23"]           ; # Bank 703  VCC1V1_LP4   IO_L5N_N1P5_M1P11_703           Actual Schem Name: LPDDR4_3_DQ17
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ23"]           ; 
set_property    PACKAGE_PIN BD39        [get_ports "LPDDR4_3_CKEB1"]          ; # Bank 703  VCC1V1_LP4   IO_L6P_GC_XCC_N2P0_M1P12_703    Actual Schem Name: LPDDR4_3_CKEB1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CKEB1"]          ; 
set_property    PACKAGE_PIN BD38        [get_ports "LPDDR4_3_CKEB0"]          ; # Bank 703  VCC1V1_LP4   IO_L6N_GC_XCC_N2P1_M1P13_703    Actual Schem Name: LPDDR4_3_CKEB0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CKEB0"]          ; 
#set_property   PACKAGE_PIN BC40        [get_ports "No Connect"]              ; # Bank 703  VCC1V1_LP4   IO_L7P_N2P2_M1P14_703           
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN BD40        [get_ports "No Connect"]              ; # Bank 703  VCC1V1_LP4   IO_L7N_N2P3_M1P15_703           
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BB36        [get_ports "LPDDR4_3_CAB5"]           ; # Bank 703  VCC1V1_LP4   IO_L8P_N2P4_M1P16_703           Actual Schem Name: LPDDR4_3_CAB5
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CAB5"]           ; 
set_property    PACKAGE_PIN BC36        [get_ports "LPDDR4_3_CAB2"]           ; # Bank 703  VCC1V1_LP4   IO_L8N_N2P5_M1P17_703           Actual Schem Name: LPDDR4_3_CAB2
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CAB2"]           ; 
set_property    PACKAGE_PIN BD37         [get_ports "LPDDR4_3_CKB_T"]         ; # Bank 703  VCC1V1_LP4   IO_L9P_GC_XCC_N3P0_M1P18_703    Actual Schem Name: LPDDR4_3_CKB_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_3_CKB_T"]         ; 
set_property    PACKAGE_PIN BC37         [get_ports "LPDDR4_3_CKB_C"]         ; # Bank 703  VCC1V1_LP4   IO_L9N_GC_XCC_N3P1_M1P19_703    Actual Schem Name: LPDDR4_3_CKB_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_3_CKB_C"]         ; 
set_property    PACKAGE_PIN BE40        [get_ports "LPDDR4_3_DQ17"]           ; # Bank 703  VCC1V1_LP4   IO_L1P_N0P2_M1P2_703            Actual Schem Name: LPDDR4_3_DQ16
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ17"]           ; 
set_property    PACKAGE_PIN BB35        [get_ports "LPDDR4_3_CAB4"]           ; # Bank 703  VCC1V1_LP4   IO_L10P_N3P2_M1P20_703          Actual Schem Name: LPDDR4_3_CAB4
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CAB4"]           ; 
set_property    PACKAGE_PIN BC35        [get_ports "LPDDR4_3_CAB3"]           ; # Bank 703  VCC1V1_LP4   IO_L10N_N3P3_M1P21_703          Actual Schem Name: LPDDR4_3_CAB3
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CAB3"]           ; 
set_property    PACKAGE_PIN BB38        [get_ports "LPDDR4_3_CAB0"]           ; # Bank 703  VCC1V1_LP4   IO_L11P_N3P4_M1P22_703          Actual Schem Name: LPDDR4_3_CAB0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CAB0"]           ; 
set_property    PACKAGE_PIN BC38        [get_ports "LPDDR4_3_CAB1"]           ; # Bank 703  VCC1V1_LP4   IO_L11N_N3P5_M1P23_703          Actual Schem Name: LPDDR4_3_CAB1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CAB1"]           ; 
set_property    PACKAGE_PIN AV38         [get_ports "LPDDR4_3_DQS0_T"]        ; # Bank 703  VCC1V1_LP4   IO_L12P_GC_XCC_N4P0_M1P24_703   Actual Schem Name: LPDDR4_3_DQS0_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_3_DQS0_T"]        ; 
set_property    PACKAGE_PIN AW37         [get_ports "LPDDR4_3_DQS0_C"]        ; # Bank 703  VCC1V1_LP4   IO_L12N_GC_XCC_N4P1_M1P25_703   Actual Schem Name: LPDDR4_3_DQS0_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_3_DQS0_C"]        ; 
set_property    PACKAGE_PIN AW39        [get_ports "LPDDR4_3_DQ0"]            ; # Bank 703  VCC1V1_LP4   IO_L13P_N4P2_M1P26_703          Actual Schem Name: LPDDR4_3_DQ4
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ0"]            ; 
set_property    PACKAGE_PIN AY39        [get_ports "LPDDR4_3_DQ1"]            ; # Bank 703  VCC1V1_LP4   IO_L13N_N4P3_M1P27_703          Actual Schem Name: LPDDR4_3_DQ5
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ1"]            ; 
set_property    PACKAGE_PIN AW35        [get_ports "LPDDR4_3_DQ6"]            ; # Bank 703  VCC1V1_LP4   IO_L14P_N4P4_M1P28_703          Actual Schem Name: LPDDR4_3_DQ6
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ6"]            ; 
set_property    PACKAGE_PIN AY35        [get_ports "LPDDR4_3_DQ7"]            ; # Bank 703  VCC1V1_LP4   IO_L14N_N4P5_M1P29_703          Actual Schem Name: LPDDR4_3_DQ1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ7"]            ; 
set_property    PACKAGE_PIN BE39        [get_ports "LPDDR4_3_DQ22"]           ; # Bank 703  VCC1V1_LP4   IO_L1N_N0P3_M1P3_703            Actual Schem Name: LPDDR4_3_DQ23
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ22"]           ; 
set_property    PACKAGE_PIN AW36        [get_ports "LPDDR4_3_DMI0"]           ; # Bank 703  VCC1V1_LP4   IO_L15P_XCC_N5P0_M1P30_703      Actual Schem Name: LPDDR4_3_DMI0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DMI0"]           ; 
set_property    PACKAGE_PIN AV37        [get_ports "LPDDR4_3_CSB0"]           ; # Bank 703  VCC1V1_LP4   IO_L15N_XCC_N5P1_M1P31_703      Actual Schem Name: LPDDR4_3_CSB0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CSB0"]           ; 
set_property    PACKAGE_PIN AU35        [get_ports "LPDDR4_3_DQ4"]            ; # Bank 703  VCC1V1_LP4   IO_L16P_N5P2_M1P32_703          Actual Schem Name: LPDDR4_3_DQ7
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ4"]            ; 
set_property    PACKAGE_PIN AV35        [get_ports "LPDDR4_3_DQ5"]            ; # Bank 703  VCC1V1_LP4   IO_L16N_N5P3_M1P33_703          Actual Schem Name: LPDDR4_3_DQ0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ5"]            ; 
set_property    PACKAGE_PIN AU37        [get_ports "LPDDR4_3_DQ2"]            ; # Bank 703  VCC1V1_LP4   IO_L17P_N5P4_M1P34_703          Actual Schem Name: LPDDR4_3_DQ2
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ2"]            ; 
set_property    PACKAGE_PIN AU36        [get_ports "LPDDR4_3_DQ3"]            ; # Bank 703  VCC1V1_LP4   IO_L17N_N5P5_M1P35_703          Actual Schem Name: LPDDR4_3_DQ3
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ3"]            ; 
set_property    PACKAGE_PIN AT38        [get_ports "LPDDR4_3_CSA0"]           ; # Bank 703  VCC1V1_LP4   IO_L18P_XCC_N6P0_M1P36_703      Actual Schem Name: LPDDR4_3_CSA0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CSA0"]           ; 
set_property    PACKAGE_PIN AT37        [get_ports "LPDDR4_3_CKEA1"]          ; # Bank 703  VCC1V1_LP4   IO_L18N_XCC_N6P1_M1P37_703      Actual Schem Name: LPDDR4_3_CKEA1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CKEA1"]          ; 
set_property    PACKAGE_PIN AM36        [get_ports "LPDDR4_3_CAA1"]           ; # Bank 703  VCC1V1_LP4   IO_L19P_N6P2_M1P38_703          Actual Schem Name: LPDDR4_3_CAA1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CAA1"]           ; 
set_property    PACKAGE_PIN AM35        [get_ports "LPDDR4_3_CAA0"]           ; # Bank 703  VCC1V1_LP4   IO_L19N_N6P3_M1P39_703          Actual Schem Name: LPDDR4_3_CAA0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CAA0"]           ; 
set_property    PACKAGE_PIN BF37        [get_ports "LPDDR4_3_DQ18"]           ; # Bank 703  VCC1V1_LP4   IO_L2P_N0P4_M1P4_703            Actual Schem Name: LPDDR4_3_DQ18
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ18"]           ; 
set_property    PACKAGE_PIN AR35        [get_ports "LPDDR4_3_CAA3"]           ; # Bank 703  VCC1V1_LP4   IO_L20P_N6P4_M1P40_703          Actual Schem Name: LPDDR4_3_CAA3
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CAA3"]           ; 
set_property    PACKAGE_PIN AT35        [get_ports "LPDDR4_3_CAA2"]           ; # Bank 703  VCC1V1_LP4   IO_L20N_N6P5_M1P41_703          Actual Schem Name: LPDDR4_3_CAA2
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CAA2"]           ; 
set_property    PACKAGE_PIN AR36        [get_ports "LPDDR4_3_CKA_T"]          ; # Bank 703  VCC1V1_LP4   IO_L21P_XCC_N7P0_M1P42_703      Actual Schem Name: LPDDR4_3_CKA_T
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CKA_T"]          ; 
set_property    PACKAGE_PIN AP37        [get_ports "LPDDR4_3_CKA_C"]          ; # Bank 703  VCC1V1_LP4   IO_L21N_XCC_N7P1_M1P43_703      Actual Schem Name: LPDDR4_3_CKA_C
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CKA_C"]          ; 
set_property    PACKAGE_PIN AN35        [get_ports "LPDDR4_3_CAA4"]           ; # Bank 703  VCC1V1_LP4   IO_L22P_N7P2_M1P44_703          Actual Schem Name: LPDDR4_3_CAA4
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CAA4"]           ; 
set_property    PACKAGE_PIN AP36        [get_ports "LPDDR4_3_CAA5"]           ; # Bank 703  VCC1V1_LP4   IO_L22N_N7P3_M1P45_703          Actual Schem Name: LPDDR4_3_CAA5
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CAA5"]           ; 
set_property    PACKAGE_PIN AP38        [get_ports "LPDDR4_3_CKEA0"]          ; # Bank 703  VCC1V1_LP4   IO_L23P_N7P4_M1P46_703          Actual Schem Name: LPDDR4_3_CKEA0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CKEA0"]          ; 
set_property    PACKAGE_PIN AR37        [get_ports "LPDDR4_3_CSA1"]           ; # Bank 703  VCC1V1_LP4   IO_L23N_N7P5_M1P47_703          Actual Schem Name: LPDDR4_3_CSA1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_CSA1"]           ; 
#set_property   PACKAGE_PIN AY37        [get_ports "No Connect"]              ; # Bank 703  VCC1V1_LP4   IO_L24P_GC_XCC_N8P0_M1P48_703   
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN BA37        [get_ports "No Connect"]              ; # Bank 703  VCC1V1_LP4   IO_L24N_GC_XCC_N8P1_M1P49_703   
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BG36        [get_ports "LPDDR4_3_DQ21"]           ; # Bank 703  VCC1V1_LP4   IO_L2N_N0P5_M1P5_703            Actual Schem Name: LPDDR4_3_DQ19
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ21"]           ; 
#set_property   PACKAGE_PIN AY38        [get_ports "No Connect"]              ; # Bank 703  VCC1V1_LP4   IO_L25P_N8P2_M1P50_703          
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN BA39        [get_ports "No Connect"]              ; # Bank 703  VCC1V1_LP4   IO_L25N_N8P3_M1P51_703          
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN BA36        [get_ports "No Connect"]              ; # Bank 703  VCC1V1_LP4   IO_L26P_N8P4_M1P52_703          
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN BA35        [get_ports "No Connect"]              ; # Bank 703  VCC1V1_LP4   IO_L26N_N8P5_M1P53_703          
set_property    IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BE37         [get_ports "LPDDR4_3_DQS2_T"]        ; # Bank 703  VCC1V1_LP4   IO_L3P_XCC_N1P0_M1P6_703        Actual Schem Name: LPDDR4_3_DQS2_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_3_DQS2_T"]        ; 
set_property    PACKAGE_PIN BF38         [get_ports "LPDDR4_3_DQS2_C"]        ; # Bank 703  VCC1V1_LP4   IO_L3N_XCC_N1P1_M1P7_703        Actual Schem Name: LPDDR4_3_DQS2_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_3_DQS2_C"]        ; 
set_property    PACKAGE_PIN BE36        [get_ports "LPDDR4_3_DQ20"]           ; # Bank 703  VCC1V1_LP4   IO_L4P_N1P2_M1P8_703            Actual Schem Name: LPDDR4_3_DQ20
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ20"]           ; 
set_property    PACKAGE_PIN BF36        [get_ports "LPDDR4_3_DQ19"]           ; # Bank 703  VCC1V1_LP4   IO_L4N_N1P3_M1P9_703            Actual Schem Name: LPDDR4_3_DQ21
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ19"]           ; 
set_property    PACKAGE_PIN BF33         [get_ports "LPDDR4_3_DQS1_T"]        ; # Bank 704  VCC1V1_LP4   IO_L0P_XCC_N0P0_M1P54_704       Actual Schem Name: LPDDR4_3_DQS1_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_3_DQS1_T"]        ; 
set_property    PACKAGE_PIN BG33         [get_ports "LPDDR4_3_DQS1_C"]        ; # Bank 704  VCC1V1_LP4   IO_L0N_XCC_N0P1_M1P55_704       Actual Schem Name: LPDDR4_3_DQS1_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_3_DQS1_C"]        ; 
set_property    PACKAGE_PIN BG35        [get_ports "LPDDR4_3_DQ8"]            ; # Bank 704  VCC1V1_LP4   IO_L5P_N1P4_M1P64_704           Actual Schem Name: LPDDR4_3_DQ12
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ8"]            ; 
set_property    PACKAGE_PIN BG34        [get_ports "LPDDR4_3_DQ11"]           ; # Bank 704  VCC1V1_LP4   IO_L5N_N1P5_M1P65_704           Actual Schem Name: LPDDR4_3_DQ13
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ11"]           ; 
set_property    PACKAGE_PIN BC31        [get_ports "LPDDR4_2_DMI0"]           ; # Bank 704  VCC1V1_LP4   IO_L6P_GC_XCC_N2P0_M1P66_704    Actual Schem Name: LPDDR4_2_DMI0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DMI0"]           ; 
#set_property   PACKAGE_PIN BC30        [get_ports "No Connect"]              ; # Bank 704  VCC1V1_LP4   IO_L6N_GC_XCC_N2P1_M1P67_704    
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BB31        [get_ports "LPDDR4_2_DQ7"]            ; # Bank 704  VCC1V1_LP4   IO_L7P_N2P2_M1P68_704           Actual Schem Name: LPDDR4_2_DQ7
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ7"]            ; 
set_property    PACKAGE_PIN BB30        [get_ports "LPDDR4_2_DQ5"]            ; # Bank 704  VCC1V1_LP4   IO_L7N_N2P3_M1P69_704           Actual Schem Name: LPDDR4_2_DQ6
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ5"]            ; 
set_property    PACKAGE_PIN BE32        [get_ports "LPDDR4_2_DQ2"]            ; # Bank 704  VCC1V1_LP4   IO_L8P_N2P4_M1P70_704           Actual Schem Name: LPDDR4_2_DQ4
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ2"]            ; 
set_property    PACKAGE_PIN BF32        [get_ports "LPDDR4_2_DQ3"]            ; # Bank 704  VCC1V1_LP4   IO_L8N_N2P5_M1P71_704           Actual Schem Name: LPDDR4_2_DQ5
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ3"]            ; 
set_property    PACKAGE_PIN BE31         [get_ports "LPDDR4_2_DQS0_T"]        ; # Bank 704  VCC1V1_LP4   IO_L9P_GC_XCC_N3P0_M1P72_704    Actual Schem Name: LPDDR4_2_DQS0_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_2_DQS0_T"]        ; 
set_property    PACKAGE_PIN BD32         [get_ports "LPDDR4_2_DQS0_C"]        ; # Bank 704  VCC1V1_LP4   IO_L9N_GC_XCC_N3P1_M1P73_704    Actual Schem Name: LPDDR4_2_DQS0_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_2_DQS0_C"]        ; 
set_property    PACKAGE_PIN BE35        [get_ports "LPDDR4_3_DQ9"]            ; # Bank 704  VCC1V1_LP4   IO_L1P_N0P2_M1P56_704           Actual Schem Name: LPDDR4_3_DQ11
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ9"]            ; 
set_property    PACKAGE_PIN BF31        [get_ports "LPDDR4_2_DQ1"]            ; # Bank 704  VCC1V1_LP4   IO_L10P_N3P2_M1P74_704          Actual Schem Name: LPDDR4_2_DQ0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ1"]            ; 
set_property    PACKAGE_PIN BG31        [get_ports "LPDDR4_2_DQ0"]            ; # Bank 704  VCC1V1_LP4   IO_L10N_N3P3_M1P75_704          Actual Schem Name: LPDDR4_2_DQ1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ0"]            ; 
set_property    PACKAGE_PIN BB33        [get_ports "LPDDR4_2_DQ4"]            ; # Bank 704  VCC1V1_LP4   IO_L11P_N3P4_M1P76_704          Actual Schem Name: LPDDR4_2_DQ2
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ4"]            ; 
set_property    PACKAGE_PIN BC32        [get_ports "LPDDR4_2_DQ6"]            ; # Bank 704  VCC1V1_LP4   IO_L11N_N3P5_M1P77_704          Actual Schem Name: LPDDR4_2_DQ3
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ6"]            ; 
set_property    PACKAGE_PIN AR33        [get_ports "LPDDR4_3_DMI3"]           ; # Bank 704  VCC1V1_LP4   IO_L12P_GC_XCC_N4P0_M1P78_704   Actual Schem Name: LPDDR4_3_DMI3
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DMI3"]           ; 
#set_property   PACKAGE_PIN AT34        [get_ports "No Connect"]              ; # Bank 704  VCC1V1_LP4   IO_L12N_GC_XCC_N4P1_M1P79_704   
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AN34        [get_ports "LPDDR4_3_DQ27"]           ; # Bank 704  VCC1V1_LP4   IO_L13P_N4P2_M1P80_704          Actual Schem Name: LPDDR4_3_DQ31
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ27"]           ; 
set_property    PACKAGE_PIN AP34        [get_ports "LPDDR4_3_DQ28"]           ; # Bank 704  VCC1V1_LP4   IO_L13N_N4P3_M1P81_704          Actual Schem Name: LPDDR4_3_DQ24
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ28"]           ; 
set_property    PACKAGE_PIN AU33        [get_ports "LPDDR4_3_DQ30"]           ; # Bank 704  VCC1V1_LP4   IO_L14P_N4P4_M1P82_704          Actual Schem Name: LPDDR4_3_DQ27
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ30"]           ; 
set_property    PACKAGE_PIN AV34        [get_ports "LPDDR4_3_DQ31"]           ; # Bank 704  VCC1V1_LP4   IO_L14N_N4P5_M1P83_704          Actual Schem Name: LPDDR4_3_DQ29
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ31"]           ; 
set_property    PACKAGE_PIN BF34        [get_ports "LPDDR4_3_DQ10"]           ; # Bank 704  VCC1V1_LP4   IO_L1N_N0P3_M1P57_704           Actual Schem Name: LPDDR4_3_DQ10
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ10"]           ; 
set_property    PACKAGE_PIN AU32         [get_ports "LPDDR4_3_DQS3_T"]        ; # Bank 704  VCC1V1_LP4   IO_L15P_XCC_N5P0_M1P84_704      Actual Schem Name: LPDDR4_3_DQS3_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_3_DQS3_T"]        ; 
set_property    PACKAGE_PIN AT32         [get_ports "LPDDR4_3_DQS3_C"]        ; # Bank 704  VCC1V1_LP4   IO_L15N_XCC_N5P1_M1P85_704      Actual Schem Name: LPDDR4_3_DQS3_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_3_DQS3_C"]        ; 
set_property    PACKAGE_PIN AV33        [get_ports "LPDDR4_3_DQ25"]           ; # Bank 704  VCC1V1_LP4   IO_L16P_N5P2_M1P86_704          Actual Schem Name: LPDDR4_3_DQ30
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ25"]           ; 
set_property    PACKAGE_PIN AW33        [get_ports "LPDDR4_3_DQ24"]           ; # Bank 704  VCC1V1_LP4   IO_L16N_N5P3_M1P87_704          Actual Schem Name: LPDDR4_3_DQ28
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ24"]           ; 
set_property    PACKAGE_PIN AP33        [get_ports "LPDDR4_3_DQ26"]           ; # Bank 704  VCC1V1_LP4   IO_L17P_N5P4_M1P88_704          Actual Schem Name: LPDDR4_3_DQ25
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ26"]           ; 
set_property    PACKAGE_PIN AR32        [get_ports "LPDDR4_3_DQ29"]           ; # Bank 704  VCC1V1_LP4   IO_L17N_N5P5_M1P89_704          Actual Schem Name: LPDDR4_3_DQ26
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ29"]           ; 
set_property    PACKAGE_PIN AN32        [get_ports "LPDDR4_2_DMI2"]           ; # Bank 704  VCC1V1_LP4   IO_L18P_XCC_N6P0_M1P90_704      Actual Schem Name: LPDDR4_2_DMI2
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DMI2"]           ; 
#set_property   PACKAGE_PIN AP31        [get_ports "No Connect"]              ; # Bank 704  VCC1V1_LP4   IO_L18N_XCC_N6P1_M1P91_704      
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AM33        [get_ports "LPDDR4_2_DQ22"]           ; # Bank 704  VCC1V1_LP4   IO_L19P_N6P2_M1P92_704          Actual Schem Name: LPDDR4_2_DQ23
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ22"]           ; 
set_property    PACKAGE_PIN AM32        [get_ports "LPDDR4_2_DQ23"]           ; # Bank 704  VCC1V1_LP4   IO_L19N_N6P3_M1P93_704          Actual Schem Name: LPDDR4_2_DQ22
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ23"]           ; 
set_property    PACKAGE_PIN BD35        [get_ports "LPDDR4_3_DQ15"]           ; # Bank 704  VCC1V1_LP4   IO_L2P_N0P4_M1P58_704           Actual Schem Name: LPDDR4_3_DQ8
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ15"]           ; 
set_property    PACKAGE_PIN AV31        [get_ports "LPDDR4_2_DQ19"]           ; # Bank 704  VCC1V1_LP4   IO_L20P_N6P4_M1P94_704          Actual Schem Name: LPDDR4_2_DQ19
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ19"]           ; 
set_property    PACKAGE_PIN AV30        [get_ports "LPDDR4_2_DQ17"]           ; # Bank 704  VCC1V1_LP4   IO_L20N_N6P5_M1P95_704          Actual Schem Name: LPDDR4_2_DQ18
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ17"]           ; 
set_property    PACKAGE_PIN AR30         [get_ports "LPDDR4_2_DQS2_T"]        ; # Bank 704  VCC1V1_LP4   IO_L21P_XCC_N7P0_M1P96_704      Actual Schem Name: LPDDR4_2_DQS2_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_2_DQS2_T"]        ; 
set_property    PACKAGE_PIN AP30         [get_ports "LPDDR4_2_DQS2_C"]        ; # Bank 704  VCC1V1_LP4   IO_L21N_XCC_N7P1_M1P97_704      Actual Schem Name: LPDDR4_2_DQS2_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_2_DQS2_C"]        ; 
set_property    PACKAGE_PIN AT31        [get_ports "LPDDR4_2_DQ16"]           ; # Bank 704  VCC1V1_LP4   IO_L22P_N7P2_M1P98_704          Actual Schem Name: LPDDR4_2_DQ16
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ16"]           ; 
set_property    PACKAGE_PIN AU31        [get_ports "LPDDR4_2_DQ18"]           ; # Bank 704  VCC1V1_LP4   IO_L22N_N7P3_M1P99_704          Actual Schem Name: LPDDR4_2_DQ17
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ18"]           ; 
set_property    PACKAGE_PIN AM30        [get_ports "LPDDR4_2_DQ20"]           ; # Bank 704  VCC1V1_LP4   IO_L23P_N7P4_M1P100_704         Actual Schem Name: LPDDR4_2_DQ20
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ20"]           ; 
set_property    PACKAGE_PIN AN31        [get_ports "LPDDR4_2_DQ21"]           ; # Bank 704  VCC1V1_LP4   IO_L23N_N7P5_M1P101_704         Actual Schem Name: LPDDR4_2_DQ21
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ21"]           ; 
#set_property   PACKAGE_PIN AY31        [get_ports "No Connect"]              ; # Bank 704  VCC1V1_LP4   IO_L24P_GC_XCC_N8P0_M1P102_704  
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN BA31        [get_ports "No Connect"]              ; # Bank 704  VCC1V1_LP4   IO_L24N_GC_XCC_N8P1_M1P103_704  
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BD34        [get_ports "LPDDR4_3_DQ14"]           ; # Bank 704  VCC1V1_LP4   IO_L2N_N0P5_M1P59_704           Actual Schem Name: LPDDR4_3_DQ9
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ14"]           ; 
#set_property   PACKAGE_PIN BA33        [get_ports "No Connect"]              ; # Bank 704  VCC1V1_LP4   IO_L25P_N8P2_M1P104_704         
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN BA32        [get_ports "No Connect"]              ; # Bank 704  VCC1V1_LP4   IO_L25N_N8P3_M1P105_704         
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN AW31        [get_ports "No Connect"]              ; # Bank 704  VCC1V1_LP4   IO_L26P_N8P4_M1P106_704         
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN AY30        [get_ports "No Connect"]              ; # Bank 704  VCC1V1_LP4   IO_L26N_N8P5_M1P107_704         
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BD33        [get_ports "LPDDR4_3_DMI1"]           ; # Bank 704  VCC1V1_LP4   IO_L3P_XCC_N1P0_M1P60_704       Actual Schem Name: LPDDR4_3_DMI1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DMI1"]           ; 
#set_property   PACKAGE_PIN BE34        [get_ports "No Connect"]              ; # Bank 704  VCC1V1_LP4   IO_L3N_XCC_N1P1_M1P61_704       
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BB34        [get_ports "LPDDR4_3_DQ12"]           ; # Bank 704  VCC1V1_LP4   IO_L4P_N1P2_M1P62_704           Actual Schem Name: LPDDR4_3_DQ15
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ12"]           ; 
set_property    PACKAGE_PIN BC33        [get_ports "LPDDR4_3_DQ13"]           ; # Bank 704  VCC1V1_LP4   IO_L4N_N1P3_M1P63_704           Actual Schem Name: LPDDR4_3_DQ14
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_DQ13"]           ; 
set_property    PACKAGE_PIN BF29        [get_ports "LPDDR4_2_CAA2"]           ; # Bank 705  VCC1V1_LP4   IO_L0P_XCC_N0P0_M1P108_705      Actual Schem Name: LPDDR4_2_CAA2
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CAA2"]           ; 
set_property    PACKAGE_PIN BG28        [get_ports "LPDDR4_2_CSA1"]           ; # Bank 705  VCC1V1_LP4   IO_L0N_XCC_N0P1_M1P109_705      Actual Schem Name: LPDDR4_2_CSA1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CSA1"]           ; 
set_property    PACKAGE_PIN BG30        [get_ports "LPDDR4_2_CKEA0"]          ; # Bank 705  VCC1V1_LP4   IO_L5P_N1P4_M1P118_705          Actual Schem Name: LPDDR4_2_CKEA0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CKEA0"]          ; 
set_property    PACKAGE_PIN BG29        [get_ports "LPDDR4_2_CKEA1"]          ; # Bank 705  VCC1V1_LP4   IO_L5N_N1P5_M1P119_705          Actual Schem Name: LPDDR4_2_CKEA1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CKEA1"]          ; 
#set_property   PACKAGE_PIN BC28        [get_ports "No Connect"]              ; # Bank 705  VCC1V1_LP4   IO_L6P_GC_XCC_N2P0_M1P120_705   
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN BD28        [get_ports "No Connect"]              ; # Bank 705  VCC1V1_LP4   IO_L6N_GC_XCC_N2P1_M1P121_705   
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BB29        [get_ports "LPDDR4_2_CAB0"]           ; # Bank 705  VCC1V1_LP4   IO_L7P_N2P2_M1P122_705          Actual Schem Name: LPDDR4_2_CAB0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CAB0"]           ; 
set_property    PACKAGE_PIN BB28        [get_ports "LPDDR4_2_CKEB1"]          ; # Bank 705  VCC1V1_LP4   IO_L7N_N2P3_M1P123_705          Actual Schem Name: LPDDR4_2_CKEB1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CKEB1"]          ; 
set_property    PACKAGE_PIN BB26        [get_ports "LPDDR4_2_CAB3"]           ; # Bank 705  VCC1V1_LP4   IO_L8P_N2P4_M1P124_705          Actual Schem Name: LPDDR4_2_CAB3
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CAB3"]           ; 
set_property    PACKAGE_PIN BC26        [get_ports "LPDDR4_2_CAB2"]           ; # Bank 705  VCC1V1_LP4   IO_L8N_N2P5_M1P125_705          Actual Schem Name: LPDDR4_2_CAB2
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CAB2"]           ; 
set_property    PACKAGE_PIN BD27         [get_ports "LPDDR4_2_CKB_T"]         ; # Bank 705  VCC1V1_LP4   IO_L9P_GC_XCC_N3P0_M1P126_705   Actual Schem Name: LPDDR4_2_CKB_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_2_CKB_T"]         ; 
set_property    PACKAGE_PIN BC27         [get_ports "LPDDR4_2_CKB_C"]         ; # Bank 705  VCC1V1_LP4   IO_L9N_GC_XCC_N3P1_M1P127_705   Actual Schem Name: LPDDR4_2_CKB_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_2_CKB_C"]         ; 
set_property    PACKAGE_PIN BE30        [get_ports "LPDDR4_2_CAA1"]           ; # Bank 705  VCC1V1_LP4   IO_L1P_N0P2_M1P110_705          Actual Schem Name: LPDDR4_2_CAA1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CAA1"]           ; 
set_property    PACKAGE_PIN BA28        [get_ports "LPDDR4_2_CAB5"]           ; # Bank 705  VCC1V1_LP4   IO_L10P_N3P2_M1P128_705         Actual Schem Name: LPDDR4_2_CAB5
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CAB5"]           ; 
set_property    PACKAGE_PIN BA27        [get_ports "LPDDR4_2_CAB4"]           ; # Bank 705  VCC1V1_LP4   IO_L10N_N3P3_M1P129_705         Actual Schem Name: LPDDR4_2_CAB4
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CAB4"]           ; 
set_property    PACKAGE_PIN BD30        [get_ports "LPDDR4_2_CKEB0"]          ; # Bank 705  VCC1V1_LP4   IO_L11P_N3P4_M1P130_705         Actual Schem Name: LPDDR4_2_CKEB0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CKEB0"]          ; 
set_property    PACKAGE_PIN BD29        [get_ports "LPDDR4_2_CAB1"]           ; # Bank 705  VCC1V1_LP4   IO_L11N_N3P5_M1P131_705         Actual Schem Name: LPDDR4_2_CAB1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CAB1"]           ; 
set_property    PACKAGE_PIN AU28        [get_ports "LPDDR4_2_DMI1"]           ; # Bank 705  VCC1V1_LP4   IO_L12P_GC_XCC_N4P0_M1P132_705  Actual Schem Name: LPDDR4_2_DMI1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DMI1"]           ; 
set_property    PACKAGE_PIN AV27        [get_ports "LPDDR4_2_CSB1"]           ; # Bank 705  VCC1V1_LP4   IO_L12N_GC_XCC_N4P1_M1P133_705  Actual Schem Name: LPDDR4_2_CSB1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CSB1"]           ; 
set_property    PACKAGE_PIN AT29        [get_ports "LPDDR4_2_DQ12"]           ; # Bank 705  VCC1V1_LP4   IO_L13P_N4P2_M1P134_705         Actual Schem Name: LPDDR4_2_DQ8
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ12"]           ; 
set_property    PACKAGE_PIN AU29        [get_ports "LPDDR4_2_DQ14"]           ; # Bank 705  VCC1V1_LP4   IO_L13N_N4P3_M1P135_705         Actual Schem Name: LPDDR4_2_DQ15
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ14"]           ; 
set_property    PACKAGE_PIN AT26        [get_ports "LPDDR4_2_DQ10"]           ; # Bank 705  VCC1V1_LP4   IO_L14P_N4P4_M1P136_705         Actual Schem Name: LPDDR4_2_DQ10
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ10"]           ; 
set_property    PACKAGE_PIN AT25        [get_ports "LPDDR4_2_DQ11"]           ; # Bank 705  VCC1V1_LP4   IO_L14N_N4P5_M1P137_705         Actual Schem Name: LPDDR4_2_DQ11
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ11"]           ; 
set_property    PACKAGE_PIN BE29        [get_ports "LPDDR4_2_CAA0"]           ; # Bank 705  VCC1V1_LP4   IO_L1N_N0P3_M1P111_705          Actual Schem Name: LPDDR4_2_CAA0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CAA0"]           ; 
set_property    PACKAGE_PIN AV26         [get_ports "LPDDR4_2_DQS1_T"]        ; # Bank 705  VCC1V1_LP4   IO_L15P_XCC_N5P0_M1P138_705     Actual Schem Name: LPDDR4_2_DQS1_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_2_DQS1_T"]        ; 
set_property    PACKAGE_PIN AU27         [get_ports "LPDDR4_2_DQS1_C"]        ; # Bank 705  VCC1V1_LP4   IO_L15N_XCC_N5P1_M1P139_705     Actual Schem Name: LPDDR4_2_DQS1_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_2_DQS1_C"]        ; 
set_property    PACKAGE_PIN AU25        [get_ports "LPDDR4_2_DQ8"]            ; # Bank 705  VCC1V1_LP4   IO_L16P_N5P2_M1P140_705         Actual Schem Name: LPDDR4_2_DQ13
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ8"]            ; 
set_property    PACKAGE_PIN AV25        [get_ports "LPDDR4_2_DQ9"]            ; # Bank 705  VCC1V1_LP4   IO_L16N_N5P3_M1P141_705         Actual Schem Name: LPDDR4_2_DQ12
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ9"]            ; 
set_property    PACKAGE_PIN AR29        [get_ports "LPDDR4_2_DQ13"]           ; # Bank 705  VCC1V1_LP4   IO_L17P_N5P4_M1P142_705         Actual Schem Name: LPDDR4_2_DQ9
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ13"]           ; 
set_property    PACKAGE_PIN AT28        [get_ports "LPDDR4_2_DQ15"]           ; # Bank 705  VCC1V1_LP4   IO_L17N_N5P5_M1P143_705         Actual Schem Name: LPDDR4_2_DQ14
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ15"]           ; 
set_property    PACKAGE_PIN AP28         [get_ports "LPDDR4_2_DQS3_T"]        ; # Bank 705  VCC1V1_LP4   IO_L18P_XCC_N6P0_M1P144_705     Actual Schem Name: LPDDR4_2_DQS3_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_2_DQS3_T"]        ; 
set_property    PACKAGE_PIN AR27         [get_ports "LPDDR4_2_DQS3_C"]        ; # Bank 705  VCC1V1_LP4   IO_L18N_XCC_N6P1_M1P145_705     Actual Schem Name: LPDDR4_2_DQS3_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_2_DQS3_C"]        ; 
set_property    PACKAGE_PIN AM29        [get_ports "LPDDR4_2_DQ29"]           ; # Bank 705  VCC1V1_LP4   IO_L19P_N6P2_M1P146_705         Actual Schem Name: LPDDR4_2_DQ29
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ29"]           ; 
set_property    PACKAGE_PIN AN29        [get_ports "LPDDR4_2_DQ28"]           ; # Bank 705  VCC1V1_LP4   IO_L19N_N6P3_M1P147_705         Actual Schem Name: LPDDR4_2_DQ28
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ28"]           ; 
set_property    PACKAGE_PIN BE26        [get_ports "LPDDR4_2_CSA0"]           ; # Bank 705  VCC1V1_LP4   IO_L2P_N0P4_M1P112_705          Actual Schem Name: LPDDR4_2_CSA0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CSA0"]           ; 
set_property    PACKAGE_PIN AM26        [get_ports "LPDDR4_2_DQ27"]           ; # Bank 705  VCC1V1_LP4   IO_L20P_N6P4_M1P148_705         Actual Schem Name: LPDDR4_2_DQ24
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ27"]           ; 
set_property    PACKAGE_PIN AN26        [get_ports "LPDDR4_2_DQ30"]           ; # Bank 705  VCC1V1_LP4   IO_L20N_N6P5_M1P149_705         Actual Schem Name: LPDDR4_2_DQ25
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ30"]           ; 
set_property    PACKAGE_PIN AR26        [get_ports "LPDDR4_2_DMI3"]           ; # Bank 705  VCC1V1_LP4   IO_L21P_XCC_N7P0_M1P150_705     Actual Schem Name: LPDDR4_2_DMI3
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DMI3"]           ; 
set_property    PACKAGE_PIN AP27        [get_ports "LPDDR4_2_CSB0"]           ; # Bank 705  VCC1V1_LP4   IO_L21N_XCC_N7P1_M1P151_705     Actual Schem Name: LPDDR4_2_CSB0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CSB0"]           ; 
set_property    PACKAGE_PIN AN25        [get_ports "LPDDR4_2_DQ25"]           ; # Bank 705  VCC1V1_LP4   IO_L22P_N7P2_M1P152_705         Actual Schem Name: LPDDR4_2_DQ30
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ25"]           ; 
set_property    PACKAGE_PIN AP25        [get_ports "LPDDR4_2_DQ24"]           ; # Bank 705  VCC1V1_LP4   IO_L22N_N7P3_M1P153_705         Actual Schem Name: LPDDR4_2_DQ31
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ24"]           ; 
set_property    PACKAGE_PIN AM27        [get_ports "LPDDR4_2_DQ26"]           ; # Bank 705  VCC1V1_LP4   IO_L23P_N7P4_M1P154_705         Actual Schem Name: LPDDR4_2_DQ27
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ26"]           ; 
set_property    PACKAGE_PIN AN28        [get_ports "LPDDR4_2_DQ31"]           ; # Bank 705  VCC1V1_LP4   IO_L23N_N7P5_M1P155_705         Actual Schem Name: LPDDR4_2_DQ26
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_DQ31"]           ; 
set_property    PACKAGE_PIN AW27         [get_ports "LPDDR4_SMA_CLK2_P"]      ; # Bank 705  VCC1V1_LP4   IO_L24P_GC_XCC_N8P0_M1P156_705  Actual Schem Name: LPDDR4_SMA_CLK2_P
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_SMA_CLK2_P"       ; 
set_property    PACKAGE_PIN AY27         [get_ports "LPDDR4_SMA_CLK2_N"]      ; # Bank 705  VCC1V1_LP4   IO_L24N_GC_XCC_N8P1_M1P157_705  Actual Schem Name: LPDDR4_SMA_CLK2_N
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_SMA_CLK2_N"       ; 
set_property    PACKAGE_PIN BF27        [get_ports "LPDDR4_2_CAA3"]           ; # Bank 705  VCC1V1_LP4   IO_L2N_N0P5_M1P113_705          Actual Schem Name: LPDDR4_2_CAA3
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CAA3"]           ; 
set_property    PACKAGE_PIN AV29        [get_ports "LPDDR4_2_RESET_B"]        ; # Bank 705  VCC1V1_LP4   IO_L25P_N8P2_M1P158_705         Actual Schem Name: LPDDR4_2_RESET_B
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_RESET_B"]        ; 
set_property    PACKAGE_PIN AW28        [get_ports "LPDDR4_3_RESET_B"]        ; # Bank 705  VCC1V1_LP4   IO_L25N_N8P3_M1P159_705         Actual Schem Name: LPDDR4_3_RESET_B
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_3_RESET_B"]        ; 
set_property    PACKAGE_PIN AW25        [get_ports "LPDDR4_DEBUG2"]           ; # Bank 705  VCC1V1_LP4   IO_L26P_N8P4_M1P160_705         Actual Schem Name: LPDDR4_DEBUG2
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_DEBUG2"]           ; 
#set_property   PACKAGE_PIN AY26        [get_ports "No Connect"]              ; # Bank 705  VCC1V1_LP4   IO_L26N_N8P5_M1P161_705         
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BE27         [get_ports "LPDDR4_2_CKA_T"]         ; # Bank 705  VCC1V1_LP4   IO_L3P_XCC_N1P0_M1P114_705      Actual Schem Name: LPDDR4_2_CKA_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_2_CKA_T"]         ; 
set_property    PACKAGE_PIN BF28         [get_ports "LPDDR4_2_CKA_C"]         ; # Bank 705  VCC1V1_LP4   IO_L3N_XCC_N1P1_M1P115_705      Actual Schem Name: LPDDR4_2_CKA_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_2_CKA_C"]         ; 
set_property    PACKAGE_PIN BF26        [get_ports "LPDDR4_2_CAA4"]           ; # Bank 705  VCC1V1_LP4   IO_L4P_N1P2_M1P116_705          Actual Schem Name: LPDDR4_2_CAA4
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CAA4"]           ; 
set_property    PACKAGE_PIN BG26        [get_ports "LPDDR4_2_CAA5"]           ; # Bank 705  VCC1V1_LP4   IO_L4N_N1P3_M1P117_705          Actual Schem Name: LPDDR4_2_CAA5
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_2_CAA5"]           ; 
##
set_property    INTERNAL_VREF 0.75      [get_iobanks 706]                     ; # Bank 706 Assumes VADJ is set to 1.5V
##
set_property    PACKAGE_PIN BF23        [get_ports "FMCP1_LA11_P"]            ; # Bank 706  VADJ_FMC     IO_L0P_XCC_N0P0_M2P0_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA11_P"]            ; 
set_property    PACKAGE_PIN BE22        [get_ports "FMCP1_LA11_N"]            ; # Bank 706  VADJ_FMC     IO_L0N_XCC_N0P1_M2P1_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA11_N"]            ; 
set_property    PACKAGE_PIN BF24        [get_ports "FMCP1_LA05_P"]            ; # Bank 706  VADJ_FMC     IO_L5P_N1P4_M2P10_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA05_P"]            ; 
set_property    PACKAGE_PIN BG23        [get_ports "FMCP1_LA05_N"]            ; # Bank 706  VADJ_FMC     IO_L5N_N1P5_M2P11_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA05_N"]            ; 
set_property    PACKAGE_PIN BD23        [get_ports "FMCP1_LA00_CC_P"]         ; # Bank 706  VADJ_FMC     IO_L6P_GC_XCC_N2P0_M2P12_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA00_CC_P"]         ; 
set_property    PACKAGE_PIN BD24        [get_ports "FMCP1_LA00_CC_N"]         ; # Bank 706  VADJ_FMC     IO_L6N_GC_XCC_N2P1_M2P13_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA00_CC_N"]         ; 
set_property    PACKAGE_PIN BE25        [get_ports "FMCP1_LA09_P"]            ; # Bank 706  VADJ_FMC     IO_L7P_N2P2_M2P14_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA09_P"]            ; 
set_property    PACKAGE_PIN BE24        [get_ports "FMCP1_LA09_N"]            ; # Bank 706  VADJ_FMC     IO_L7N_N2P3_M2P15_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA09_N"]            ; 
set_property    PACKAGE_PIN BC22        [get_ports "FMCP1_LA08_P"]            ; # Bank 706  VADJ_FMC     IO_L8P_N2P4_M2P16_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA08_P"]            ; 
set_property    PACKAGE_PIN BC21        [get_ports "FMCP1_LA08_N"]            ; # Bank 706  VADJ_FMC     IO_L8N_N2P5_M2P17_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA08_N"]            ; 
set_property    PACKAGE_PIN BC23        [get_ports "FMCP1_LA01_CC_P"]         ; # Bank 706  VADJ_FMC     IO_L9P_GC_XCC_N3P0_M2P18_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA01_CC_P"]         ; 
set_property    PACKAGE_PIN BD22        [get_ports "FMCP1_LA01_CC_N"]         ; # Bank 706  VADJ_FMC     IO_L9N_GC_XCC_N3P1_M2P19_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA01_CC_N"]         ; 
set_property    PACKAGE_PIN BG25        [get_ports "FMCP1_LA10_P"]            ; # Bank 706  VADJ_FMC     IO_L1P_N0P2_M2P2_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA10_P"]            ; 
set_property    PACKAGE_PIN BC20        [get_ports "FMCP1_LA06_P"]            ; # Bank 706  VADJ_FMC     IO_L10P_N3P2_M2P20_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA06_P"]            ; 
set_property    PACKAGE_PIN BD20        [get_ports "FMCP1_LA06_N"]            ; # Bank 706  VADJ_FMC     IO_L10N_N3P3_M2P21_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA06_N"]            ; 
set_property    PACKAGE_PIN BC25        [get_ports "FMCP1_LA07_P"]            ; # Bank 706  VADJ_FMC     IO_L11P_N3P4_M2P22_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA07_P"]            ; 
set_property    PACKAGE_PIN BD25        [get_ports "FMCP1_LA07_N"]            ; # Bank 706  VADJ_FMC     IO_L11N_N3P5_M2P23_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA07_N"]            ; 
set_property    PACKAGE_PIN AV23        [get_ports "FMCP1_CLK0_M2C_P"]        ; # Bank 706  VADJ_FMC     IO_L12P_GC_XCC_N4P0_M2P24_706
set_property    IOSTANDARD DIFF_SSTL15  [get_ports "FMCP1_CLK0_M2C_P"]        ; 
set_property    PACKAGE_PIN AW23        [get_ports "FMCP1_CLK0_M2C_N"]        ; # Bank 706  VADJ_FMC     IO_L12N_GC_XCC_N4P1_M2P25_706
set_property    IOSTANDARD DIFF_SSTL15  [get_ports "FMCP1_CLK0_M2C_N"]        ; 
set_property    PACKAGE_PIN AU24        [get_ports "FMCP1_LA14_P"]            ; # Bank 706  VADJ_FMC     IO_L13P_N4P2_M2P26_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA14_P"]            ; 
set_property    PACKAGE_PIN AU23        [get_ports "FMCP1_LA14_N"]            ; # Bank 706  VADJ_FMC     IO_L13N_N4P3_M2P27_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA14_N"]            ; 
set_property    PACKAGE_PIN AV22        [get_ports "FMCP1_LA03_P"]            ; # Bank 706  VADJ_FMC     IO_L14P_N4P4_M2P28_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA03_P"]            ; 
set_property    PACKAGE_PIN AW21        [get_ports "FMCP1_LA03_N"]            ; # Bank 706  VADJ_FMC     IO_L14N_N4P5_M2P29_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA03_N"]            ; 
set_property    PACKAGE_PIN BG24        [get_ports "FMCP1_LA10_N"]            ; # Bank 706  VADJ_FMC     IO_L1N_N0P3_M2P3_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA10_N"]            ; 
set_property    PACKAGE_PIN AY22        [get_ports "FMCP1_LA15_P"]            ; # Bank 706  VADJ_FMC     IO_L15P_XCC_N5P0_M2P30_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA15_P"]            ; 
set_property    PACKAGE_PIN AY23        [get_ports "FMCP1_LA15_N"]            ; # Bank 706  VADJ_FMC     IO_L15N_XCC_N5P1_M2P31_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA15_N"]            ; 
set_property    PACKAGE_PIN AU21        [get_ports "FMCP1_LA04_P"]            ; # Bank 706  VADJ_FMC     IO_L16P_N5P2_M2P32_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA04_P"]            ; 
set_property    PACKAGE_PIN AV21        [get_ports "FMCP1_LA04_N"]            ; # Bank 706  VADJ_FMC     IO_L16N_N5P3_M2P33_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA04_N"]            ; 
set_property    PACKAGE_PIN AW24        [get_ports "FMCP1_LA02_P"]            ; # Bank 706  VADJ_FMC     IO_L17P_N5P4_M2P34_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA02_P"]            ; 
set_property    PACKAGE_PIN AY25        [get_ports "FMCP1_LA02_N"]            ; # Bank 706  VADJ_FMC     IO_L17N_N5P5_M2P35_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA02_N"]            ; 
set_property    PACKAGE_PIN AT23        [get_ports "8A34001_GPIO_15"]         ; # Bank 706  VADJ_FMC     IO_L18P_XCC_N6P0_M2P36_706
set_property    IOSTANDARD SSTL15       [get_ports "8A34001_GPIO_15"]         ; 
set_property    PACKAGE_PIN AR23        [get_ports "8A34001_GPIO_14"]         ; # Bank 706  VADJ_FMC     IO_L18N_XCC_N6P1_M2P37_706
set_property    IOSTANDARD SSTL15       [get_ports "8A34001_GPIO_14"]         ; 
set_property    PACKAGE_PIN AM24        [get_ports "8A34001_GPIO_13"]         ; # Bank 706  VADJ_FMC     IO_L19P_N6P2_M2P38_706
set_property    IOSTANDARD SSTL15       [get_ports "8A34001_GPIO_13"]         ; 
set_property    PACKAGE_PIN AM23        [get_ports "8A34001_GPIO_12"]         ; # Bank 706  VADJ_FMC     IO_L19N_N6P3_M2P39_706
set_property    IOSTANDARD SSTL15       [get_ports "8A34001_GPIO_12"]         ; 
set_property    PACKAGE_PIN BF21        [get_ports "FMCP1_LA16_P"]            ; # Bank 706  VADJ_FMC     IO_L2P_N0P4_M2P4_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA16_P"]            ; 
set_property    PACKAGE_PIN AP22        [get_ports "8A34001_GPIO_11"]         ; # Bank 706  VADJ_FMC     IO_L20P_N6P4_M2P40_706
set_property    IOSTANDARD SSTL15       [get_ports "8A34001_GPIO_11"]         ; 
set_property    PACKAGE_PIN AP21        [get_ports "8A34001_GPIO_10"]         ; # Bank 706  VADJ_FMC     IO_L20N_N6P5_M2P41_706
set_property    IOSTANDARD SSTL15       [get_ports "8A34001_GPIO_10"]         ; 
set_property    PACKAGE_PIN AR21        [get_ports "8A34001_GPIO_7"]          ; # Bank 706  VADJ_FMC     IO_L21P_XCC_N7P0_M2P42_706
set_property    IOSTANDARD SSTL15       [get_ports "8A34001_GPIO_7"]          ; 
set_property    PACKAGE_PIN AT22        [get_ports "8A34001_GPIO_6"]          ; # Bank 706  VADJ_FMC     IO_L21N_XCC_N7P1_M2P43_706
set_property    IOSTANDARD SSTL15       [get_ports "8A34001_GPIO_6"]          ; 
set_property    PACKAGE_PIN AN23        [get_ports "8A34001_GPIO_5"]          ; # Bank 706  VADJ_FMC     IO_L22P_N7P2_M2P44_706
set_property    IOSTANDARD SSTL15       [get_ports "8A34001_GPIO_5"]          ; 
set_property    PACKAGE_PIN AN22        [get_ports "8A34001_GPIO_4"]          ; # Bank 706  VADJ_FMC     IO_L22N_N7P3_M2P45_706
set_property    IOSTANDARD SSTL15       [get_ports "8A34001_GPIO_4"]          ; 
set_property    PACKAGE_PIN AP24        [get_ports "8A34001_GPIO_3"]          ; # Bank 706  VADJ_FMC     IO_L23P_N7P4_M2P46_706
set_property    IOSTANDARD SSTL15       [get_ports "8A34001_GPIO_3"]          ; 
#set_property   PACKAGE_PIN AR24        [get_ports "No Connect"]              ; # Bank 706  VADJ_FMC     IO_L23N_N7P5_M2P47_706
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BA24        [get_ports "8A34001_CLK2_IN_P"]       ; # Bank 706  VADJ_FMC     IO_L24P_GC_XCC_N8P0_M2P48_706
set_property    IOSTANDARD DIFF_SSTL15  [get_ports "8A34001_CLK2_IN_P"]       ; 
set_property    PACKAGE_PIN BB24        [get_ports "8A34001_CLK2_IN_N"]       ; # Bank 706  VADJ_FMC     IO_L24N_GC_XCC_N8P1_M2P49_706
set_property    IOSTANDARD DIFF_SSTL15  [get_ports "8A34001_CLK2_IN_N"]       ; 
set_property    PACKAGE_PIN BG20        [get_ports "FMCP1_LA16_N"]            ; # Bank 706  VADJ_FMC     IO_L2N_N0P5_M2P5_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA16_N"]            ; 
set_property    PACKAGE_PIN BA25        [get_ports "8A34001_GPIO_2"]          ; # Bank 706  VADJ_FMC     IO_L25P_N8P2_M2P50_706
set_property    IOSTANDARD SSTL15       [get_ports "8A34001_GPIO_2"]          ; 
set_property    PACKAGE_PIN BB25        [get_ports "8A34001_GPIO_1"]          ; # Bank 706  VADJ_FMC     IO_L25N_N8P3_M2P51_706
set_property    IOSTANDARD SSTL15       [get_ports "8A34001_GPIO_1"]          ; 
set_property    PACKAGE_PIN BA23        [get_ports "8A34001_GPIO_0"]          ; # Bank 706  VADJ_FMC     IO_L26P_N8P4_M2P52_706
set_property    IOSTANDARD SSTL15       [get_ports "8A34001_GPIO_0"]          ; 
set_property    PACKAGE_PIN BB23        [get_ports "VERSAL_SPDIF"]            ; # Bank 706  VADJ_FMC     IO_L26N_N8P5_M2P53_706
set_property    IOSTANDARD SSTL15       [get_ports "VERSAL_SPDIF"]            ; 
set_property    PACKAGE_PIN BG21        [get_ports "FMCP1_LA12_P"]            ; # Bank 706  VADJ_FMC     IO_L3P_XCC_N1P0_M2P6_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA12_P"]            ; 
set_property    PACKAGE_PIN BF22        [get_ports "FMCP1_LA12_N"]            ; # Bank 706  VADJ_FMC     IO_L3N_XCC_N1P1_M2P7_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA12_N"]            ; 
set_property    PACKAGE_PIN BE21        [get_ports "FMCP1_LA13_P"]            ; # Bank 706  VADJ_FMC     IO_L4P_N1P2_M2P8_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA13_P"]            ; 
set_property    PACKAGE_PIN BE20        [get_ports "FMCP1_LA13_N"]            ; # Bank 706  VADJ_FMC     IO_L4N_N1P3_M2P9_706
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA13_N"]            ; 
##
set_property    INTERNAL_VREF 0.75      [get_iobanks 707]                     ; # Bank 707 Assumes VADJ_FMC is set to 1.5V
##
set_property    PACKAGE_PIN BE19        [get_ports "FMCP1_LA21_P"]            ; # Bank 707  VADJ_FMC     IO_L0P_XCC_N0P0_M2P54_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA21_P"]            ; 
set_property    PACKAGE_PIN BD19        [get_ports "FMCP1_LA21_N"]            ; # Bank 707  VADJ_FMC     IO_L0N_XCC_N0P1_M2P55_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA21_N"]            ; 
set_property    PACKAGE_PIN BA20        [get_ports "FMCP1_LA24_P"]            ; # Bank 707  VADJ_FMC     IO_L5P_N1P4_M2P64_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA24_P"]            ; 
set_property    PACKAGE_PIN BA19        [get_ports "FMCP1_LA24_N"]            ; # Bank 707  VADJ_FMC     IO_L5N_N1P5_M2P65_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA24_N"]            ; 
set_property    PACKAGE_PIN BB16        [get_ports "FMCP1_LA17_CC_P"]         ; # Bank 707  VADJ_FMC     IO_L6P_GC_XCC_N2P0_M2P66_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA17_CC_P"]         ; 
set_property    PACKAGE_PIN BC16        [get_ports "FMCP1_LA17_CC_N"]         ; # Bank 707  VADJ_FMC     IO_L6N_GC_XCC_N2P1_M2P67_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA17_CC_N"]         ; 
set_property    PACKAGE_PIN BA17        [get_ports "FMCP1_LA19_P"]            ; # Bank 707  VADJ_FMC     IO_L7P_N2P2_M2P68_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA19_P"]            ; 
set_property    PACKAGE_PIN BA16        [get_ports "FMCP1_LA19_N"]            ; # Bank 707  VADJ_FMC     IO_L7N_N2P3_M2P69_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA19_N"]            ; 
set_property    PACKAGE_PIN BE16        [get_ports "FMCP1_LA20_P"]            ; # Bank 707  VADJ_FMC     IO_L8P_N2P4_M2P70_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA20_P"]            ; 
set_property    PACKAGE_PIN BF17        [get_ports "FMCP1_LA20_N"]            ; # Bank 707  VADJ_FMC     IO_L8N_N2P5_M2P71_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA20_N"]            ; 
set_property    PACKAGE_PIN BE17        [get_ports "FMCP1_LA18_CC_P"]         ; # Bank 707  VADJ_FMC     IO_L9P_GC_XCC_N3P0_M2P72_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA18_CC_P"]         ; 
set_property    PACKAGE_PIN BD17        [get_ports "FMCP1_LA18_CC_N"]         ; # Bank 707  VADJ_FMC     IO_L9N_GC_XCC_N3P1_M2P73_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA18_CC_N"]         ; 
set_property    PACKAGE_PIN BB20        [get_ports "FMCP1_LA23_P"]            ; # Bank 707  VADJ_FMC     IO_L1P_N0P2_M2P56_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA23_P"]            ; 
set_property    PACKAGE_PIN BF16        [get_ports "FMCP1_LA25_P"]            ; # Bank 707  VADJ_FMC     IO_L10P_N3P2_M2P74_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA25_P"]            ; 
set_property    PACKAGE_PIN BG16        [get_ports "FMCP1_LA25_N"]            ; # Bank 707  VADJ_FMC     IO_L10N_N3P3_M2P75_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA25_N"]            ; 
set_property    PACKAGE_PIN BB18        [get_ports "FMCP1_LA28_P"]            ; # Bank 707  VADJ_FMC     IO_L11P_N3P4_M2P76_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA28_P"]            ; 
set_property    PACKAGE_PIN BC17        [get_ports "FMCP1_LA28_N"]            ; # Bank 707  VADJ_FMC     IO_L11N_N3P5_M2P77_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA28_N"]            ; 
set_property    PACKAGE_PIN AP19        [get_ports "FMCP1_CLK1_M2C_P"]        ; # Bank 707  VADJ_FMC     IO_L12P_GC_XCC_N4P0_M2P78_707
set_property    IOSTANDARD DIFF_SSTL15  [get_ports "FMCP1_CLK1_M2C_P"]        ; 
set_property    PACKAGE_PIN AP18        [get_ports "FMCP1_CLK1_M2C_N"]        ; # Bank 707  VADJ_FMC     IO_L12N_GC_XCC_N4P1_M2P79_707
set_property    IOSTANDARD DIFF_SSTL15  [get_ports "FMCP1_CLK1_M2C_N"]        ; 
set_property    PACKAGE_PIN AM21        [get_ports "FMCP1_LA29_P"]            ; # Bank 707  VADJ_FMC     IO_L13P_N4P2_M2P80_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA29_P"]            ; 
set_property    PACKAGE_PIN AM20        [get_ports "FMCP1_LA29_N"]            ; # Bank 707  VADJ_FMC     IO_L13N_N4P3_M2P81_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA29_N"]            ; 
set_property    PACKAGE_PIN AR18        [get_ports "FMCP1_LA31_P"]            ; # Bank 707  VADJ_FMC     IO_L14P_N4P4_M2P82_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA31_P"]            ; 
set_property    PACKAGE_PIN AT19        [get_ports "FMCP1_LA31_N"]            ; # Bank 707  VADJ_FMC     IO_L14N_N4P5_M2P83_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA31_N"]            ; 
set_property    PACKAGE_PIN BB19        [get_ports "FMCP1_LA23_N"]            ; # Bank 707  VADJ_FMC     IO_L1N_N0P3_M2P57_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA23_N"]            ; 
set_property    PACKAGE_PIN AT20        [get_ports "FMCP1_LA30_P"]            ; # Bank 707  VADJ_FMC     IO_L15P_XCC_N5P0_M2P84_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA30_P"]            ; 
set_property    PACKAGE_PIN AR20        [get_ports "FMCP1_LA30_N"]            ; # Bank 707  VADJ_FMC     IO_L15N_XCC_N5P1_M2P85_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA30_N"]            ; 
set_property    PACKAGE_PIN AU20        [get_ports "FMCP1_LA33_P"]            ; # Bank 707  VADJ_FMC     IO_L16P_N5P2_M2P86_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA33_P"]            ; 
set_property    PACKAGE_PIN AU19        [get_ports "FMCP1_LA33_N"]            ; # Bank 707  VADJ_FMC     IO_L16N_N5P3_M2P87_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA33_N"]            ; 
set_property    PACKAGE_PIN AN20        [get_ports "FMCP1_LA32_P"]            ; # Bank 707  VADJ_FMC     IO_L17P_N5P4_M2P88_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA32_P"]            ; 
set_property    PACKAGE_PIN AN19        [get_ports "FMCP1_LA32_N"]            ; # Bank 707  VADJ_FMC     IO_L17N_N5P5_M2P89_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA32_N"]            ; 
set_property    PACKAGE_PIN AT16        [get_ports "FMCP2_LA31_P"]            ; # Bank 707  VADJ_FMC     IO_L18P_XCC_N6P0_M2P90_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA31_P"]            ; 
set_property    PACKAGE_PIN AR17        [get_ports "FMCP2_LA31_N"]            ; # Bank 707  VADJ_FMC     IO_L18N_XCC_N6P1_M2P91_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA31_N"]            ; 
set_property    PACKAGE_PIN AM18        [get_ports "FMCP2_LA29_P"]            ; # Bank 707  VADJ_FMC     IO_L19P_N6P2_M2P92_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA29_P"]            ; 
set_property    PACKAGE_PIN AN17        [get_ports "FMCP2_LA29_N"]            ; # Bank 707  VADJ_FMC     IO_L19N_N6P3_M2P93_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA29_N"]            ; 
set_property    PACKAGE_PIN BF19        [get_ports "FMCP1_LA27_P"]            ; # Bank 707  VADJ_FMC     IO_L2P_N0P4_M2P58_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA27_P"]            ; 
set_property    PACKAGE_PIN AU17        [get_ports "FMCP2_LA28_P"]            ; # Bank 707  VADJ_FMC     IO_L20P_N6P4_M2P94_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA28_P"]            ; 
set_property    PACKAGE_PIN AV17        [get_ports "FMCP2_LA28_N"]            ; # Bank 707  VADJ_FMC     IO_L20N_N6P5_M2P95_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA28_N"]            ; 
set_property    PACKAGE_PIN AN16        [get_ports "FMCP2_LA30_P"]            ; # Bank 707  VADJ_FMC     IO_L21P_XCC_N7P0_M2P96_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA30_P"]            ; 
set_property    PACKAGE_PIN AP16        [get_ports "FMCP2_LA30_N"]            ; # Bank 707  VADJ_FMC     IO_L21N_XCC_N7P1_M2P97_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA30_N"]            ; 
set_property    PACKAGE_PIN AT17        [get_ports "FMCP2_LA33_P"]            ; # Bank 707  VADJ_FMC     IO_L22P_N7P2_M2P98_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA33_P"]            ; 
set_property    PACKAGE_PIN AU16        [get_ports "FMCP2_LA33_N"]            ; # Bank 707  VADJ_FMC     IO_L22N_N7P3_M2P99_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA33_N"]            ; 
set_property    PACKAGE_PIN AL16        [get_ports "FMCP2_LA32_P"]            ; # Bank 707  VADJ_FMC     IO_L23P_N7P4_M2P100_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA32_P"]            ; 
set_property    PACKAGE_PIN AM17        [get_ports "FMCP2_LA32_N"]            ; # Bank 707  VADJ_FMC     IO_L23N_N7P5_M2P101_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA32_N"]            ; 
set_property    PACKAGE_PIN AW19        [get_ports "FMCP2_CLK1_M2C_P"]        ; # Bank 707  VADJ_FMC     IO_L24P_GC_XCC_N8P0_M2P102_707
set_property    IOSTANDARD DIFF_SSTL15  [get_ports "FMCP2_CLK1_M2C_P"]        ; 
set_property    PACKAGE_PIN AY18        [get_ports "FMCP2_CLK1_M2C_N"]        ; # Bank 707  VADJ_FMC     IO_L24N_GC_XCC_N8P1_M2P103_707
set_property    IOSTANDARD DIFF_SSTL15  [get_ports "FMCP2_CLK1_M2C_N"]        ; 
set_property    PACKAGE_PIN BG19        [get_ports "FMCP1_LA27_N"]            ; # Bank 707  VADJ_FMC     IO_L2N_N0P5_M2P59_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA27_N"]            ; 
set_property    PACKAGE_PIN AW20        [get_ports "FMCP2_LA27_P"]            ; # Bank 707  VADJ_FMC     IO_L25P_N8P2_M2P104_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA27_P"]            ; 
set_property    PACKAGE_PIN AY19        [get_ports "FMCP2_LA27_N"]            ; # Bank 707  VADJ_FMC     IO_L25N_N8P3_M2P105_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA27_N"]            ; 
set_property    PACKAGE_PIN AV19        [get_ports "FMCP2_LA26_P"]            ; # Bank 707  VADJ_FMC     IO_L26P_N8P4_M2P106_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA26_P"]            ; 
set_property    PACKAGE_PIN AV18        [get_ports "FMCP2_LA26_N"]            ; # Bank 707  VADJ_FMC     IO_L26N_N8P5_M2P107_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA26_N"]            ; 
set_property    PACKAGE_PIN BC18        [get_ports "FMCP1_LA26_P"]            ; # Bank 707  VADJ_FMC     IO_L3P_XCC_N1P0_M2P60_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA26_P"]            ; 
set_property    PACKAGE_PIN BD18        [get_ports "FMCP1_LA26_N"]            ; # Bank 707  VADJ_FMC     IO_L3N_XCC_N1P1_M2P61_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA26_N"]            ; 
set_property    PACKAGE_PIN BF18        [get_ports "FMCP1_LA22_P"]            ; # Bank 707  VADJ_FMC     IO_L4P_N1P2_M2P62_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA22_P"]            ; 
set_property    PACKAGE_PIN BG18        [get_ports "FMCP1_LA22_N"]            ; # Bank 707  VADJ_FMC     IO_L4N_N1P3_M2P63_707
set_property    IOSTANDARD SSTL15       [get_ports "FMCP1_LA22_N"]            ; 
##
set_property    INTERNAL_VREF 0.75      [get_iobanks 708]                     ; # Bank 708 Assumes VADJ_FMC is set to 1.5V
##
set_property    PACKAGE_PIN BF14        [get_ports "FMCP2_LA02_P"]            ; # Bank 708  VADJ_FMC     IO_L0P_XCC_N0P0_M2P108_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA02_P"]            ; 
set_property    PACKAGE_PIN BG13        [get_ports "FMCP2_LA02_N"]            ; # Bank 708  VADJ_FMC     IO_L0N_XCC_N0P1_M2P109_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA02_N"]            ; 
set_property    PACKAGE_PIN BG15        [get_ports "FMCP2_LA07_P"]            ; # Bank 708  VADJ_FMC     IO_L5P_N1P4_M2P118_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA07_P"]            ; 
set_property    PACKAGE_PIN BG14        [get_ports "FMCP2_LA07_N"]            ; # Bank 708  VADJ_FMC     IO_L5N_N1P5_M2P119_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA07_N"]            ; 
set_property    PACKAGE_PIN BB14        [get_ports "FMCP2_CLK0_M2C_P"]        ; # Bank 708  VADJ_FMC     IO_L6P_GC_XCC_N2P0_M2P120_708
set_property    IOSTANDARD DIFF_SSTL15  [get_ports "FMCP2_CLK0_M2C_P"]        ; 
set_property    PACKAGE_PIN BB13        [get_ports "FMCP2_CLK0_M2C_N"]        ; # Bank 708  VADJ_FMC     IO_L6N_GC_XCC_N2P1_M2P121_708
set_property    IOSTANDARD DIFF_SSTL15  [get_ports "FMCP2_CLK0_M2C_N"]        ; 
set_property    PACKAGE_PIN BB15        [get_ports "FMCP2_LA13_P"]            ; # Bank 708  VADJ_FMC     IO_L7P_N2P2_M2P122_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA13_P"]            ; 
set_property    PACKAGE_PIN BC15        [get_ports "FMCP2_LA13_N"]            ; # Bank 708  VADJ_FMC     IO_L7N_N2P3_M2P123_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA13_N"]            ; 
set_property    PACKAGE_PIN BC12        [get_ports "FMCP2_LA11_P"]            ; # Bank 708  VADJ_FMC     IO_L8P_N2P4_M2P124_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA11_P"]            ; 
set_property    PACKAGE_PIN BD12        [get_ports "FMCP2_LA11_N"]            ; # Bank 708  VADJ_FMC     IO_L8N_N2P5_M2P125_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA11_N"]            ; 
set_property    PACKAGE_PIN BC13        [get_ports "FMCP2_LA00_CC_P"]         ; # Bank 708  VADJ_FMC     IO_L9P_GC_XCC_N3P0_M2P126_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA00_CC_P"]         ; 
set_property    PACKAGE_PIN BD13        [get_ports "FMCP2_LA00_CC_N"]         ; # Bank 708  VADJ_FMC     IO_L9N_GC_XCC_N3P1_M2P127_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA00_CC_N"]         ; 
set_property    PACKAGE_PIN BE15        [get_ports "FMCP2_LA14_P"]            ; # Bank 708  VADJ_FMC     IO_L1P_N0P2_M2P110_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA14_P"]            ; 
set_property    PACKAGE_PIN BB11        [get_ports "FMCP2_LA12_P"]            ; # Bank 708  VADJ_FMC     IO_L10P_N3P2_M2P128_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA12_P"]            ; 
set_property    PACKAGE_PIN BC11        [get_ports "FMCP2_LA12_N"]            ; # Bank 708  VADJ_FMC     IO_L10N_N3P3_M2P129_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA12_N"]            ; 
set_property    PACKAGE_PIN BD15        [get_ports "FMCP2_LA09_P"]            ; # Bank 708  VADJ_FMC     IO_L11P_N3P4_M2P130_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA09_P"]            ; 
set_property    PACKAGE_PIN BD14        [get_ports "FMCP2_LA09_N"]            ; # Bank 708  VADJ_FMC     IO_L11N_N3P5_M2P131_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA09_N"]            ; 
set_property    PACKAGE_PIN AU13        [get_ports "FMCP2_LA18_CC_P"]         ; # Bank 708  VADJ_FMC     IO_L12P_GC_XCC_N4P0_M2P132_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA18_CC_P"]         ; 
set_property    PACKAGE_PIN AV13        [get_ports "FMCP2_LA18_CC_N"]         ; # Bank 708  VADJ_FMC     IO_L12N_GC_XCC_N4P1_M2P133_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA18_CC_N"]         ; 
set_property    PACKAGE_PIN AT14        [get_ports "FMCP2_LA10_P"]            ; # Bank 708  VADJ_FMC     IO_L13P_N4P2_M2P134_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA10_P"]            ; 
set_property    PACKAGE_PIN AU15        [get_ports "FMCP2_LA10_N"]            ; # Bank 708  VADJ_FMC     IO_L13N_N4P3_M2P135_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA10_N"]            ; 
set_property    PACKAGE_PIN AU12        [get_ports "FMCP2_LA06_P"]            ; # Bank 708  VADJ_FMC     IO_L14P_N4P4_M2P136_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA06_P"]            ; 
set_property    PACKAGE_PIN AU11        [get_ports "FMCP2_LA06_N"]            ; # Bank 708  VADJ_FMC     IO_L14N_N4P5_M2P137_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA06_N"]            ; 
set_property    PACKAGE_PIN BE14        [get_ports "FMCP2_LA14_N"]            ; # Bank 708  VADJ_FMC     IO_L1N_N0P3_M2P111_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA14_N"]            ; 
set_property    PACKAGE_PIN AW12        [get_ports "FMCP2_LA01_CC_P"]         ; # Bank 708  VADJ_FMC     IO_L15P_XCC_N5P0_M2P138_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA01_CC_P"]         ; 
set_property    PACKAGE_PIN AW13        [get_ports "FMCP2_LA01_CC_N"]         ; # Bank 708  VADJ_FMC     IO_L15N_XCC_N5P1_M2P139_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA01_CC_N"]         ; 
set_property    PACKAGE_PIN AV11        [get_ports "FMCP2_LA16_P"]            ; # Bank 708  VADJ_FMC     IO_L16P_N5P2_M2P140_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA16_P"]            ; 
set_property    PACKAGE_PIN AW11        [get_ports "FMCP2_LA16_N"]            ; # Bank 708  VADJ_FMC     IO_L16N_N5P3_M2P141_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA16_N"]            ; 
set_property    PACKAGE_PIN AV15        [get_ports "FMCP2_LA08_P"]            ; # Bank 708  VADJ_FMC     IO_L17P_N5P4_M2P142_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA08_P"]            ; 
set_property    PACKAGE_PIN AV14        [get_ports "FMCP2_LA08_N"]            ; # Bank 708  VADJ_FMC     IO_L17N_N5P5_M2P143_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA08_N"]            ; 
set_property    PACKAGE_PIN AR14        [get_ports "FMCP2_LA19_P"]            ; # Bank 708  VADJ_FMC     IO_L18P_XCC_N6P0_M2P144_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA19_P"]            ; 
set_property    PACKAGE_PIN AT13        [get_ports "FMCP2_LA19_N"]            ; # Bank 708  VADJ_FMC     IO_L18N_XCC_N6P1_M2P145_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA19_N"]            ; 
set_property    PACKAGE_PIN AP15        [get_ports "FMCP2_LA20_P"]            ; # Bank 708  VADJ_FMC     IO_L19P_N6P2_M2P146_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA20_P"]            ; 
set_property    PACKAGE_PIN AR15        [get_ports "FMCP2_LA20_N"]            ; # Bank 708  VADJ_FMC     IO_L19N_N6P3_M2P147_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA20_N"]            ; 
set_property    PACKAGE_PIN BE11        [get_ports "FMCP2_LA03_P"]            ; # Bank 708  VADJ_FMC     IO_L2P_N0P4_M2P112_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA03_P"]            ; 
set_property    PACKAGE_PIN AP11        [get_ports "FMCP2_LA22_P"]            ; # Bank 708  VADJ_FMC     IO_L20P_N6P4_M2P148_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA22_P"]            ; 
set_property    PACKAGE_PIN AR12        [get_ports "FMCP2_LA22_N"]            ; # Bank 708  VADJ_FMC     IO_L20N_N6P5_M2P149_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA22_N"]            ; 
set_property    PACKAGE_PIN AP12        [get_ports "FMCP2_LA23_P"]            ; # Bank 708  VADJ_FMC     IO_L21P_XCC_N7P0_M2P150_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA23_P"]            ; 
set_property    PACKAGE_PIN AN13        [get_ports "FMCP2_LA23_N"]            ; # Bank 708  VADJ_FMC     IO_L21N_XCC_N7P1_M2P151_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA23_N"]            ; 
set_property    PACKAGE_PIN AR11        [get_ports "FMCP2_LA24_P"]            ; # Bank 708  VADJ_FMC     IO_L22P_N7P2_M2P152_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA24_P"]            ; 
set_property    PACKAGE_PIN AT11        [get_ports "FMCP2_LA24_N"]            ; # Bank 708  VADJ_FMC     IO_L22N_N7P3_M2P153_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA24_N"]            ; 
set_property    PACKAGE_PIN AN14        [get_ports "FMCP2_LA21_P"]            ; # Bank 708  VADJ_FMC     IO_L23P_N7P4_M2P154_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA21_P"]            ; 
set_property    PACKAGE_PIN AP13        [get_ports "FMCP2_LA21_N"]            ; # Bank 708  VADJ_FMC     IO_L23N_N7P5_M2P155_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA21_N"]            ; 
set_property    PACKAGE_PIN AY13        [get_ports "FMCP2_LA17_CC_P"]         ; # Bank 708  VADJ_FMC     IO_L24P_GC_XCC_N8P0_M2P156_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA17_CC_P"]         ; 
set_property    PACKAGE_PIN BA12        [get_ports "FMCP2_LA17_CC_N"]         ; # Bank 708  VADJ_FMC     IO_L24N_GC_XCC_N8P1_M2P157_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA17_CC_N"]         ; 
set_property    PACKAGE_PIN BF12        [get_ports "FMCP2_LA03_N"]            ; # Bank 708  VADJ_FMC     IO_L2N_N0P5_M2P113_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA03_N"]            ; 
set_property    PACKAGE_PIN AY14        [get_ports "FMCP2_LA05_P"]            ; # Bank 708  VADJ_FMC     IO_L25P_N8P2_M2P158_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA05_P"]            ; 
set_property    PACKAGE_PIN BA13        [get_ports "FMCP2_LA05_N"]            ; # Bank 708  VADJ_FMC     IO_L25N_N8P3_M2P159_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA05_N"]            ; 
set_property    PACKAGE_PIN AY11        [get_ports "FMCP2_LA25_P"]            ; # Bank 708  VADJ_FMC     IO_L26P_N8P4_M2P160_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA25_P"]            ; 
set_property    PACKAGE_PIN BA11        [get_ports "FMCP2_LA25_N"]            ; # Bank 708  VADJ_FMC     IO_L26N_N8P5_M2P161_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA25_N"]            ; 
set_property    PACKAGE_PIN BE12        [get_ports "FMCP2_LA15_P"]            ; # Bank 708  VADJ_FMC     IO_L3P_XCC_N1P0_M2P114_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA15_P"]            ; 
set_property    PACKAGE_PIN BF13        [get_ports "FMCP2_LA15_N"]            ; # Bank 708  VADJ_FMC     IO_L3N_XCC_N1P1_M2P115_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA15_N"]            ; 
set_property    PACKAGE_PIN BF11        [get_ports "FMCP2_LA04_P"]            ; # Bank 708  VADJ_FMC     IO_L4P_N1P2_M2P116_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA04_P"]            ; 
set_property    PACKAGE_PIN BG11        [get_ports "FMCP2_LA04_N"]            ; # Bank 708  VADJ_FMC     IO_L4N_N1P3_M2P117_708
set_property    IOSTANDARD SSTL15       [get_ports "FMCP2_LA04_N"]            ; 
set_property    PACKAGE_PIN BC2         [get_ports "LPDDR4_1_DMI3"]           ; # Bank 709  VCC1V1_LP4   IO_L0P_XCC_N0P0_M3P0_709        Actual Schem Name: LPDDR4_1_DMI2
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DMI3"]           ; 
set_property    PACKAGE_PIN BC1         [get_ports "LPDDR4_1_CSB1"]           ; # Bank 709  VCC1V1_LP4   IO_L0N_XCC_N0P1_M3P1_709        Actual Schem Name: LPDDR4_1_CSB1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CSB1"]           ; 
set_property    PACKAGE_PIN BD3         [get_ports "LPDDR4_1_DQ29"]           ; # Bank 709  VCC1V1_LP4   IO_L5P_N1P4_M3P10_709           Actual Schem Name: LPDDR4_1_DQ22
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ29"]           ; 
set_property    PACKAGE_PIN BD2         [get_ports "LPDDR4_1_DQ30"]           ; # Bank 709  VCC1V1_LP4   IO_L5N_N1P5_M3P11_709           Actual Schem Name: LPDDR4_1_DQ17
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ30"]           ; 
set_property    PACKAGE_PIN BD4         [get_ports "LPDDR4_1_CKEB1"]          ; # Bank 709  VCC1V1_LP4   IO_L6P_GC_XCC_N2P0_M3P12_709    Actual Schem Name: LPDDR4_1_CKEB1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CKEB1"]          ; 
set_property    PACKAGE_PIN BC3         [get_ports "LPDDR4_1_CKEB0"]          ; # Bank 709  VCC1V1_LP4   IO_L6N_GC_XCC_N2P1_M3P13_709    Actual Schem Name: LPDDR4_1_CKEB0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CKEB0"]          ; 
#set_property   PACKAGE_PIN BG5         [get_ports "No Connect"]              ; # Bank 709  VCC1V1_LP4   IO_L7P_N2P2_M3P14_709           
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN BG4         [get_ports "No Connect"]              ; # Bank 709  VCC1V1_LP4   IO_L7N_N2P3_M3P15_709           
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BB5         [get_ports "LPDDR4_1_CAB5"]           ; # Bank 709  VCC1V1_LP4   IO_L8P_N2P4_M3P16_709           Actual Schem Name: LPDDR4_1_CAB5
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CAB5"]           ; 
set_property    PACKAGE_PIN BA4         [get_ports "LPDDR4_1_CAB2"]           ; # Bank 709  VCC1V1_LP4   IO_L8N_N2P5_M3P17_709           Actual Schem Name: LPDDR4_1_CAB2
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CAB2"]           ; 
set_property    PACKAGE_PIN BB3          [get_ports "LPDDR4_1_CKB_T"]         ; # Bank 709  VCC1V1_LP4   IO_L9P_GC_XCC_N3P0_M3P18_709    Actual Schem Name: LPDDR4_1_CKB_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_1_CKB_T"]         ; 
set_property    PACKAGE_PIN BB4          [get_ports "LPDDR4_1_CKB_C"]         ; # Bank 709  VCC1V1_LP4   IO_L9N_GC_XCC_N3P1_M3P19_709    Actual Schem Name: LPDDR4_1_CKB_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_1_CKB_C"]         ; 
set_property    PACKAGE_PIN BF3         [get_ports "LPDDR4_1_DQ28"]           ; # Bank 709  VCC1V1_LP4   IO_L1P_N0P2_M3P2_709            Actual Schem Name: LPDDR4_1_DQ16
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ28"]           ; 
set_property    PACKAGE_PIN AY5         [get_ports "LPDDR4_1_CAB4"]           ; # Bank 709  VCC1V1_LP4   IO_L10P_N3P2_M3P20_709          Actual Schem Name: LPDDR4_1_CAB4
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CAB4"]           ; 
set_property    PACKAGE_PIN AY4         [get_ports "LPDDR4_1_CAB3"]           ; # Bank 709  VCC1V1_LP4   IO_L10N_N3P3_M3P21_709          Actual Schem Name: LPDDR4_1_CAB3
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CAB3"]           ; 
set_property    PACKAGE_PIN BF4         [get_ports "LPDDR4_1_CAB0"]           ; # Bank 709  VCC1V1_LP4   IO_L11P_N3P4_M3P22_709          Actual Schem Name: LPDDR4_1_CAB0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CAB0"]           ; 
set_property    PACKAGE_PIN BE4         [get_ports "LPDDR4_1_CAB1"]           ; # Bank 709  VCC1V1_LP4   IO_L11N_N3P5_M3P23_709          Actual Schem Name: LPDDR4_1_CAB1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CAB1"]           ; 
set_property    PACKAGE_PIN BD7          [get_ports "LPDDR4_1_DQS0_T"]        ; # Bank 709  VCC1V1_LP4   IO_L12P_GC_XCC_N4P0_M3P24_709   Actual Schem Name: LPDDR4_1_DQS0_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_1_DQS0_T"]        ; 
set_property    PACKAGE_PIN BC6          [get_ports "LPDDR4_1_DQS0_C"]        ; # Bank 709  VCC1V1_LP4   IO_L12N_GC_XCC_N4P1_M3P25_709   Actual Schem Name: LPDDR4_1_DQS0_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_1_DQS0_C"]        ; 
set_property    PACKAGE_PIN BF8         [get_ports "LPDDR4_1_DQ1"]            ; # Bank 709  VCC1V1_LP4   IO_L13P_N4P2_M3P26_709          Actual Schem Name: LPDDR4_1_DQ4
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ1"]            ; 
set_property    PACKAGE_PIN BF7         [get_ports "LPDDR4_1_DQ2"]            ; # Bank 709  VCC1V1_LP4   IO_L13N_N4P3_M3P27_709          Actual Schem Name: LPDDR4_1_DQ5
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ2"]            ; 
set_property    PACKAGE_PIN BB8         [get_ports "LPDDR4_1_DQ6"]            ; # Bank 709  VCC1V1_LP4   IO_L14P_N4P4_M3P28_709          Actual Schem Name: LPDDR4_1_DQ6
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ6"]            ; 
set_property    PACKAGE_PIN BA8         [get_ports "LPDDR4_1_DQ7"]            ; # Bank 709  VCC1V1_LP4   IO_L14N_N4P5_M3P29_709          Actual Schem Name: LPDDR4_1_DQ1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ7"]            ; 
set_property    PACKAGE_PIN BE2         [get_ports "LPDDR4_1_DQ31"]           ; # Bank 709  VCC1V1_LP4   IO_L1N_N0P3_M3P3_709            Actual Schem Name: LPDDR4_1_DQ23
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ31"]           ; 
set_property    PACKAGE_PIN BC8         [get_ports "LPDDR4_1_DMI0"]           ; # Bank 709  VCC1V1_LP4   IO_L15P_XCC_N5P0_M3P30_709      Actual Schem Name: LPDDR4_1_DMI0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DMI0"]           ; 
set_property    PACKAGE_PIN BC7         [get_ports "LPDDR4_1_CSB0"]           ; # Bank 709  VCC1V1_LP4   IO_L15N_XCC_N5P1_M3P31_709      Actual Schem Name: LPDDR4_1_CSB0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CSB0"]           ; 
set_property    PACKAGE_PIN AY7         [get_ports "LPDDR4_1_DQ5"]            ; # Bank 709  VCC1V1_LP4   IO_L16P_N5P2_M3P32_709          Actual Schem Name: LPDDR4_1_DQ7
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ5"]            ; 
set_property    PACKAGE_PIN AY6         [get_ports "LPDDR4_1_DQ4"]            ; # Bank 709  VCC1V1_LP4   IO_L16N_N5P3_M3P33_709          Actual Schem Name: LPDDR4_1_DQ0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ4"]            ; 
set_property    PACKAGE_PIN BD8         [get_ports "LPDDR4_1_DQ0"]            ; # Bank 709  VCC1V1_LP4   IO_L17P_N5P4_M3P34_709          Actual Schem Name: LPDDR4_1_DQ2
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ0"]            ; 
set_property    PACKAGE_PIN BE7         [get_ports "LPDDR4_1_DQ3"]            ; # Bank 709  VCC1V1_LP4   IO_L17N_N5P5_M3P35_709          Actual Schem Name: LPDDR4_1_DQ3
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ3"]            ; 
set_property    PACKAGE_PIN BE9         [get_ports "LPDDR4_1_CSA0"]           ; # Bank 709  VCC1V1_LP4   IO_L18P_XCC_N6P0_M3P36_709      Actual Schem Name: LPDDR4_1_CSA0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CSA0"]           ; 
set_property    PACKAGE_PIN BE10        [get_ports "LPDDR4_1_CKEA1"]          ; # Bank 709  VCC1V1_LP4   IO_L18N_XCC_N6P1_M3P37_709      Actual Schem Name: LPDDR4_1_CKEA1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CKEA1"]          ; 
set_property    PACKAGE_PIN BG9         [get_ports "LPDDR4_1_CAA1"]           ; # Bank 709  VCC1V1_LP4   IO_L19P_N6P2_M3P38_709          Actual Schem Name: LPDDR4_1_CAA1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CAA1"]           ; 
set_property    PACKAGE_PIN BG8         [get_ports "LPDDR4_1_CAA0"]           ; # Bank 709  VCC1V1_LP4   IO_L19N_N6P3_M3P39_709          Actual Schem Name: LPDDR4_1_CAA0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CAA0"]           ; 
set_property    PACKAGE_PIN BA3         [get_ports "LPDDR4_1_DQ25"]           ; # Bank 709  VCC1V1_LP4   IO_L2P_N0P4_M3P4_709            Actual Schem Name: LPDDR4_1_DQ18
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ25"]           ; 
set_property    PACKAGE_PIN BC10        [get_ports "LPDDR4_1_CAA3"]           ; # Bank 709  VCC1V1_LP4   IO_L20P_N6P4_M3P40_709          Actual Schem Name: LPDDR4_1_CAA3
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CAA3"]           ; 
set_property    PACKAGE_PIN BB9         [get_ports "LPDDR4_1_CAA2"]           ; # Bank 709  VCC1V1_LP4   IO_L20N_N6P5_M3P41_709          Actual Schem Name: LPDDR4_1_CAA2
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CAA2"]           ; 
set_property    PACKAGE_PIN BD10         [get_ports "LPDDR4_1_CKA_T"]         ; # Bank 709  VCC1V1_LP4   IO_L21P_XCC_N7P0_M3P42_709      Actual Schem Name: LPDDR4_1_CKA_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_1_CKA_T"]         ; 
set_property    PACKAGE_PIN BD9          [get_ports "LPDDR4_1_CKA_C"]         ; # Bank 709  VCC1V1_LP4   IO_L21N_XCC_N7P1_M3P43_709      Actual Schem Name: LPDDR4_1_CKA_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_1_CKA_C"]         ; 
set_property    PACKAGE_PIN BB10        [get_ports "LPDDR4_1_CAA4"]           ; # Bank 709  VCC1V1_LP4   IO_L22P_N7P2_M3P44_709          Actual Schem Name: LPDDR4_1_CAA4
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CAA4"]           ; 
set_property    PACKAGE_PIN BA9         [get_ports "LPDDR4_1_CAA5"]           ; # Bank 709  VCC1V1_LP4   IO_L22N_N7P3_M3P45_709          Actual Schem Name: LPDDR4_1_CAA5
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CAA5"]           ; 
set_property    PACKAGE_PIN BG10        [get_ports "LPDDR4_1_CKEA0"]          ; # Bank 709  VCC1V1_LP4   IO_L23P_N7P4_M3P46_709          Actual Schem Name: LPDDR4_1_CKEA0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CKEA0"]          ; 
set_property    PACKAGE_PIN BF9         [get_ports "LPDDR4_1_CSA1"]           ; # Bank 709  VCC1V1_LP4   IO_L23N_N7P5_M3P47_709          Actual Schem Name: LPDDR4_1_CSA1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_CSA1"]           ; 
#set_property   PACKAGE_PIN BE6         [get_ports "No Connect"]              ; # Bank 709  VCC1V1_LP4   IO_L24P_GC_XCC_N8P0_M3P48_709   
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN BE5         [get_ports "No Connect"]              ; # Bank 709  VCC1V1_LP4   IO_L24N_GC_XCC_N8P1_M3P49_709   
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BA2         [get_ports "LPDDR4_1_DQ26"]           ; # Bank 709  VCC1V1_LP4   IO_L2N_N0P5_M3P5_709            Actual Schem Name: LPDDR4_1_DQ19
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ26"]           ; 
#set_property   PACKAGE_PIN BG6         [get_ports "No Connect"]              ; # Bank 709  VCC1V1_LP4   IO_L25P_N8P2_M3P50_709          
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN BF6         [get_ports "No Connect"]              ; # Bank 709  VCC1V1_LP4   IO_L25N_N8P3_M3P51_709          
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN BD5         [get_ports "No Connect"]              ; # Bank 709  VCC1V1_LP4   IO_L26P_N8P4_M3P52_709          
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN BC5         [get_ports "No Connect"]              ; # Bank 709  VCC1V1_LP4   IO_L26N_N8P5_M3P53_709          
set_property    IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN BA1          [get_ports "LPDDR4_1_DQS3_T"]        ; # Bank 709  VCC1V1_LP4   IO_L3P_XCC_N1P0_M3P6_709        Actual Schem Name: LPDDR4_1_DQS2_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_1_DQS3_T"]        ; 
set_property    PACKAGE_PIN BB1          [get_ports "LPDDR4_1_DQS3_C"]        ; # Bank 709  VCC1V1_LP4   IO_L3N_XCC_N1P1_M3P7_709        Actual Schem Name: LPDDR4_1_DQS2_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_1_DQS3_C"]        ; 
set_property    PACKAGE_PIN AY2         [get_ports "LPDDR4_1_DQ24"]           ; # Bank 709  VCC1V1_LP4   IO_L4P_N1P2_M3P8_709            Actual Schem Name: LPDDR4_1_DQ20
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ24"]           ; 
set_property    PACKAGE_PIN AY1         [get_ports "LPDDR4_1_DQ27"]           ; # Bank 709  VCC1V1_LP4   IO_L4N_N1P3_M3P9_709            Actual Schem Name: LPDDR4_1_DQ21
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ27"]           ; 
set_property    PACKAGE_PIN AT2          [get_ports "LPDDR4_1_DQS1_T"]        ; # Bank 710  VCC1V1_LP4   IO_L0P_XCC_N0P0_M3P54_710       Actual Schem Name: LPDDR4_1_DQS1_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_1_DQS1_T"]        ; 
set_property    PACKAGE_PIN AT1          [get_ports "LPDDR4_1_DQS1_C"]        ; # Bank 710  VCC1V1_LP4   IO_L0N_XCC_N0P1_M3P55_710       Actual Schem Name: LPDDR4_1_DQS1_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_1_DQS1_C"]        ; 
set_property    PACKAGE_PIN AV1         [get_ports "LPDDR4_1_DQ10"]           ; # Bank 710  VCC1V1_LP4   IO_L5P_N1P4_M3P64_710           Actual Schem Name: LPDDR4_1_DQ12
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ10"]           ; 
set_property    PACKAGE_PIN AU1         [get_ports "LPDDR4_1_DQ111"]          ; # Bank 710  VCC1V1_LP4   IO_L5N_N1P5_M3P65_710           Actual Schem Name: LPDDR4_1_DQ13
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ111"]          ; 
set_property    PACKAGE_PIN AN3         [get_ports "LPDDR4_0_DMI0"]           ; # Bank 710  VCC1V1_LP4   IO_L6P_GC_XCC_N2P0_M3P66_710    Actual Schem Name: LPDDR4_0_DMI0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DMI0"]           ; 
#set_property   PACKAGE_PIN AM3         [get_ports "No Connect"]              ; # Bank 710  VCC1V1_LP4   IO_L6N_GC_XCC_N2P1_M3P67_710    
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AT4         [get_ports "LPDDR4_0_DQ3"]            ; # Bank 710  VCC1V1_LP4   IO_L7P_N2P2_M3P68_710           Actual Schem Name: LPDDR4_0_DQ7
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ3"]            ; 
set_property    PACKAGE_PIN AR4         [get_ports "LPDDR4_0_DQ2"]            ; # Bank 710  VCC1V1_LP4   IO_L7N_N2P3_M3P69_710           Actual Schem Name: LPDDR4_0_DQ6
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ2"]            ; 
set_property    PACKAGE_PIN AP2         [get_ports "LPDDR4_0_DQ1"]            ; # Bank 710  VCC1V1_LP4   IO_L8P_N2P4_M3P70_710           Actual Schem Name: LPDDR4_0_DQ4
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ1"]            ; 
set_property    PACKAGE_PIN AN1         [get_ports "LPDDR4_0_DQ0"]            ; # Bank 710  VCC1V1_LP4   IO_L8N_N2P5_M3P71_710           Actual Schem Name: LPDDR4_0_DQ5
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ0"]            ; 
set_property    PACKAGE_PIN AR2          [get_ports "LPDDR4_0_DQS0_T"]        ; # Bank 710  VCC1V1_LP4   IO_L9P_GC_XCC_N3P0_M3P72_710    Actual Schem Name: LPDDR4_0_DQS0_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_0_DQS0_T"]        ; 
set_property    PACKAGE_PIN AR1          [get_ports "LPDDR4_0_DQS0_C"]        ; # Bank 710  VCC1V1_LP4   IO_L9N_GC_XCC_N3P1_M3P73_710    Actual Schem Name: LPDDR4_0_DQS0_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_0_DQS0_C"]        ; 
set_property    PACKAGE_PIN AW2         [get_ports "LPDDR4_1_DQ8"]            ; # Bank 710  VCC1V1_LP4   IO_L1P_N0P2_M3P56_710           Actual Schem Name: LPDDR4_1_DQ11
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ8"]            ; 
set_property    PACKAGE_PIN AN2         [get_ports "LPDDR4_0_DQ6"]            ; # Bank 710  VCC1V1_LP4   IO_L10P_N3P2_M3P74_710          Actual Schem Name: LPDDR4_0_DQ0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ6"]            ; 
set_property    PACKAGE_PIN AM1         [get_ports "LPDDR4_0_DQ7"]            ; # Bank 710  VCC1V1_LP4   IO_L10N_N3P3_M3P75_710          Actual Schem Name: LPDDR4_0_DQ1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ7"]            ; 
set_property    PACKAGE_PIN AP4         [get_ports "LPDDR4_0_DQ4"]            ; # Bank 710  VCC1V1_LP4   IO_L11P_N3P4_M3P76_710          Actual Schem Name: LPDDR4_0_DQ2
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ4"]            ; 
set_property    PACKAGE_PIN AP3         [get_ports "LPDDR4_0_DQ5"]            ; # Bank 710  VCC1V1_LP4   IO_L11N_N3P5_M3P77_710          Actual Schem Name: LPDDR4_0_DQ3
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ5"]            ; 
set_property    PACKAGE_PIN AV9         [get_ports "LPDDR4_1_DMI2"]           ; # Bank 710  VCC1V1_LP4   IO_L12P_GC_XCC_N4P0_M3P78_710   Actual Schem Name: LPDDR4_1_DMI3
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DMI2"]           ; 
#set_property   PACKAGE_PIN AW8         [get_ports "No Connect"]              ; # Bank 710  VCC1V1_LP4   IO_L12N_GC_XCC_N4P1_M3P79_710   
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AV10        [get_ports "LPDDR4_1_DQ18"]           ; # Bank 710  VCC1V1_LP4   IO_L13P_N4P2_M3P80_710          Actual Schem Name: LPDDR4_1_DQ31
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ18"]           ; 
set_property    PACKAGE_PIN AW9         [get_ports "LPDDR4_1_DQ16"]           ; # Bank 710  VCC1V1_LP4   IO_L13N_N4P3_M3P81_710          Actual Schem Name: LPDDR4_1_DQ24
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ16"]           ; 
set_property    PACKAGE_PIN AW7         [get_ports "LPDDR4_1_DQ22"]           ; # Bank 710  VCC1V1_LP4   IO_L14P_N4P4_M3P82_710          Actual Schem Name: LPDDR4_1_DQ27
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ22"]           ; 
set_property    PACKAGE_PIN AV7         [get_ports "LPDDR4_1_DQ23"]           ; # Bank 710  VCC1V1_LP4   IO_L14N_N4P5_M3P83_710          Actual Schem Name: LPDDR4_1_DQ29
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ23"]           ; 
set_property    PACKAGE_PIN AV2         [get_ports "LPDDR4_1_DQ9"]            ; # Bank 710  VCC1V1_LP4   IO_L1N_N0P3_M3P57_710           Actual Schem Name: LPDDR4_1_DQ10
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ9"]            ; 
set_property    PACKAGE_PIN AU8          [get_ports "LPDDR4_1_DQS2_T"]        ; # Bank 710  VCC1V1_LP4   IO_L15P_XCC_N5P0_M3P84_710      Actual Schem Name: LPDDR4_1_DQS3_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_1_DQS2_T"]        ; 
set_property    PACKAGE_PIN AU9          [get_ports "LPDDR4_1_DQS2_C"]        ; # Bank 710  VCC1V1_LP4   IO_L15N_XCC_N5P1_M3P85_710      Actual Schem Name: LPDDR4_1_DQS3_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_1_DQS2_C"]        ; 
set_property    PACKAGE_PIN AV6         [get_ports "LPDDR4_1_DQ21"]           ; # Bank 710  VCC1V1_LP4   IO_L16P_N5P2_M3P86_710          Actual Schem Name: LPDDR4_1_DQ30
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ21"]           ; 
set_property    PACKAGE_PIN AU6         [get_ports "LPDDR4_1_DQ20"]           ; # Bank 710  VCC1V1_LP4   IO_L16N_N5P3_M3P87_710          Actual Schem Name: LPDDR4_1_DQ28
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ20"]           ; 
set_property    PACKAGE_PIN AY10        [get_ports "LPDDR4_1_DQ19"]           ; # Bank 710  VCC1V1_LP4   IO_L17P_N5P4_M3P88_710          Actual Schem Name: LPDDR4_1_DQ25
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ19"]           ; 
set_property    PACKAGE_PIN AY9         [get_ports "LPDDR4_1_DQ17"]           ; # Bank 710  VCC1V1_LP4   IO_L17N_N5P5_M3P89_710          Actual Schem Name: LPDDR4_1_DQ26
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ17"]           ; 
set_property    PACKAGE_PIN AT8         [get_ports "LPDDR4_0_DMI2"]           ; # Bank 710  VCC1V1_LP4   IO_L18P_XCC_N6P0_M3P90_710      Actual Schem Name: LPDDR4_0_DMI2
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DMI2"]           ; 
#set_property   PACKAGE_PIN AT7         [get_ports "No Connect"]              ; # Bank 710  VCC1V1_LP4   IO_L18N_XCC_N6P1_M3P91_710      
set_property    IOSTANDARD LVSTL_11     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AP10        [get_ports "LPDDR4_0_DQ18"]           ; # Bank 710  VCC1V1_LP4   IO_L19P_N6P2_M3P92_710          Actual Schem Name: LPDDR4_0_DQ23
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ18"]           ; 
set_property    PACKAGE_PIN AN10        [get_ports "LPDDR4_0_DQ17"]           ; # Bank 710  VCC1V1_LP4   IO_L19N_N6P3_M3P93_710          Actual Schem Name: LPDDR4_0_DQ22
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ17"]           ; 
set_property    PACKAGE_PIN AW3         [get_ports "LPDDR4_1_DQ15"]           ; # Bank 710  VCC1V1_LP4   IO_L2P_N0P4_M3P58_710           Actual Schem Name: LPDDR4_1_DQ8
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ15"]           ; 
set_property    PACKAGE_PIN AP8         [get_ports "LPDDR4_0_DQ22"]           ; # Bank 710  VCC1V1_LP4   IO_L20P_N6P4_M3P94_710          Actual Schem Name: LPDDR4_0_DQ19
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ22"]           ; 
set_property    PACKAGE_PIN AR7         [get_ports "LPDDR4_0_DQ23"]           ; # Bank 710  VCC1V1_LP4   IO_L20N_N6P5_M3P95_710          Actual Schem Name: LPDDR4_0_DQ18
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ23"]           ; 
set_property    PACKAGE_PIN AP9          [get_ports "LPDDR4_0_DQS2_T"]        ; # Bank 710  VCC1V1_LP4   IO_L21P_XCC_N7P0_M3P96_710      Actual Schem Name: LPDDR4_0_DQS2_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_0_DQS2_T"]        ; 
set_property    PACKAGE_PIN AR9          [get_ports "LPDDR4_0_DQS2_C"]        ; # Bank 710  VCC1V1_LP4   IO_L21N_XCC_N7P1_M3P97_710      Actual Schem Name: LPDDR4_0_DQS2_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_0_DQS2_C"]        ; 
set_property    PACKAGE_PIN AN8         [get_ports "LPDDR4_0_DQ20"]           ; # Bank 710  VCC1V1_LP4   IO_L22P_N7P2_M3P98_710          Actual Schem Name: LPDDR4_0_DQ16
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ20"]           ; 
set_property    PACKAGE_PIN AP7         [get_ports "LPDDR4_0_DQ21"]           ; # Bank 710  VCC1V1_LP4   IO_L22N_N7P3_M3P99_710          Actual Schem Name: LPDDR4_0_DQ17
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ21"]           ; 
set_property    PACKAGE_PIN AT10        [get_ports "LPDDR4_0_DQ19"]           ; # Bank 710  VCC1V1_LP4   IO_L23P_N7P4_M3P100_710         Actual Schem Name: LPDDR4_0_DQ20
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ19"]           ; 
set_property    PACKAGE_PIN AT9         [get_ports "LPDDR4_0_DQ16"]           ; # Bank 710  VCC1V1_LP4   IO_L23N_N7P5_M3P101_710         Actual Schem Name: LPDDR4_0_DQ21
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ16"]           ; 
#set_property   PACKAGE_PIN AR5         [get_ports "No Connect"]              ; # Bank 710  VCC1V1_LP4   IO_L24P_GC_XCC_N8P0_M3P102_710  
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN AP5         [get_ports "No Connect"]              ; # Bank 710  VCC1V1_LP4   IO_L24N_GC_XCC_N8P1_M3P103_710  
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AV3         [get_ports "LPDDR4_1_DQ14"]           ; # Bank 710  VCC1V1_LP4   IO_L2N_N0P5_M3P59_710           Actual Schem Name: LPDDR4_1_DQ9
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ14"]           ; 
#set_property   PACKAGE_PIN AT6         [get_ports "No Connect"]              ; # Bank 710  VCC1V1_LP4   IO_L25P_N8P2_M3P104_710         
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN AR6         [get_ports "No Connect"]              ; # Bank 710  VCC1V1_LP4   IO_L25N_N8P3_M3P105_710         
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN AN6         [get_ports "No Connect"]              ; # Bank 710  VCC1V1_LP4   IO_L26P_N8P4_M3P106_710         
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN AN5         [get_ports "No Connect"]              ; # Bank 710  VCC1V1_LP4   IO_L26N_N8P5_M3P107_710         
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AT3         [get_ports "LPDDR4_1_DMI1"]           ; # Bank 710  VCC1V1_LP4   IO_L3P_XCC_N1P0_M3P60_710       Actual Schem Name: LPDDR4_1_DMI1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DMI1"]           ; 
#set_property   PACKAGE_PIN AU3         [get_ports "No Connect"]              ; # Bank 710  VCC1V1_LP4   IO_L3N_XCC_N1P1_M3P61_710       
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AW5         [get_ports "LPDDR4_1_DQ12"]           ; # Bank 710  VCC1V1_LP4   IO_L4P_N1P2_M3P62_710           Actual Schem Name: LPDDR4_1_DQ15
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ12"]           ; 
set_property    PACKAGE_PIN AW4         [get_ports "LPDDR4_1_DQ13"]           ; # Bank 710  VCC1V1_LP4   IO_L4N_N1P3_M3P63_710           Actual Schem Name: LPDDR4_1_DQ14
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_DQ13"]           ; 
set_property    PACKAGE_PIN AK2         [get_ports "LPDDR4_0_CAA2"]           ; # Bank 711  VCC1V1_LP4   IO_L0P_XCC_N0P0_M3P108_711      Actual Schem Name: LPDDR4_0_CAA2
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CAA2"]           ; 
set_property    PACKAGE_PIN AK1         [get_ports "LPDDR4_0_CSA1"]           ; # Bank 711  VCC1V1_LP4   IO_L0N_XCC_N0P1_M3P109_711      Actual Schem Name: LPDDR4_0_CSA1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CSA1"]           ; 
set_property    PACKAGE_PIN AL2         [get_ports "LPDDR4_0_CKEA0"]          ; # Bank 711  VCC1V1_LP4   IO_L5P_N1P4_M3P118_711          Actual Schem Name: LPDDR4_0_CKEA0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CKEA0"]          ; 
set_property    PACKAGE_PIN AL1         [get_ports "LPDDR4_0_CKEA1"]          ; # Bank 711  VCC1V1_LP4   IO_L5N_N1P5_M3P119_711          Actual Schem Name: LPDDR4_0_CKEA1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CKEA1"]          ; 
#set_property   PACKAGE_PIN AK6         [get_ports "No Connect"]              ; # Bank 711  VCC1V1_LP4   IO_L6P_GC_XCC_N2P0_M3P120_711   
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
#set_property   PACKAGE_PIN AK5         [get_ports "No Connect"]              ; # Bank 711  VCC1V1_LP4   IO_L6N_GC_XCC_N2P1_M3P121_711   
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AM6         [get_ports "LPDDR4_0_CAB0"]           ; # Bank 711  VCC1V1_LP4   IO_L7P_N2P2_M3P122_711          Actual Schem Name: LPDDR4_0_CAB0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CAB0"]           ; 
set_property    PACKAGE_PIN AL6         [get_ports "LPDDR4_0_CKEB1"]          ; # Bank 711  VCC1V1_LP4   IO_L7N_N2P3_M3P123_711          Actual Schem Name: LPDDR4_0_CKEB1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CKEB1"]          ; 
set_property    PACKAGE_PIN AJ5         [get_ports "LPDDR4_0_CAB3"]           ; # Bank 711  VCC1V1_LP4   IO_L8P_N2P4_M3P124_711          Actual Schem Name: LPDDR4_0_CAB3
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CAB3"]           ; 
set_property    PACKAGE_PIN AH5         [get_ports "LPDDR4_0_CAB2"]           ; # Bank 711  VCC1V1_LP4   IO_L8N_N2P5_M3P125_711          Actual Schem Name: LPDDR4_0_CAB2
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CAB2"]           ; 
set_property    PACKAGE_PIN AJ4          [get_ports "LPDDR4_0_CKB_T"]         ; # Bank 711  VCC1V1_LP4   IO_L9P_GC_XCC_N3P0_M3P126_711   Actual Schem Name: LPDDR4_0_CKB_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_0_CKB_T"]         ; 
set_property    PACKAGE_PIN AK4          [get_ports "LPDDR4_0_CKB_C"]         ; # Bank 711  VCC1V1_LP4   IO_L9N_GC_XCC_N3P1_M3P127_711   Actual Schem Name: LPDDR4_0_CKB_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_0_CKB_C"]         ; 
set_property    PACKAGE_PIN AM4         [get_ports "LPDDR4_0_CAA1"]           ; # Bank 711  VCC1V1_LP4   IO_L1P_N0P2_M3P110_711          Actual Schem Name: LPDDR4_0_CAA1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CAA1"]           ; 
set_property    PACKAGE_PIN AH7         [get_ports "LPDDR4_0_CAB5"]           ; # Bank 711  VCC1V1_LP4   IO_L10P_N3P2_M3P128_711         Actual Schem Name: LPDDR4_0_CAB5
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CAB5"]           ; 
set_property    PACKAGE_PIN AH6         [get_ports "LPDDR4_0_CAB4"]           ; # Bank 711  VCC1V1_LP4   IO_L10N_N3P3_M3P129_711         Actual Schem Name: LPDDR4_0_CAB4
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CAB4"]           ; 
set_property    PACKAGE_PIN AM5         [get_ports "LPDDR4_0_CKEB0"]          ; # Bank 711  VCC1V1_LP4   IO_L11P_N3P4_M3P130_711         Actual Schem Name: LPDDR4_0_CKEB0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CKEB0"]          ; 
set_property    PACKAGE_PIN AL4         [get_ports "LPDDR4_0_CAB1"]           ; # Bank 711  VCC1V1_LP4   IO_L11N_N3P5_M3P131_711         Actual Schem Name: LPDDR4_0_CAB1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CAB1"]           ; 
set_property    PACKAGE_PIN AL11        [get_ports "LPDDR4_0_DMI1"]           ; # Bank 711  VCC1V1_LP4   IO_L12P_GC_XCC_N4P0_M3P132_711  Actual Schem Name: LPDDR4_0_DMI1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DMI1"]           ; 
set_property    PACKAGE_PIN AK11        [get_ports "LPDDR4_0_CSB1"]           ; # Bank 711  VCC1V1_LP4   IO_L12N_GC_XCC_N4P1_M3P133_711  Actual Schem Name: LPDDR4_0_CSB1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CSB1"]           ; 
set_property    PACKAGE_PIN AM11        [get_ports "LPDDR4_0_DQ15"]           ; # Bank 711  VCC1V1_LP4   IO_L13P_N4P2_M3P134_711         Actual Schem Name: LPDDR4_0_DQ8
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ15"]           ; 
set_property    PACKAGE_PIN AM10        [get_ports "LPDDR4_0_DQ13"]           ; # Bank 711  VCC1V1_LP4   IO_L13N_N4P3_M3P135_711         Actual Schem Name: LPDDR4_0_DQ15
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ13"]           ; 
set_property    PACKAGE_PIN AJ10        [get_ports "LPDDR4_0_DQ11"]           ; # Bank 711  VCC1V1_LP4   IO_L14P_N4P4_M3P136_711         Actual Schem Name: LPDDR4_0_DQ10
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ11"]           ; 
set_property    PACKAGE_PIN AH9         [get_ports "LPDDR4_0_DQ10"]           ; # Bank 711  VCC1V1_LP4   IO_L14N_N4P5_M3P137_711         Actual Schem Name: LPDDR4_0_DQ11
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ10"]           ; 
set_property    PACKAGE_PIN AL3         [get_ports "LPDDR4_0_CAA0"]           ; # Bank 711  VCC1V1_LP4   IO_L1N_N0P3_M3P111_711          Actual Schem Name: LPDDR4_0_CAA0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CAA0"]           ; 
set_property    PACKAGE_PIN AK10         [get_ports "LPDDR4_0_DQS1_T"]        ; # Bank 711  VCC1V1_LP4   IO_L15P_XCC_N5P0_M3P138_711     Actual Schem Name: LPDDR4_0_DQS1_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_0_DQS1_T"]        ; 
set_property    PACKAGE_PIN AK9          [get_ports "LPDDR4_0_DQS1_C"]        ; # Bank 711  VCC1V1_LP4   IO_L15N_XCC_N5P1_M3P139_711     Actual Schem Name: LPDDR4_0_DQS1_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_0_DQS1_C"]        ; 
set_property    PACKAGE_PIN AH11        [get_ports "LPDDR4_0_DQ8"]            ; # Bank 711  VCC1V1_LP4   IO_L16P_N5P2_M3P140_711         Actual Schem Name: LPDDR4_0_DQ13
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ8"]            ; 
set_property    PACKAGE_PIN AH10        [get_ports "LPDDR4_0_DQ9"]            ; # Bank 711  VCC1V1_LP4   IO_L16N_N5P3_M3P141_711         Actual Schem Name: LPDDR4_0_DQ12
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ9"]            ; 
set_property    PACKAGE_PIN AM12        [get_ports "LPDDR4_0_DQ12"]           ; # Bank 711  VCC1V1_LP4   IO_L17P_N5P4_M3P142_711         Actual Schem Name: LPDDR4_0_DQ9
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ12"]           ; 
set_property    PACKAGE_PIN AL12        [get_ports "LPDDR4_0_DQ14"]           ; # Bank 711  VCC1V1_LP4   IO_L17N_N5P5_M3P143_711         Actual Schem Name: LPDDR4_0_DQ14
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ14"]           ; 
set_property    PACKAGE_PIN AK14         [get_ports "LPDDR4_0_DQS3_T"]        ; # Bank 711  VCC1V1_LP4   IO_L18P_XCC_N6P0_M3P144_711     Actual Schem Name: LPDDR4_0_DQS3_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_0_DQS3_T"]        ; 
set_property    PACKAGE_PIN AJ14         [get_ports "LPDDR4_0_DQS3_C"]        ; # Bank 711  VCC1V1_LP4   IO_L18N_XCC_N6P1_M3P145_711     Actual Schem Name: LPDDR4_0_DQS3_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_0_DQS3_C"]        ; 
set_property    PACKAGE_PIN AM15        [get_ports "LPDDR4_0_DQ28"]           ; # Bank 711  VCC1V1_LP4   IO_L19P_N6P2_M3P146_711         Actual Schem Name: LPDDR4_0_DQ29
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ28"]           ; 
set_property    PACKAGE_PIN AL15        [get_ports "LPDDR4_0_DQ30"]           ; # Bank 711  VCC1V1_LP4   IO_L19N_N6P3_M3P147_711         Actual Schem Name: LPDDR4_0_DQ28
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ30"]           ; 
set_property    PACKAGE_PIN AH2         [get_ports "LPDDR4_0_CSA0"]           ; # Bank 711  VCC1V1_LP4   IO_L2P_N0P4_M3P112_711          Actual Schem Name: LPDDR4_0_CSA0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CSA0"]           ; 
set_property    PACKAGE_PIN AJ15        [get_ports "LPDDR4_0_DQ25"]           ; # Bank 711  VCC1V1_LP4   IO_L20P_N6P4_M3P148_711         Actual Schem Name: LPDDR4_0_DQ24
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ25"]           ; 
set_property    PACKAGE_PIN AH15        [get_ports "LPDDR4_0_DQ24"]           ; # Bank 711  VCC1V1_LP4   IO_L20N_N6P5_M3P149_711         Actual Schem Name: LPDDR4_0_DQ25
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ24"]           ; 
set_property    PACKAGE_PIN AJ12        [get_ports "LPDDR4_0_DMI3"]           ; # Bank 711  VCC1V1_LP4   IO_L21P_XCC_N7P0_M3P150_711     Actual Schem Name: LPDDR4_0_DMI3
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DMI3"]           ; 
set_property    PACKAGE_PIN AK13        [get_ports "LPDDR4_0_CSB0"]           ; # Bank 711  VCC1V1_LP4   IO_L21N_XCC_N7P1_M3P151_711     Actual Schem Name: LPDDR4_0_CSB0
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CSB0"]           ; 
set_property    PACKAGE_PIN AH13        [get_ports "LPDDR4_0_DQ26"]           ; # Bank 711  VCC1V1_LP4   IO_L22P_N7P2_M3P152_711         Actual Schem Name: LPDDR4_0_DQ30
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ26"]           ; 
set_property    PACKAGE_PIN AH12        [get_ports "LPDDR4_0_DQ27"]           ; # Bank 711  VCC1V1_LP4   IO_L22N_N7P3_M3P153_711         Actual Schem Name: LPDDR4_0_DQ31
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ27"]           ; 
set_property    PACKAGE_PIN AM14        [get_ports "LPDDR4_0_DQ29"]           ; # Bank 711  VCC1V1_LP4   IO_L23P_N7P4_M3P154_711         Actual Schem Name: LPDDR4_0_DQ27
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ29"]           ; 
set_property    PACKAGE_PIN AL13        [get_ports "LPDDR4_0_DQ31"]           ; # Bank 711  VCC1V1_LP4   IO_L23N_N7P5_M3P155_711         Actual Schem Name: LPDDR4_0_DQ26
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_DQ31"]           ; 
set_property    PACKAGE_PIN AK8          [get_ports "LPDDR4_SMA_CLK1_P"]      ; # Bank 711  VCC1V1_LP4   IO_L24P_GC_XCC_N8P0_M3P156_711  Actual Schem Name: LPDDR4_SMA_CLK1_P
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_SMA_CLK1_P"]      ; 
set_property    PACKAGE_PIN AK7          [get_ports "LPDDR4_SMA_CLK1_N"]      ; # Bank 711  VCC1V1_LP4   IO_L24N_GC_XCC_N8P1_M3P157_711  Actual Schem Name: LPDDR4_SMA_CLK1_N
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_SMA_CLK1_N"]      ; 
set_property    PACKAGE_PIN AH1         [get_ports "LPDDR4_0_CAA3"]           ; # Bank 711  VCC1V1_LP4   IO_L2N_N0P5_M3P113_711          Actual Schem Name: LPDDR4_0_CAA3
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CAA3"]           ; 
set_property    PACKAGE_PIN AM7         [get_ports "LPDDR4_0_RESET_B"]        ; # Bank 711  VCC1V1_LP4   IO_L25P_N8P2_M3P158_711         Actual Schem Name: LPDDR4_0_RESET_B
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_RESET_B"]        ; 
set_property    PACKAGE_PIN AL7         [get_ports "LPDDR4_1_RESET_B"]        ; # Bank 711  VCC1V1_LP4   IO_L25N_N8P3_M3P159_711         Actual Schem Name: LPDDR4_1_RESET_B
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_1_RESET_B"]        ; 
set_property    PACKAGE_PIN AJ8         [get_ports "LPDDR4_DEBUG1"]           ; # Bank 711  VCC1V1_LP4   IO_L26P_N8P4_M3P160_711         Actual Schem Name: LPDDR4_DEBUG1
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_DEBUG1"]           ; 
#set_property   PACKAGE_PIN AH8         [get_ports "No Connect"]              ; # Bank 711  VCC1V1_LP4   IO_L26N_N8P5_M3P161_711         
#set_property   IOSTANDARD LVCMOSxx     [get_ports "No Connect"]              ; 
set_property    PACKAGE_PIN AJ2          [get_ports "LPDDR4_0_CKA_T"]         ; # Bank 711  VCC1V1_LP4   IO_L3P_XCC_N1P0_M3P114_711      Actual Schem Name: LPDDR4_0_CKA_T
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_0_CKA_T"]         ; 
set_property    PACKAGE_PIN AJ3          [get_ports "LPDDR4_0_CKA_C"]         ; # Bank 711  VCC1V1_LP4   IO_L3N_XCC_N1P1_M3P115_711      Actual Schem Name: LPDDR4_0_CKA_C
set_property    IOSTANDARD DIFF_LVSTL_11 [get_ports "LPDDR4_0_CKA_C"]         ; 
set_property    PACKAGE_PIN AG4         [get_ports "LPDDR4_0_CAA4"]           ; # Bank 711  VCC1V1_LP4   IO_L4P_N1P2_M3P116_711          Actual Schem Name: LPDDR4_0_CAA4
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CAA4"]           ; 
set_property    PACKAGE_PIN AH3         [get_ports "LPDDR4_0_CAA5"]           ; # Bank 711  VCC1V1_LP4   IO_L4N_N1P3_M3P117_711          Actual Schem Name: LPDDR4_0_CAA5
set_property    IOSTANDARD LVSTL_11     [get_ports "LPDDR4_0_CAA5"]           ; 
######################################################################################################################
#Other net      PACKAGE_PIN W40                 PCIE_CLK0_N                             103     GTY_REFCLKN0_103
#Other net      PACKAGE_PIN U40                 No Connect                              103     GTY_REFCLKN1_103
#Other net      PACKAGE_PIN W39                 PCIE_CLK0_P                             103     GTY_REFCLKP0_103
#Other net      PACKAGE_PIN U39                 No Connect                              103     GTY_REFCLKP1_103
#Other net      PACKAGE_PIN AB47                PCIE_RX0_N                              103     GTY_RXN0_103    
#Other net      PACKAGE_PIN AA45                PCIE_RX1_N                              103     GTY_RXN1_103    
#Other net      PACKAGE_PIN Y47                 PCIE_RX2_N                              103     GTY_RXN2_103    
#Other net      PACKAGE_PIN W45                 PCIE_RX3_N                              103     GTY_RXN3_103    
#Other net      PACKAGE_PIN AB46                PCIE_RX0_P                              103     GTY_RXP0_103    
#Other net      PACKAGE_PIN AA44                PCIE_RX1_P                              103     GTY_RXP1_103    
#Other net      PACKAGE_PIN Y46                 PCIE_RX2_P                              103     GTY_RXP2_103    
#Other net      PACKAGE_PIN W44                 PCIE_RX3_P                              103     GTY_RXP3_103    
#Other net      PACKAGE_PIN AB42                PCIE_TX0_N                              103     GTY_TXN0_103    
#Other net      PACKAGE_PIN Y42                 PCIE_TX1_N                              103     GTY_TXN1_103    
#Other net      PACKAGE_PIN V42                 PCIE_TX2_N                              103     GTY_TXN2_103    
#Other net      PACKAGE_PIN U44                 PCIE_TX3_N                              103     GTY_TXN3_103    
#Other net      PACKAGE_PIN AB41                PCIE_TX0_P                              103     GTY_TXP0_103    
#Other net      PACKAGE_PIN Y41                 PCIE_TX1_P                              103     GTY_TXP1_103    
#Other net      PACKAGE_PIN V41                 PCIE_TX2_P                              103     GTY_TXP2_103    
#Other net      PACKAGE_PIN U43                 PCIE_TX3_P                              103     GTY_TXP3_103    
#Other net      PACKAGE_PIN AA40                MGTYAVTT                                104     GTY_AVTTRCAL_L  
#Other net      PACKAGE_PIN R40                 PCIE_CLK1_N                             104     GTY_REFCLKN0_104        
#Other net      PACKAGE_PIN N40                 No Connect                              104     GTY_REFCLKN1_104        
#Other net      PACKAGE_PIN R39                 PCIE_CLK1_P                             104     GTY_REFCLKP0_104        
#Other net      PACKAGE_PIN N39                 No Connect                              104     GTY_REFCLKP1_104        
#Other net      PACKAGE_PIN V47                 PCIE_RX4_N                              104     GTY_RXN0_104    
#Other net      PACKAGE_PIN T47                 PCIE_RX5_N                              104     GTY_RXN1_104    
#Other net      PACKAGE_PIN P47                 PCIE_RX6_N                              104     GTY_RXN2_104    
#Other net      PACKAGE_PIN N45                 PCIE_RX7_N                              104     GTY_RXN3_104    
#Other net      PACKAGE_PIN V46                 PCIE_RX4_P                              104     GTY_RXP0_104    
#Other net      PACKAGE_PIN T46                 PCIE_RX5_P                              104     GTY_RXP1_104    
#Other net      PACKAGE_PIN P46                 PCIE_RX6_P                              104     GTY_RXP2_104    
#Other net      PACKAGE_PIN N44                 PCIE_RX7_P                              104     GTY_RXP3_104    
#Other net      PACKAGE_PIN T42                 PCIE_TX4_N                              104     GTY_TXN0_104    
#Other net      PACKAGE_PIN R44                 PCIE_TX5_N                              104     GTY_TXN1_104    
#Other net      PACKAGE_PIN P42                 PCIE_TX6_N                              104     GTY_TXN2_104    
#Other net      PACKAGE_PIN M42                 PCIE_TX7_N                              104     GTY_TXN3_104    
#Other net      PACKAGE_PIN T41                 PCIE_TX4_P                              104     GTY_TXP0_104    
#Other net      PACKAGE_PIN R43                 PCIE_TX5_P                              104     GTY_TXP1_104    
#Other net      PACKAGE_PIN P41                 PCIE_TX6_P                              104     GTY_TXP2_104    
#Other net      PACKAGE_PIN M41                 PCIE_TX7_P                              104     GTY_TXP3_104    
#Other net      PACKAGE_PIN AA39                N17453038                               104     GTY_RREF_L      
#Other net      PACKAGE_PIN L40                 ZSFP_SI570_CLK_C_N                      105     GTY_REFCLKN0_105        
#Other net      PACKAGE_PIN J40                 HSDP_SI570_CLK_C_N                      105     GTY_REFCLKN1_105        
#Other net      PACKAGE_PIN L39                 ZSFP_SI570_CLK_C_P                      105     GTY_REFCLKP0_105        
#Other net      PACKAGE_PIN J39                 HSDP_SI570_CLK_C_P                      105     GTY_REFCLKP1_105        
#Other net      PACKAGE_PIN M47                 VERSAL_HSDP_RX0_N                       105     GTY_RXN0_105    
#Other net      PACKAGE_PIN L45                 No Connect                              105     GTY_RXN1_105    
#Other net      PACKAGE_PIN K47                 SFP0_RX_N                               105     GTY_RXN2_105    
#Other net      PACKAGE_PIN H47                 SFP1_RX_N                               105     GTY_RXN3_105    
#Other net      PACKAGE_PIN M46                 VERSAL_HSDP_RX0_P                       105     GTY_RXP0_105    
#Other net      PACKAGE_PIN L44                 No Connect                              105     GTY_RXP1_105    
#Other net      PACKAGE_PIN K46                 SFP0_RX_P                               105     GTY_RXP2_105    
#Other net      PACKAGE_PIN H46                 SFP1_RX_P                               105     GTY_RXP3_105    
#Other net      PACKAGE_PIN K42                 VERSAL_HSDP_TX0_N                       105     GTY_TXN0_105    
#Other net      PACKAGE_PIN J44                 No Connect                              105     GTY_TXN1_105    
#Other net      PACKAGE_PIN H42                 SFP0_TX_N                               105     GTY_TXN2_105    
#Other net      PACKAGE_PIN G44                 SFP1_TX_N                               105     GTY_TXN3_105    
#Other net      PACKAGE_PIN K41                 VERSAL_HSDP_TX0_P                       105     GTY_TXP0_105    
#Other net      PACKAGE_PIN J43                 No Connect                              105     GTY_TXP1_105    
#Other net      PACKAGE_PIN H41                 SFP0_TX_P                               105     GTY_TXP2_105    
#Other net      PACKAGE_PIN G43                 SFP1_TX_P                               105     GTY_TXP3_105       
#Other net      PACKAGE_PIN G40                 HDMI_RX_CLK_C_N                         106     GTY_REFCLKN0_106        
#Other net      PACKAGE_PIN E40                 HDMI_8T49N241_OUT_C_N                   106     GTY_REFCLKN1_106        
#Other net      PACKAGE_PIN G39                 HDMI_RX_CLK_C_P                         106     GTY_REFCLKP0_106        
#Other net      PACKAGE_PIN E39                 HDMI_8T49N241_OUT_C_P                   106     GTY_REFCLKP1_106        
#Other net      PACKAGE_PIN F47                 HDMI_RX0_C_N                            106     GTY_RXN0_106    
#Other net      PACKAGE_PIN E45                 HDMI_RX1_C_N                            106     GTY_RXN1_106    
#Other net      PACKAGE_PIN D47                 HDMI_RX2_C_N                            106     GTY_RXN2_106    
#Other net      PACKAGE_PIN C45                 GND                                     106     GTY_RXN3_106    
#Other net      PACKAGE_PIN F46                 HDMI_RX0_C_P                            106     GTY_RXP0_106    
#Other net      PACKAGE_PIN E44                 HDMI_RX1_C_P                            106     GTY_RXP1_106    
#Other net      PACKAGE_PIN D46                 HDMI_RX2_C_P                            106     GTY_RXP2_106    
#Other net      PACKAGE_PIN C44                 GND                                     106     GTY_RXP3_106    
#Other net      PACKAGE_PIN F42                 HDMI_TX0_N                              106     GTY_TXN0_106    
#Other net      PACKAGE_PIN D42                 HDMI_TX1_N                              106     GTY_TXN1_106    
#Other net      PACKAGE_PIN B42                 HDMI_TX2_N                              106     GTY_TXN2_106    
#Other net      PACKAGE_PIN A44                 HDMI_TX_CLK_N                           106     GTY_TXN3_106    
#Other net      PACKAGE_PIN F41                 HDMI_TX0_P                              106     GTY_TXP0_106    
#Other net      PACKAGE_PIN D41                 HDMI_TX1_P                              106     GTY_TXP1_106    
#Other net      PACKAGE_PIN B41                 HDMI_TX2_P                              106     GTY_TXP2_106    
#Other net      PACKAGE_PIN A43                 HDMI_TX_CLK_P                           106     GTY_TXP3_106    
#Other net      PACKAGE_PIN AF10                8A34001_CLK1_IN_C_N                     200     GTY_REFCLKN0_200        
#Other net      PACKAGE_PIN AD10                8A34001_Q1_OUT_C_N                      200     GTY_REFCLKN1_200        
#Other net      PACKAGE_PIN AF11                8A34001_CLK1_IN_C_P                     200     GTY_REFCLKP0_200        
#Other net      PACKAGE_PIN AD11                8A34001_Q1_OUT_C_P                      200     GTY_REFCLKP1_200        
#Other net      PACKAGE_PIN AF1                 QSFP1_RX1_N                             200     GTY_RXN0_200    
#Other net      PACKAGE_PIN AE3                 QSFP1_RX2_N                             200     GTY_RXN1_200    
#Other net      PACKAGE_PIN AD1                 QSFP1_RX3_N                             200     GTY_RXN2_200    
#Other net      PACKAGE_PIN AC3                 QSFP1_RX4_N                             200     GTY_RXN3_200    
#Other net      PACKAGE_PIN AF2                 QSFP1_RX1_P                             200     GTY_RXP0_200    
#Other net      PACKAGE_PIN AE4                 QSFP1_RX2_P                             200     GTY_RXP1_200    
#Other net      PACKAGE_PIN AD2                 QSFP1_RX3_P                             200     GTY_RXP2_200    
#Other net      PACKAGE_PIN AC4                 QSFP1_RX4_P                             200     GTY_RXP3_200    
#Other net      PACKAGE_PIN AF6                 QSFP1_TX1_N                             200     GTY_TXN0_200    
#Other net      PACKAGE_PIN AE8                 QSFP1_TX2_N                             200     GTY_TXN1_200    
#Other net      PACKAGE_PIN AD6                 QSFP1_TX3_N                             200     GTY_TXN2_200    
#Other net      PACKAGE_PIN AC8                 QSFP1_TX4_N                             200     GTY_TXN3_200    
#Other net      PACKAGE_PIN AF7                 QSFP1_TX1_P                             200     GTY_TXP0_200    
#Other net      PACKAGE_PIN AE9                 QSFP1_TX2_P                             200     GTY_TXP1_200    
#Other net      PACKAGE_PIN AD7                 QSFP1_TX3_P                             200     GTY_TXP2_200    
#Other net      PACKAGE_PIN AC9                 QSFP1_TX4_P                             200     GTY_TXP3_200    
#Other net      PACKAGE_PIN AB10                SI570_8A34001_MUX_BUF0_C_N              201     GTY_REFCLKN0_201        
#Other net      PACKAGE_PIN M14                 FMCP1_GBTCLK0_M2C_C_N                   201     GTY_REFCLKN1_201        
#Other net      PACKAGE_PIN AB11                SI570_8A34001_MUX_BUF0_C_P              201     GTY_REFCLKP0_201        
#Other net      PACKAGE_PIN M15                 FMCP1_GBTCLK0_M2C_C_P                   201     GTY_REFCLKP1_201        
#Other net      PACKAGE_PIN AB1                 FMCP1_DP0_M2C_N                         201     GTY_RXN0_201    
#Other net      PACKAGE_PIN AA3                 FMCP1_DP1_M2C_N                         201     GTY_RXN1_201    
#Other net      PACKAGE_PIN Y1                  FMCP1_DP2_M2C_N                         201     GTY_RXN2_201    
#Other net      PACKAGE_PIN W3                  FMCP1_DP3_M2C_N                         201     GTY_RXN3_201    
#Other net      PACKAGE_PIN AB2                 FMCP1_DP0_M2C_P                         201     GTY_RXP0_201    
#Other net      PACKAGE_PIN AA4                 FMCP1_DP1_M2C_P                         201     GTY_RXP1_201    
#Other net      PACKAGE_PIN Y2                  FMCP1_DP2_M2C_P                         201     GTY_RXP2_201    
#Other net      PACKAGE_PIN W4                  FMCP1_DP3_M2C_P                         201     GTY_RXP3_201    
#Other net      PACKAGE_PIN AB6                 FMCP1_DP0_C2M_N                         201     GTY_TXN0_201    
#Other net      PACKAGE_PIN AA8                 FMCP1_DP1_C2M_N                         201     GTY_TXN1_201    
#Other net      PACKAGE_PIN Y6                  FMCP1_DP2_C2M_N                         201     GTY_TXN2_201    
#Other net      PACKAGE_PIN W8                  FMCP1_DP3_C2M_N                         201     GTY_TXN3_201    
#Other net      PACKAGE_PIN AB7                 FMCP1_DP0_C2M_P                         201     GTY_TXP0_201    
#Other net      PACKAGE_PIN AA9                 FMCP1_DP1_C2M_P                         201     GTY_TXP1_201    
#Other net      PACKAGE_PIN Y7                  FMCP1_DP2_C2M_P                         201     GTY_TXP2_201    
#Other net      PACKAGE_PIN W9                  FMCP1_DP3_C2M_P                         201     GTY_TXP3_201    
#Other net      PACKAGE_PIN L12                 No Connect                              202     GTY_REFCLKN0_202        
#Other Net      Package_Pin K14                 Fmcp1_Gbtclk1_M2c_C_N                   202     Gty_Refclkn1_202        
#Other Net      Package_Pin L13                 No Connect                              202     Gty_Refclkp0_202        
#Other Net      Package_Pin K15                 Fmcp1_Gbtclk1_M2c_C_P                   202     Gty_Refclkp1_202        
#Other net      PACKAGE_PIN V1                  FMCP1_DP4_M2C_N                         202     GTY_RXN0_202    
#Other net      PACKAGE_PIN U3                  FMCP1_DP5_M2C_N                         202     GTY_RXN1_202    
#Other net      PACKAGE_PIN T1                  FMCP1_DP6_M2C_N                         202     GTY_RXN2_202    
#Other net      PACKAGE_PIN R3                  FMCP1_DP7_M2C_N                         202     GTY_RXN3_202    
#Other net      PACKAGE_PIN V2                  FMCP1_DP4_M2C_P                         202     GTY_RXP0_202    
#Other net      PACKAGE_PIN U4                  FMCP1_DP5_M2C_P                         202     GTY_RXP1_202    
#Other net      PACKAGE_PIN T2                  FMCP1_DP6_M2C_P                         202     GTY_RXP2_202    
#Other net      PACKAGE_PIN R4                  FMCP1_DP7_M2C_P                         202     GTY_RXP3_202    
#Other net      PACKAGE_PIN V6                  FMCP1_DP4_C2M_N                         202     GTY_TXN0_202    
#Other net      PACKAGE_PIN U8                  FMCP1_DP5_C2M_N                         202     GTY_TXN1_202    
#Other net      PACKAGE_PIN T6                  FMCP1_DP6_C2M_N                         202     GTY_TXN2_202    
#Other net      PACKAGE_PIN R8                  FMCP1_DP7_C2M_N                         202     GTY_TXN3_202    
#Other net      PACKAGE_PIN V7                  FMCP1_DP4_C2M_P                         202     GTY_TXP0_202    
#Other net      PACKAGE_PIN U9                  FMCP1_DP5_C2M_P                         202     GTY_TXP1_202    
#Other net      PACKAGE_PIN T7                  FMCP1_DP6_C2M_P                         202     GTY_TXP2_202    
#Other net      PACKAGE_PIN R9                  FMCP1_DP7_C2M_P                         202     GTY_TXP3_202    
#Other net      PACKAGE_PIN Y11                 N23419026                               202     GTY_RREF_R      
#Other net      PACKAGE_PIN J12                 No Connect                              203     GTY_REFCLKN0_203        
#Other net      PACKAGE_PIN H14                 FMCP1_GBTCLK2_M2C_C_N                   203     GTY_REFCLKN1_203        
#Other net      PACKAGE_PIN J13                 No Connect                              203     GTY_REFCLKP0_203        
#Other net      PACKAGE_PIN H15                 FMCP1_GBTCLK2_M2C_C_P                   203     GTY_REFCLKP1_203        
#Other net      PACKAGE_PIN P1                  FMCP1_DP8_M2C_N                         203     GTY_RXN0_203    
#Other net      PACKAGE_PIN N3                  FMCP1_DP9_M2C_N                         203     GTY_RXN1_203    
#Other net      PACKAGE_PIN M1                  FMCP1_DP10_M2C_N                        203     GTY_RXN2_203    
#Other net      PACKAGE_PIN L3                  FMCP1_DP11_M2C_N                        203     GTY_RXN3_203    
#Other net      PACKAGE_PIN P2                  FMCP1_DP8_M2C_P                         203     GTY_RXP0_203    
#Other net      PACKAGE_PIN N4                  FMCP1_DP9_M2C_P                         203     GTY_RXP1_203    
#Other net      PACKAGE_PIN M2                  FMCP1_DP10_M2C_P                        203     GTY_RXP2_203    
#Other net      PACKAGE_PIN L4                  FMCP1_DP11_M2C_P                        203     GTY_RXP3_203    
#Other net      PACKAGE_PIN P6                  FMCP1_DP8_C2M_N                         203     GTY_TXN0_203    
#Other net      PACKAGE_PIN N8                  FMCP1_DP9_C2M_N                         203     GTY_TXN1_203    
#Other net      PACKAGE_PIN M6                  FMCP1_DP10_C2M_N                        203     GTY_TXN2_203    
#Other net      PACKAGE_PIN L8                  FMCP1_DP11_C2M_N                        203     GTY_TXN3_203    
#Other net      PACKAGE_PIN P7                  FMCP1_DP8_C2M_P                         203     GTY_TXP0_203    
#Other net      PACKAGE_PIN N9                  FMCP1_DP9_C2M_P                         203     GTY_TXP1_203    
#Other net      PACKAGE_PIN M7                  FMCP1_DP10_C2M_P                        203     GTY_TXP2_203    
#Other net      PACKAGE_PIN L9                  FMCP1_DP11_C2M_P                        203     GTY_TXP3_203    
#Other net      PACKAGE_PIN G12                 SI570_8A34001_MUX_BUF1_C_N              204     GTY_REFCLKN0_204
#Other net      PACKAGE_PIN F14                 FMCP2_GBTCLK0_M2C_C_N                   204     GTY_REFCLKN1_204
#Other net      PACKAGE_PIN G13                 SI570_8A34001_MUX_BUF1_C_P              204     GTY_REFCLKP0_204
#Other net      PACKAGE_PIN F15                 FMCP2_GBTCLK0_M2C_C_P                   204     GTY_REFCLKP1_204
#Other net      PACKAGE_PIN K1                  FMCP2_DP0_M2C_N                         204     GTY_RXN0_204    
#Other net      PACKAGE_PIN J3                  FMCP2_DP1_M2C_N                         204     GTY_RXN1_204    
#Other net      PACKAGE_PIN H1                  FMCP2_DP2_M2C_N                         204     GTY_RXN2_204    
#Other net      PACKAGE_PIN H5                  FMCP2_DP3_M2C_N                         204     GTY_RXN3_204    
#Other net      PACKAGE_PIN K2                  FMCP2_DP0_M2C_P                         204     GTY_RXP0_204    
#Other net      PACKAGE_PIN J4                  FMCP2_DP1_M2C_P                         204     GTY_RXP1_204    
#Other net      PACKAGE_PIN H2                  FMCP2_DP2_M2C_P                         204     GTY_RXP2_204    
#Other net      PACKAGE_PIN H6                  FMCP2_DP3_M2C_P                         204     GTY_RXP3_204    
#Other net      PACKAGE_PIN K6                  FMCP2_DP0_C2M_N                         204     GTY_TXN0_204    
#Other net      PACKAGE_PIN K10                 FMCP2_DP1_C2M_N                         204     GTY_TXN1_204    
#Other net      PACKAGE_PIN J8                  FMCP2_DP2_C2M_N                         204     GTY_TXN2_204    
#Other net      PACKAGE_PIN H10                 FMCP2_DP3_C2M_N                         204     GTY_TXN3_204    
#Other net      PACKAGE_PIN K7                  FMCP2_DP0_C2M_P                         204     GTY_TXP0_204    
#Other net      PACKAGE_PIN K11                 FMCP2_DP1_C2M_P                         204     GTY_TXP1_204    
#Other net      PACKAGE_PIN J9                  FMCP2_DP2_C2M_P                         204     GTY_TXP2_204    
#Other net      PACKAGE_PIN H11                 FMCP2_DP3_C2M_P                         204     GTY_TXP3_204    
#Other net      PACKAGE_PIN E12                 SI570_8A34001_MUX_BUF2_C_N              205     GTY_REFCLKN0_205        
#Other net      PACKAGE_PIN D14                 FMCP2_GBTCLK1_M2C_C_N                   205     GTY_REFCLKN1_205        
#Other net      PACKAGE_PIN E13                 SI570_8A34001_MUX_BUF2_C_P              205     GTY_REFCLKP0_205        
#Other net      PACKAGE_PIN D15                 FMCP2_GBTCLK1_M2C_C_P                   205     GTY_REFCLKP1_205        
#Other net      PACKAGE_PIN G3                  FMCP2_DP4_M2C_N                         205     GTY_RXN0_205    
#Other net      PACKAGE_PIN F1                  FMCP2_DP5_M2C_N                         205     GTY_RXN1_205    
#Other net      PACKAGE_PIN F5                  FMCP2_DP6_M2C_N                         205     GTY_RXN2_205    
#Other net      PACKAGE_PIN E3                  FMCP2_DP7_M2C_N                         205     GTY_RXN3_205    
#Other net      PACKAGE_PIN G4                  FMCP2_DP4_M2C_P                         205     GTY_RXP0_205    
#Other net      PACKAGE_PIN F2                  FMCP2_DP5_M2C_P                         205     GTY_RXP1_205    
#Other net      PACKAGE_PIN F6                  FMCP2_DP6_M2C_P                         205     GTY_RXP2_205    
#Other net      PACKAGE_PIN E4                  FMCP2_DP7_M2C_P                         205     GTY_RXP3_205    
#Other net      PACKAGE_PIN G8                  FMCP2_DP4_C2M_N                         205     GTY_TXN0_205    
#Other net      PACKAGE_PIN F10                 FMCP2_DP5_C2M_N                         205     GTY_TXN1_205    
#Other net      PACKAGE_PIN E8                  FMCP2_DP6_C2M_N                         205     GTY_TXN2_205    
#Other net      PACKAGE_PIN D10                 FMCP2_DP7_C2M_N                         205     GTY_TXN3_205    
#Other net      PACKAGE_PIN G9                  FMCP2_DP4_C2M_P                         205     GTY_TXP0_205    
#Other net      PACKAGE_PIN F11                 FMCP2_DP5_C2M_P                         205     GTY_TXP1_205    
#Other net      PACKAGE_PIN E9                  FMCP2_DP6_C2M_P                         205     GTY_TXP2_205    
#Other net      PACKAGE_PIN D11                 FMCP2_DP7_C2M_P                         205     GTY_TXP3_205    
#Other net      PACKAGE_PIN C12                 SI570_8A34001_MUX_BUF3_C_N              206     GTY_REFCLKN0_206        
#Other net      PACKAGE_PIN B14                 FMCP2_GBTCLK2_M2C_C_N                   206     GTY_REFCLKN1_206        
#Other net      PACKAGE_PIN C13                 SI570_8A34001_MUX_BUF3_C_P              206     GTY_REFCLKP0_206        
#Other net      PACKAGE_PIN B15                 FMCP2_GBTCLK2_M2C_C_P                   206     GTY_REFCLKP1_206        
#Other net      PACKAGE_PIN D1                  FMCP2_DP8_M2C_N                         206     GTY_RXN0_206    
#Other net      PACKAGE_PIN D5                  FMCP2_DP9_M2C_N                         206     GTY_RXN1_206    
#Other net      PACKAGE_PIN C3                  FMCP2_DP10_M2C_N                        206     GTY_RXN2_206    
#Other net      PACKAGE_PIN B5                  FMCP2_DP11_M2C_N                        206     GTY_RXN3_206    
#Other net      PACKAGE_PIN D2                  FMCP2_DP8_M2C_P                         206     GTY_RXP0_206    
#Other net      PACKAGE_PIN D6                  FMCP2_DP9_M2C_P                         206     GTY_RXP1_206    
#Other net      PACKAGE_PIN C4                  FMCP2_DP10_M2C_P                        206     GTY_RXP2_206    
#Other net      PACKAGE_PIN B6                  FMCP2_DP11_M2C_P                        206     GTY_RXP3_206    
#Other net      PACKAGE_PIN C8                  FMCP2_DP8_C2M_N                         206     GTY_TXN0_206    
#Other net      PACKAGE_PIN B10                 FMCP2_DP9_C2M_N                         206     GTY_TXN1_206    
#Other net      PACKAGE_PIN A8                  FMCP2_DP10_C2M_N                        206     GTY_TXN2_206    
#Other net      PACKAGE_PIN A12                 FMCP2_DP11_C2M_N                        206     GTY_TXN3_206    
#Other net      PACKAGE_PIN C9                  FMCP2_DP8_C2M_P                         206     GTY_TXP0_206    
#Other net      PACKAGE_PIN B11                 FMCP2_DP9_C2M_P                         206     GTY_TXP1_206    
#Other net      PACKAGE_PIN A9                  FMCP2_DP10_C2M_P                        206     GTY_TXP2_206    
#Other net      PACKAGE_PIN A13                 FMCP2_DP11_C2M_P                        206     GTY_TXP3_206    
#Other net      PACKAGE_PIN F34                 PMC_MIO0_500                            500     PMC_MIO0_500    
#Other net      PACKAGE_PIN M32                 PMC_MIO10_500                           500     PMC_MIO10_500   
#Other net      PACKAGE_PIN N32                 PMC_MIO11_500                           500     PMC_MIO11_500   
#Other net      PACKAGE_PIN N31                 PMC_MIO12_500                           500     PMC_MIO12_500   
#Other net      PACKAGE_PIN M31                 PMC_MIO13_500                           500     PMC_MIO13_500   
#Other net      PACKAGE_PIN K31                 PMC_MIO14_500                           500     PMC_MIO14_500   
#Other net      PACKAGE_PIN J31                 PMC_MIO15_500                           500     PMC_MIO15_500   
#Other net      PACKAGE_PIN H31                 PMC_MIO16_500                           500     PMC_MIO16_500   
#Other net      PACKAGE_PIN G31                 PMC_MIO17_500                           500     PMC_MIO17_500   
#Other net      PACKAGE_PIN F30                 PMC_MIO18_500                           500     PMC_MIO18_500   
#Other net      PACKAGE_PIN G30                 PMC_MIO19_500                           500     PMC_MIO19_500   
#Other net      PACKAGE_PIN G34                 PMC_MIO1_500                            500     PMC_MIO1_500    
#Other net      PACKAGE_PIN J30                 PMC_MIO20_500                           500     PMC_MIO20_500   
#Other net      PACKAGE_PIN K30                 PMC_MIO21_500                           500     PMC_MIO21_500   
#Other net      PACKAGE_PIN L30                 PMC_MIO22_500                           500     PMC_MIO22_500   
#Other net      PACKAGE_PIN M30                 PMC_MIO23_500                           500     PMC_MIO23_500   
#Other net      PACKAGE_PIN M29                 PMC_MIO24_500                           500     PMC_MIO24_500   
#Other net      PACKAGE_PIN L29                 PMC_MIO25_500                           500     PMC_MIO25_500   
#Other net      PACKAGE_PIN H33                 PMC_MIO2_500                            500     PMC_MIO2_500    
#Other net      PACKAGE_PIN F33                 PMC_MIO3_500                            500     PMC_MIO3_500    
#Other net      PACKAGE_PIN E33                 PMC_MIO4_500                            500     PMC_MIO4_500    
#Other net      PACKAGE_PIN F32                 PMC_MIO5_500                            500     PMC_MIO5_500    
#Other net      PACKAGE_PIN G32                 PMC_MIO6_500                            500     PMC_MIO6_500    
#Other net      PACKAGE_PIN H32                 PMC_MIO7_500                            500     PMC_MIO7_500    
#Other net      PACKAGE_PIN K32                 PMC_MIO8_500                            500     PMC_MIO8_500    
#Other net      PACKAGE_PIN L32                 PMC_MIO9_500                            500     PMC_MIO9_500    
#Other net      PACKAGE_PIN AC32                SYSMON_DXN                              500     SYSMON_ROOT_DXN_500     
#Other net      PACKAGE_PIN AC33                SYSMON_DXP                              500     SYSMON_ROOT_DXP_500     
#Other net      PACKAGE_PIN AB32                SYSMON_VN_R                             500     SYSMON_ROOT_VN_500      
#Other net      PACKAGE_PIN AA33                SYSMON_VP_R                             500     SYSMON_ROOT_VP_500      
#Other net      PACKAGE_PIN AA32                SYSMON_VREF_N                           500     SYSMON_ROOT_VREFN_500   
#Other net      PACKAGE_PIN AB33                SYSMON_VREF_P                           500     SYSMON_ROOT_VREFP_500   
#Other net      PACKAGE_PIN B21                 PMC_MIO26_501                           501     PMC_MIO26_501   
#Other net      PACKAGE_PIN C21                 PMC_MIO27_501                           501     PMC_MIO27_501   
#Other net      PACKAGE_PIN D21                 PMC_MIO28_501                           501     PMC_MIO28_501   
#Other net      PACKAGE_PIN E21                 PMC_MIO29_501                           501     PMC_MIO29_501   
#Other net      PACKAGE_PIN F20                 PMC_MIO30_501                           501     PMC_MIO30_501   
#Other net      PACKAGE_PIN E20                 PMC_MIO31_501                           501     PMC_MIO31_501   
#Other net      PACKAGE_PIN D20                 PMC_MIO32_501                           501     PMC_MIO32_501   
#Other net      PACKAGE_PIN B20                 PMC_MIO33_501                           501     PMC_MIO33_501   
#Other net      PACKAGE_PIN A20                 PMC_MIO34_501                           501     PMC_MIO34_501   
#Other net      PACKAGE_PIN A19                 PMC_MIO35_501                           501     PMC_MIO35_501   
#Other net      PACKAGE_PIN B19                 PMC_MIO36_501                           501     PMC_MIO36_501   
#Other net      PACKAGE_PIN C19                 PMC_MIO37_501_ZU4_TRIGGER               501     PMC_MIO37_501   
#Other net      PACKAGE_PIN D19                 PCIE_PERST_B                            501     PMC_MIO38_501   
#Other net      PACKAGE_PIN F19                 PCIE_PWRBRK_B                           501     PMC_MIO39_501   
#Other net      PACKAGE_PIN G19                 PMC_MIO40_501                           501     PMC_MIO40_501   
#Other net      PACKAGE_PIN F18                 PMC_MIO41_501                           501     PMC_MIO41_501   
#Other net      PACKAGE_PIN E18                 PMC_MIO42_501_RX_IN                     501     PMC_MIO42_501   
#Other net      PACKAGE_PIN D18                 PMC_MIO43_501_TX_OUT                    501     PMC_MIO43_501   
#Other net      PACKAGE_PIN C18                 PMC_MIO44_501_LP_I2C1_SCL               501     PMC_MIO44_501   
#Other net      PACKAGE_PIN A18                 PMC_MIO45_501_LP_I2C1_SDA               501     PMC_MIO45_501   
#Other net      PACKAGE_PIN A17                 PMC_MIO46_501_I2C0_SCL                  501     PMC_MIO46_501   
#Other net      PACKAGE_PIN B17                 PMC_MIO47_501_I2C0_SDA                  501     PMC_MIO47_501   
#Other net      PACKAGE_PIN C17                 PMC_MIO48_501                           501     PMC_MIO48_501   
#Other net      PACKAGE_PIN E17                 PMC_MIO49_501                           501     PMC_MIO49_501   
#Other net      PACKAGE_PIN F17                 PCIE_WAKE_B                             501     PMC_MIO50_501   
#Other net      PACKAGE_PIN G17                 PMC_MIO51_501                           501     PMC_MIO51_501   
#Other net      PACKAGE_PIN A39                 LPD_MIO0_502                            502     LPD_MIO0_502    
#Other net      PACKAGE_PIN E36                 LPD_MIO10_502                           502     LPD_MIO10_502   
#Other net      PACKAGE_PIN D36                 LPD_MIO11_502                           502     LPD_MIO11_502   
#Other net      PACKAGE_PIN C36                 LPD_MIO12_502                           502     LPD_MIO12_502   
#Other net      PACKAGE_PIN B36                 LPD_MIO13_502                           502     LPD_MIO13_502   
#Other net      PACKAGE_PIN A35                 LPD_MIO14_502                           502     LPD_MIO14_502   
#Other net      PACKAGE_PIN B35                 LPD_MIO15_502                           502     LPD_MIO15_502   
#Other net      PACKAGE_PIN D35                 LPD_MIO16_502                           502     LPD_MIO16_502   
#Other net      PACKAGE_PIN E35                 LPD_MIO17_502                           502     LPD_MIO17_502   
#Other net      PACKAGE_PIN F35                 LPD_MIO18_502                           502     LPD_MIO18_502   
#Other net      PACKAGE_PIN G35                 LPD_MIO19_502                           502     LPD_MIO19_502   
#Other net      PACKAGE_PIN B39                 LPD_MIO1_502                            502     LPD_MIO1_502    
#Other net      PACKAGE_PIN D34                 LPD_MIO20_502                           502     LPD_MIO20_502   
#Other net      PACKAGE_PIN C34                 LPD_MIO21_502                           502     LPD_MIO21_502   
#Other net      PACKAGE_PIN B34                 LPD_MIO22_502                           502     LPD_MIO22_502   
#Other net      PACKAGE_PIN A34                 LPD_MIO23_502                           502     LPD_MIO23_502   
#Other net      PACKAGE_PIN C33                 LPD_MIO24_502                           502     LPD_MIO24_502   
#Other net      PACKAGE_PIN D33                 LPD_MIO25_502                           502     LPD_MIO25_502   
#Other net      PACKAGE_PIN C39                 LPD_MIO2_502                            502     LPD_MIO2_502    
#Other net      PACKAGE_PIN C38                 LPD_MIO3_502                            502     LPD_MIO3_502    
#Other net      PACKAGE_PIN A38                 LPD_MIO4_502                            502     LPD_MIO4_502    
#Other net      PACKAGE_PIN A37                 LPD_MIO5_502                            502     LPD_MIO5_502    
#Other net      PACKAGE_PIN B37                 LPD_MIO6_502                            502     LPD_MIO6_502    
#Other net      PACKAGE_PIN C37                 LPD_MIO7_502                            502     LPD_MIO7_502    
#Other net      PACKAGE_PIN E37                 LPD_MIO8_502                            502     LPD_MIO8_502    
#Other net      PACKAGE_PIN F37                 LPD_MIO9_502                            502     LPD_MIO9_502    
#Other net      PACKAGE_PIN A33                 DONE                                    503     DONE_503        
#Other net      PACKAGE_PIN A32                 ERROR_OUT                               503     ERROR_OUT_503   
#Other net      PACKAGE_PIN D31                 FPGA_TCK                                503     TCK_503 FPGA_TCK
#Other net      PACKAGE_PIN B31                 FPGA_TDI                                503     TDI_503 FPGA_TDI
#Other net      PACKAGE_PIN C31                 FPGA_TDO                                503     TDO_503 FPGA_TDO
#Other net      PACKAGE_PIN D30                 FPGA_TMS                                503     TMS_503 FPGA_TMS
#Other net      PACKAGE_PIN C32                 MODE0                                   503     MODE0_503       
#Other net      PACKAGE_PIN E32                 MODE1                                   503     MODE1_503       
#Other net      PACKAGE_PIN E31                 MODE2                                   503     MODE2_503       
#Other net      PACKAGE_PIN E30                 MODE3                                   503     MODE3_503       
#Other net      PACKAGE_PIN AE34                POR_B                                   503     POR_B_503       
#Other net      PACKAGE_PIN B32                 PUDC_B                                  503     PUDC_B_503      
#Other net      PACKAGE_PIN AE32                REF_CLK                                 503     REF_CLK_503     
#Other net      PACKAGE_PIN B30                 RTC_PADI                                503     RTC_PADI_503    
#Other net      PACKAGE_PIN A30                 RTC_PADO                                503     RTC_PADO_503    
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