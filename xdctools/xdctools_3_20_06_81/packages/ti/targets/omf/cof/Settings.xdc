/*
 *  Copyright 2010 by Texas Instruments Incorporated.
 *
 */

/*
 *  ======== Settings.xdc ========
 *
 */


/*!
 *  ======== Settings ========
 *  Allows selection between TI and MOTOROLA cof libraries.
 */
metaonly module Settings {

    /*! 
     * Mode: {TI, MOTOROLA}. 
     *
     * TI. The function getLibs() returns cof_ti.lib libraries.
     *
     * MOTOROLA. The function getLibs() returns cof_mot.lib libraries.
     */
    enum Mode {TI, MOTOROLA};

    /*! 
     * Determines the libraries contributed by this package. 
     * 
     * Default is TI
     */
    config Mode mode = TI;

}
/*
 *  @(#) ti.targets.omf.cof; 1,0,0,49; 12-7-2010 15:19:25; /db/ztree/library/trees/xdctargets/xdctargets-c37x/src/ xlibrary

 */
