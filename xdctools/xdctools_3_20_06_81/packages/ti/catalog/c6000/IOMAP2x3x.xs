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
 *  ======== IOMAP2x3x.xs ========
 *
 */

/*
 *  ======== IOMAP2x3x.getMemoryMap ========
 *  Returns the memory map as seen by a program running on this device
 *  when the registers are set as specified by the regs hash.
 */
function getMemoryMap(regs)
{

    if (regs != null && "l1PMode" in regs && regs.l1PMode != null) {
        if (this.$module.cacheSizeL1[regs.l1PMode] != undefined) {
            this.memMap["L1PSRAM"].len -=
                this.$module.cacheSizeL1[regs.l1PMode];
            if (this.memMap["L1PSRAM"].len == 0) {
                delete this.memMap["L1PSRAM"];
            }
        }
        else {
            throw new Error("Can't set L1P cache to size: " + regs.l1PMode);
        }
    }
    else {
        delete this.memMap["L1PSRAM"];
    }

    if (regs != null && "l1DMode" in regs && regs.l1DMode != null) {
        if (this.$module.cacheSizeL1[regs.l1DMode] != undefined) {
            this.memMap["L1DSRAM"].len -=
                this.$module.cacheSizeL1[regs.l1DMode]; 
        }
        else {
            throw new Error("Can't set L1D cache to size: " + regs.l1DMode);
        }
    }
    else {
        this.memMap["L1DSRAM"].len-= this.$module.cacheSizeL1["32k"];
    }

    if (regs != null && "l2Mode" in regs && regs.l2Mode != null) {
        if (this.$module.cacheSizeL2[regs.l2Mode] != undefined) {
            this.memMap["IRAM"].len -= this.$module.cacheSizeL2[regs.l2Mode]; 
            if (this.memMap["IRAM"].len == 0) {
                delete this.memMap["IRAM"];
            }
        }
        else {
            throw new Error("Can't set L2 cache to size: " + regs.l2Mode);
        }
    }

    return (this.memMap);
}
/*
 *  @(#) ti.catalog.c6000; 1, 0, 0, 0,295; 12-3-2010 11:43:58; /db/ztree/library/trees/platform/platform-l29x/src/
 */

