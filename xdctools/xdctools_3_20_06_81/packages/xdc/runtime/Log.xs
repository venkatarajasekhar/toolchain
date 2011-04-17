/* 
 *  Copyright (c) 2008 Texas Instruments. All rights reserved. 
 *  This program and the accompanying materials are made available under the 
 *  terms of the Eclipse Public License v1.0 and Eclipse Distribution License
 *  v. 1.0 which accompanies this distribution. The Eclipse Public License is
 *  available at http://www.eclipse.org/legal/epl-v10.html and the Eclipse
 *  Distribution License is available at 
 *  http://www.eclipse.org/org/documents/edl-v10.php.
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 * */
/*
 *  ======== Log.xs ========
 */

var Defaults = xdc.module('xdc.runtime.Defaults');
var Diags = xdc.module('xdc.runtime.Diags');

/*
 *  ======== lookupEventMessage ========
 *  Returns the format string for the event with the given id.
 */
function lookupEventMessage(eventId)
{
    var Program = xdc.useModule('xdc.rov.Program');
    
    /* Get the Log module's configuration object. */
    var cfg = Program.getModuleConfig('xdc.runtime.Log');
    
    if (cfg.idToInfo["#" + eventId] == undefined) {
        return ("<ERROR: No message found for eventId #" + eventId + ">");
    }
    else {
        return (cfg.idToInfo["#" + eventId].split('::')[1]);
    }
}

/*
 *  ======== getTargetArgSize ========
 *  Returns the target size of a record argument in bytes (not MAUs).
 */
function getTargetArgSize()
{
    /* Guaranteed to be 4 bytes on all targets. */
    return (4);
}
	
/*
 *  ======== lookupEventName ========
 */
function lookupEventName(eventId)
{
    var Program = xdc.useModule('xdc.rov.Program');
    
    /* Get the Log module's configuration object. */
    var cfg = Program.getModuleConfig('xdc.runtime.Log');
    
    if (cfg.idToInfo["#" + eventId] != undefined) {
        return (cfg.idToInfo["#" + eventId].split('::')[0]);
    }
    else if (info.eventId == 0) {
        return ("Log_print");
    }
    else {
        return ("Unrecognized event id: " + eventId);
    }
}

/*
 *  ======== lookupModuleName ========
 */
function lookupModuleName(modId)
{
    var Program = xdc.useModule('xdc.rov.Program');
    
    return (Program.moduleIdToName(modId));
}

/*
 *  ======== getTargetEventRecSize ========
 *  Returns the record size in bytes (not MAUs).
 */
function getTargetEventRecSize()
{
    var bytesPerMau = Program.build.target.bitsPerChar / 8;
        
    return (this.EventRec.$sizeof() * bytesPerMau);
}

/*
 *  ======== Event$alignof ========
 *  Return alignment required for an encoded value of an EventDesc
 */
function Event$alignof()
{
    return (Program.build.target.stdTypes.t_Int32.align);
}

/*
 *  ======== Event$encode ========
 *  Return a C expression that evaluates to the encoded value of an EventDesc
 */
function Event$encode(desc)
{
    var encodedDesc = "0";
    
    if (desc) {
        /* 
         * Determine the event's priority. If none is specified, give it the
         * max priority so that it isn't inadvertently filtered out.
         */
        var priMask;
        if (desc.level != undefined) {
            priMask = desc.level;
        }
        else {
            priMask = Diags.LEVEL1;
        }
                
        /* Determine the mask value by combining the event mask and priority. */
        var maskVal = (desc.mask | priMask) & 0xFFFF;
        
        encodedDesc = "(((xdc_runtime_Log_Event)" + desc.$private.id
            + ") << 16 | " + maskVal + ")";
    }
    
    return (encodedDesc);
}

/*
 *  ======== Event$sizeof ========
 *  Return sizeof the encoded value of an EventDesc
 */
