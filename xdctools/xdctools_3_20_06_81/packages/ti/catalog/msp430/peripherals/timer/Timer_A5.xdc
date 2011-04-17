/*!
 *  ======== Timer_A5 ========
 *  MSP430 Timer_A5 timer
 */
metaonly module Timer_A5 inherits ITimer_A {

instance:

    override config string name = "TimerA5";

    /*! Timer A5 Control Register */
    config TACTL_t TAxCTL = {
        TASSEL : TASSEL_0,
        ID : ID_0,    
        MC : MC_0,          
        TACLR : TACLR_OFF, 
        TAIE : TAIE_OFF,       
        TAIFG : TAIFG_OFF
    };               

    /*! Capture/Compare Control 0 */    
    config TACCTLx_t TACCTL0 = {
        CM : CM_0,
        CCIS : CCIS_0,
        SCS : SCS_OFF,
        SCCI : SCCI_OFF,
        CAP : CAP_OFF,
        OUTMOD : OUTMOD_0,
        CCIE : CCIE_OFF,
        CCI : CCI_OFF,
        OUT : OUT_OFF,
        COV : COV_OFF,
        CCIFG : CCIFG_OFF
    };
    
    /*! Capture/Compare Control 1 */
    config TACCTLx_t TACCTL1 = {
        CM : CM_0,
        CCIS : CCIS_0,
        SCS : SCS_OFF,
        SCCI : SCCI_OFF,
        CAP : CAP_OFF,
        OUTMOD : OUTMOD_0,
        CCIE : CCIE_OFF,
        CCI : CCI_OFF,
        OUT : OUT_OFF,
        COV : COV_OFF,
        CCIFG : CCIFG_OFF
    };
    
    /*! Capture/Compare Control 2 */
    config TACCTLx_t TACCTL2 = {
        CM : CM_0,
        CCIS : CCIS_0,
        SCS : SCS_OFF,
        SCCI : SCCI_OFF,
        CAP : CAP_OFF,
        OUTMOD : OUTMOD_0,
        CCIE : CCIE_OFF,
        CCI : CCI_OFF,
        OUT : OUT_OFF,
        COV : COV_OFF,
        CCIFG : CCIFG_OFF
    };

    /*! Capture/Compare Control 3 */
    config TACCTLx_t TACCTL3 = {
        CM : CM_0,
        CCIS : CCIS_0,
        SCS : SCS_OFF,
        SCCI : SCCI_OFF,
        CAP : CAP_OFF,
        OUTMOD : OUTMOD_0,
        CCIE : CCIE_OFF,
        CCI : CCI_OFF,
        OUT : OUT_OFF,
        COV : COV_OFF,
        CCIFG : CCIFG_OFF
    };

    /*! Capture/Compare Control 4 */
    config TACCTLx_t TACCTL4 = {
        CM : CM_0,
        CCIS : CCIS_0,
        SCS : SCS_OFF,
        SCCI : SCCI_OFF,
        CAP : CAP_OFF,
        OUTMOD : OUTMOD_0,
        CCIE : CCIE_OFF,
        CCI : CCI_OFF,
        OUT : OUT_OFF,
        COV : COV_OFF,
        CCIFG : CCIFG_OFF
    };

    config int TACCR0 = 0;                         /*! Capture/Compare 0 */
    config int TACCR1 = 0;                         /*! Capture/Compare 1 */
    config int TACCR2 = 0;                         /*! Capture/Compare 2 */
    config int TACCR3 = 0;                         /*! Capture/Compare 3 */
    config int TACCR4 = 0;                         /*! Capture/Compare 4 */

	/*! Determine if each Register needs to be forced set or not */
	readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
	[
		{ register : "TACTL"   , regForceSet : false },
		{ register : "TACCTL0" , regForceSet : false },
		{ register : "TACCTL1" , regForceSet : false },
		{ register : "TACCTL2" , regForceSet : false },
		{ register : "TACCTL3" , regForceSet : false },
		{ register : "TACCTL4" , regForceSet : false },
		{ register : "TACCR0"  , regForceSet : false },
		{ register : "TACCR1"  , regForceSet : false },
		{ register : "TACCR2"  , regForceSet : false },
		{ register : "TACCR3"  , regForceSet : false },
		{ register : "TACCR4"  , regForceSet : false }
	];
}