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
 *  ======== TMS320C5407.xs ========
 *
 */
  
/*
 *  ======== TMS320C5407.getMemoryMap ========
 *  Returns the memory map as seen by a program running on this device
 *  when the registers are set as specified by the regs hash.
 */
function getMemoryMap(regs)
{
    if (regs == null) {
        regs = {};
    }
    if (!("pmst" in regs)) {
        regs.pmst = 0xffe0;
    }

    var memBlock = this.$module.memBlock;
    var map = this.memMap;
    
    /* care about MP/MC, OVLY, DROM bits only. */
    var pmst = (regs.pmst - 0) & 0x68;
    
    switch (pmst) {
        case 0x0:   /* MP/MC = 0, OVLY = 0, DROM = 0 */
            map = [
                ["P_ROM0", memBlock["P_ROM0"]],
                ["P_ROM1", memBlock["P_ROM1"]],
                ["P_ROM2", memBlock["P_ROM2"]],
                ["P_ROM3", memBlock["P_ROM3"]],
                ["VECT", memBlock["VECT"]],
                ["D_SPRAM", memBlock["D_SPRAM"]],
                ["D_DARAM04", memBlock["D_DARAM04"]]
            ];
            break;

        case 0x8:   /* MP/MC = 0, OVLY = 0, DROM = 1 */
            map = [
                ["P_ROM0", memBlock["P_ROM0"]],
                ["P_ROM1", memBlock["P_ROM1"]],
                ["P_ROM2", memBlock["P_ROM2"]],
                ["P_ROM3", memBlock["P_ROM3"]],
                ["VECT", memBlock["VECT"]],
                ["D_SPRAM", memBlock["D_SPRAM"]],
                ["D_DARAM04", memBlock["D_DARAM04"]],
                ["D_ROM", memBlock["D_ROM"]]
            ];
            break;

        case 0x20:  /* MP/MC = 0, OVLY = 1, DROM = 0 */
            map = [
                ["P_DARAM02", memBlock["P_DARAM02"]],
                ["P_ROM0", memBlock["P_ROM0"]],
                ["P_ROM1", memBlock["P_ROM1"]],
                ["P_ROM2", memBlock["P_ROM2"]],
                ["P_ROM3", memBlock["P_ROM3"]],
                ["VECT", memBlock["VECT"]],
                ["D_SPRAM", memBlock["D_SPRAM"]],
                ["D_DARAM04", memBlock["D_DARAM04"]]
            ];
            break;

        case 0x28:  /* MP/MC = 0, OVLY = 1, DROM = 1 */
            map = [
                ["P_DARAM02", memBlock["P_DARAM02"]],
                ["P_ROM0", memBlock["P_ROM0"]],
                ["P_ROM1", memBlock["P_ROM1"]],
                ["P_ROM2", memBlock["P_ROM2"]],
                ["P_ROM3", memBlock["P_ROM3"]],
                ["VECT", memBlock["VECT"]],
                ["D_SPRAM", memBlock["D_SPRAM"]],
                ["D_DARAM04", memBlock["D_DARAM04"]],
                ["D_ROM", memBlock["D_ROM"]]
            ];
            break;

        case 0x40:  /* MP/MC = 1, OVLY = 0, DROM = 0 */
            map = [
                ["P_ROM1", memBlock["P_ROM1"]],
                ["D_SPRAM", memBlock["D_SPRAM"]],
                ["D_DARAM04", memBlock["D_DARAM04"]]
            ];
        break;

        case 0x48:  /* MP/MC = 1, OVLY = 0, DROM = 1 */
            map = [
                ["P_ROM1", memBlock["P_ROM1"]],
                ["D_SPRAM", memBlock["D_SPRAM"]],
                ["D_DARAM04", memBlock["D_DARAM04"]],
                ["D_ROM", memBlock["D_ROM"]]
            ];
            break;

        case 0x60:  /* MP/MC = 1, OVLY = 1, DROM = 0 */
            map = [
                ["P_DARAM04", memBlock["P_DARAM04"]],
                ["P_ROM1", memBlock["P_ROM1"]],
                ["D_SPRAM", memBlock["D_SPRAM"]],
                ["D_DARAM04", memBlock["D_DARAM04"]],
            ];
            break;

        case 0x68:  /* MP/MC = 1, OVLY = 1, DROM = 1 */
            map = [
                ["P_DARAM04", memBlock["P_DARAM04"]],
                ["P_ROM1", memBlock["P_ROM1"]],
                ["D_SPRAM", memBlock["D_SPRAM"]],
                ["D_DARAM04", memBlock["D_DARAM04"]],
                ["D_ROM", memBlock["D_ROM"]],
            ];
        break;

        default: {
            map = [];
            break;
        }
    }

    return (map);
}
/*
 *  @(#) ti.catalog.c5400; 1, 0, 0, 0,295; 12-3-2010 11:43:28; /db/ztree/library/trees/platform/platform-l29x/src/
 */
