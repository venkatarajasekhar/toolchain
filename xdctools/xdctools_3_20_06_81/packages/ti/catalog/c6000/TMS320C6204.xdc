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
 *  ======== TMS320C6204.xdc ========
 *
 */
package ti.catalog.c6000;

/*!
 *  ======== TMS320C6204 ========
 *  The C6204 device data sheet module.
 *
 *  This module implements the xdc.platform.ICpuDataSheet interface and is 
 *  used by platforms to obtain "data sheet" information about this device.
 */
metaonly module TMS320C6204 inherits ITMS320C6x0x
{
instance:
    override config string   cpuCore        = "6200";
    override config string   isa = "62";
};
/*
 *  @(#) ti.catalog.c6000; 1, 0, 0, 0,295; 12-3-2010 11:44:04; /db/ztree/library/trees/platform/platform-l29x/src/
 */

