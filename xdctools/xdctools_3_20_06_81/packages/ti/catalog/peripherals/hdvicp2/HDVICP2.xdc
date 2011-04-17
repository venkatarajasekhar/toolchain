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

metaonly module HDVICP2 inherits xdc.platform.IPeripheral {

instance:
    /*!
     *  ======== baseAddr ========
     *  Address of the peripheral's control register.
     *
     *  A peripheral's registers are commonly accessed through a structure
     *  that defines the offsets of a particular register from the lowest
     *  address mapped to a peripheral. That lowest address is specified by
     *  this parameter.
     */
    config UInt baseAddr;
      
    /*!
     *  ======== intNum ========
     *  Transfer completion Interrupt source number
     *
     */
    config UInt intNum;
}
/*
 *  @(#) ti.catalog.peripherals.hdvicp2; 1,0,0,51; 12-3-2010 11:43:00; /db/ztree/library/trees/platform/platform-l29x/src/
 */
