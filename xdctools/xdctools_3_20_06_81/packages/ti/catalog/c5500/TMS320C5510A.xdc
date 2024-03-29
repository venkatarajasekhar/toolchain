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
 *  ======== TMS320C5510A.xdc ========
 *! 05-Nov-2004 sasa    Created
 */
package ti.catalog.c5500;

/*!
 *  ======== TMS320C5510A ========
 *  The C5510A device data sheet module.
 *
 *  This module implements the xdc.platform.ICpuDataSheet interface and is 
 *  used by platforms to obtain "data sheet" information about this device.
 */
metaonly module TMS320C5510A inherits ITMS320C55xx
{
instance:
    override config string   cpuCoreRevision = "1.0";

    /*!
     *  ======== memMap ========
     *  The default memory map for this device
     */
    config xdc.platform.IPlatform.Memory memMap[string]  = [
        ["DARAM", {
            comment: "8 blocks of 8K bytes of on-chip Dual-Access RAM",
            name: "DARAM",
            base: 0x000000,
            len:  0x010000,
            space: "code/data",
            access: "RWX"
        }],
    
        ["SARAM", {
            comment: "32 blocks of 8K bytes of on-chip Single-Access RAM",
            name: "SARAM",
            base: 0x10000,
            len:  0x40000,
            space: "code/data",
            access: "RWX"
        }],
    ];
};
/*
 *  @(#) ti.catalog.c5500; 1, 0, 0, 0,295; 12-3-2010 11:43:35; /db/ztree/library/trees/platform/platform-l29x/src/
 */

