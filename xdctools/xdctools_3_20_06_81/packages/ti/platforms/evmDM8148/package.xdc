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
 *  ======== package.xdc ========
 *
 */
requires ti.catalog.c6000;
requires ti.catalog.arm.cortexm3;
requires ti.catalog.arm.cortexa8;
requires xdc.platform [1,0,1];

/*!
 *  ======== ti.platforms.evmDM8148 ========
 *  Platform package for the evmDM8148 platform.
 *
 *  This package implements the interfaces (xdc.platform.IPlatform)
 *  necessary to build and run executables on the evmDM8148 platform.
 *
 *  @a(Throws)
 *  `XDCException` exceptions are thrown for fatal errors. The following error
 *  codes are reported in the exception message:
 *  @p(dlist)
 *      -  `ti.platfoms.evmDM8148.LINK_TEMPLATE_ERROR`
 *           This error is raised when this platform cannot found the default
 *           linker command template `linkcmd.xdt` in the build target's
 *           package. When a target does not contain this file, the config
 *           parameter `{@link xdc.cfg.Program#linkTemplate}` must be set.
 *  @p
 */
package ti.platforms.evmDM8148 [1,0,0] {
    module Platform;
}
/*
 *  @(#) ti.platforms.evmDM8148; 1, 0, 0,12; 12-3-2010 12:47:04; /db/ztree/library/trees/platform/platform-l29x/src/
 */

