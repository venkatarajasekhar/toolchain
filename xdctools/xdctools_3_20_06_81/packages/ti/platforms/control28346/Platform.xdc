/*
 *  Copyright (c) 2010 by Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * */

/*
 *  ======== Platform.xdc ========
 *  This module implements xdc.IPlatform and defines configuration
 *  parameters that correspond to this platform's Cpu's, Board's, etc.
 *
 *  The configuration parameters are initialized in this package's
 *  configuration script (package.cfg) and "bound" to the TCOM object
 *  model.  Once they are part of the model, these parameters are
 *  queried by a program's configuration script.
 *
 *  This particular platform has a single Cpu, and therefore, only
 *  declares a single CPU configuration object.  Multi-CPU platforms
 *  would declare multiple Cpu configuration parameters (one per
 *  platform CPU).
 *
 */

package ti.platforms.control28346;

metaonly module Platform inherits xdc.platform.IPlatform
{
    readonly config xdc.platform.IPlatform.Board BOARD = {
        id:             "0",
        boardName:      "control28346",
        boardFamily:    "control28346",
        boardRevision:  null
    };

    readonly config xdc.platform.IExeContext.Cpu CPU = {
        id:             "0",
        clockRate:      300.0,
        catalogName:    "ti.catalog.c2800",
        deviceName:     "TMS320C28346",
        revision:       null
    };
    
instance:

    override readonly config xdc.platform.IPlatform.MemoryMap
        externalMemoryMap = [
            ["SRAM",
                {
                    name: "SRAM",
                    base: 0x200000,
                    len:  0x020000,
                    page: 0,
                    space: "code/data",
                }
            ],
        ];

    override config string codeMemory = "L47SARAM";
    
    override config string dataMemory = "L03SARAM";

    override config string stackMemory = "L03SARAM";
};
/*
 *  @(#) ti.platforms.control28346; 1, 0, 0,71; 12-3-2010 12:37:27; /db/ztree/library/trees/platform/platform-l29x/src/
 */