function Event$sizeof()
{
    return (Program.build.target.stdTypes.t_Int32.size);
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(obj, params)
{
    var Text = xdc.module('xdc.runtime.Text');
    var Diags = xdc.module('xdc.runtime.Diags');

    for each (var mod in Program.targetModules()) {

        if (mod.PROXY$) {
            continue;
        }

        /* "inherit" the default logger */
        mod.Module__loggerObj = mod.common$.logger;

        /* If the module's header file was built with a version of XDCtools
         * prior to 3.20, we don't want to generate objects for new ILogger
         * functions because the original header files do not define the
         * required types. We have to do it for all modules even if they do
         * not have loggers.
         */
        if (!mod.$package.$$origVers ||
            (mod.$package.$$origVers < "xdc-v14"
             && mod.$package.$$origVers > "xdc-a00")) {
            if (mod.$sealed("Module__loggerFxn0")) {
                mod.$unseal("Module__loggerFxn0");
                mod.$unseal("Module__loggerFxn1");
                mod.$unseal("Module__loggerFxn2");
            }
            mod.Module__loggerFxn0 = $$NOGEN;
            mod.Module__loggerFxn1 = $$NOGEN;
            mod.Module__loggerFxn2 = $$NOGEN;
        }

        if (mod.common$.logger) {
            var cn = mod.common$.logger.$orig.$module.$name;

            if (mod.Module__loggerFxn0 != "$$NOGEN") {
                mod.Module__loggerFxn0 = $externModFxn(cn + '.write0');
                mod.Module__loggerFxn1 = $externModFxn(cn + '.write1');
                mod.Module__loggerFxn2 = $externModFxn(cn + '.write2');
            }
            mod.Module__loggerFxn4 = $externModFxn(cn + '.write4');
            mod.Module__loggerFxn8 = $externModFxn(cn + '.write8');
            mod.Module__loggerDefined = true;
        }

        Program.freezeRomConfig2(mod, 'Module__loggerFxn0');
        Program.freezeRomConfig2(mod, 'Module__loggerFxn1');
        Program.freezeRomConfig2(mod, 'Module__loggerFxn2');
        Program.freezeRomConfig2(mod, 'Module__loggerFxn4');
        Program.freezeRomConfig2(mod, 'Module__loggerFxn8');
        Program.freezeRomConfig2(mod, 'Module__loggerDefined');

        /* create an Id for all Log_Event's declared in the module */
        if ('$$logEvtCfgs' in mod && mod.$$logEvtCfgs.length > 0) {
            for each (var cn in mod.$$logEvtCfgs) {
                var desc = mod[cn];
                desc.$private.id = Text.defineRopeCord(desc.msg);
                
                /* TODO: what if id already exists!? */
                this.idToInfo["#" + desc.$private.id] = mod.$name + '.' + cn +
                    '::' + desc.msg;
            }
        }

        /* generate log event ids for loggable fxns in the module */
        var res = null;
        if ('$$loggables' in mod && mod.$$loggables.length > 0) {
            res = "";
            var sep = "";
            var id;
            var msg;
            var desc;
            for each (var fxn in mod.$$loggables) {
                res += sep;
                sep = ",";
                res += fxn.name;

                if (query(mod, 'ENTRY')) {
                    msg = "--> " + fxn.name + ": (" + fxn.entry + ")";
                    desc = new this.EventDesc({msg: msg});
                    id = Text.defineRopeCord(msg);
                    this.idToInfo['#' + id] = mod.$name + '.' + fxn.name +
                        '$ENTRY' + '::' + desc.msg;
                    desc.$private.id = id;
                    id = (id << 16) | Diags.ENTRY;
                }
                else {
                    id = 0;
                }
                res += ":" + id;

                if (query(mod, 'EXIT')) {
                    msg = "<-- " + fxn.name + ": " +
                        (fxn.exit ? fxn.exit : "void");
                    desc = new this.EventDesc({msg: msg});
                    id = Text.defineRopeCord(msg);
                    this.idToInfo['#' + id] = mod.$name + '.' + fxn.name +
                        '$EXIT' + '::' + desc.msg;
                    desc.$private.id = id;
                    id = (id << 16) | Diags.EXIT;
                }
                else {
                    id = 0;
                }
                res += ":" + id;
            }
        }

        /* record any generated event id's in module
         *    $$fxnEvtIds = "fxn_name:enter_id:exit_id,..."
         */
        mod.$$bind('$$fxnEvtIds', res);
    }
}

/*
 *  ======== query ========
 */
function query(mod, dl)
{
    var sel = 'diags_' + dl;
    
    return (mod.common$[sel] === undefined
        ? (Defaults.common$[sel] != Diags.ALWAYS_OFF)
            : (mod.common$[sel] != Diags.ALWAYS_OFF));
}

/*
 *  ======== validate ========
 */
function validate()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    var Diags = xdc.module('xdc.runtime.Diags');

    /* 
     * Validate all of the event definitions in all of the modules in the
     * configuration.
     */
    for (var i = 0; i < xdc.om.$modules.length; i++) {
        var mod = xdc.om.$modules[i];

        /* check all Log_Event's declared in any module */
        if ('$$logEvtCfgs' in mod && mod.$$logEvtCfgs.length > 0) {
            for each (var cn in mod.$$logEvtCfgs) {
                var desc = mod[cn];

                /* check that mask is within UInt16 range */
                if (desc.mask < 0) {
                    this.$logError("value of 'mask' must be non-negative",
                        mod, cn);
                }
                else if (desc.mask > 0xFFFF) {
                    this.$logError("value of 'mask' must be at most 16 bits",
                        mod, cn);
                }
                
                /* Verify that ASSERT and INTERNAL aren't used in the mask */
                if ((desc.mask & Diags.ASSERT) ||
                    (desc.mask & Diags.INTERNAL)) {
                    this.$logError("The categories ASSERT and INTERNAL are " +
                                   "for asserts only and can not be used for" +
                                   " event definitions.", mod, cn);
                }
                
                /* Check that 'level' is within valid range. */
                if ((desc.level > Diags.LEVEL4) | (desc.level < Diags.LEVEL1)) {
                    this.$logError("value of 'level' must be between " +
                                   "Diags.LEVEL1 and Diags.LEVEL4", mod, cn);
                }
            }
        }
    }
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,296; 11-16-2010 11:20:24; /db/ztree/library/trees/xdc/xdc-v53x/src/packages/
 */
