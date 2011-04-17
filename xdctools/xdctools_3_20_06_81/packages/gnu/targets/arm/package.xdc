/* 
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * */
requires xdc.bld [1,0,1];
requires gnu.targets;

/*!
 *  ======== gnu.targets.arm ========
 *  GCC-based code generation targets for Arm
 *
 *  This package offers a generic support for different GNU Arm compilers.
 *  For the targets in this package, a user must set configuration parameter
 *  `LONGNAME` in `config.bld`. That parameter specifies the relative path to
 *  the compiler executable from the directory specified in `rootDir`.
 *
 *  @a(Example)
 *  If a version 2007q3 of the CodeSourcery GNU toolchain for Arm is installed
 *  in C:/CodeSourcery/arm-2007q3, the following settings in `config.bld`
 *  configure `gnu.targets.arm.GCArmv6` target to use that toolchain:
 *  @p(code)
 *  var GCArmv6 = xdc.module("gnu.targets.arm.GCArmv6");
 *  GCArmv6.rootDir = "C:/CodeSourcery/arm-2007q3"; 
 *  GCArmv6.LONGNAME = "bin/arm-none-linux-gnueabi-gcc";
 *  @p
 *
 *  @see gnu.targets.ITarget#LONGNAME
 *  
 */
package gnu.targets.arm [1,0,0,0] {
    module GCArmv5T, GCArmv6, GCArmv7A;
}
/*
 *  @(#) gnu.targets.arm; 1, 0, 0, 0,261; 12-7-2010 15:18:56; /db/ztree/library/trees/xdctargets/xdctargets-c37x/src/ xlibrary

 */
