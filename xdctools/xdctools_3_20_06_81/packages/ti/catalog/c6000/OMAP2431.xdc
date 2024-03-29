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
 *  ======== OMAP2431.xdc ========
 *
 */
package ti.catalog.c6000;

/*!
 *  ======== OMAP2431 ========
 *  OMAP2431 device data sheet module
 *
 *  This module implements the xdc.platform.ICpuDataSheet interface and is 
 *  used by platforms to obtain "data sheet" information about this device.
 */
metaonly module OMAP2431 inherits IOMAP2x3x
{

instance:

    override config string   cpuCoreRevision = "1.0";
};
/*
 *  @(#) ti.catalog.c6000; 1, 0, 0, 0,295; 12-3-2010 11:44:03; /db/ztree/library/trees/platform/platform-l29x/src/
 */

