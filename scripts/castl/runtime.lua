--[[
    Copyright (c) 2014, Paul Bernier
    
    CASTL is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    CASTL is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.
    You should have received a copy of the GNU Lesser General Public License
    along with CASTL. If not, see <http://www.gnu.org/licenses/>.
--]]

local internal = mjrequire("castl/internal")
local protos = mjrequire("castl/protos")
local jssupport = mjrequire("castl/jssupport")
local coreObjects = mjrequire("castl/core_objects")
local globalFunctions = mjrequire("castl/global_functions")
local bit = mjrequire("castl/modules/bit")
local others = mjrequire("castl/others")
local json = mjrequire("castl/json")
local Object = mjrequire("castl/constructor/object")
local Function = mjrequire("castl/constructor/function")
local Array = mjrequire("castl/constructor/array")
local Boolean = mjrequire("castl/constructor/boolean")
local Number = mjrequire("castl/constructor/number")
local String = mjrequire("castl/constructor/string")
local Date = mjrequire("castl/constructor/date")
local Error = mjrequire("castl/constructor/error/error")
local SyntaxError = mjrequire("castl/constructor/error/syntax_error")
local TypeError = mjrequire("castl/constructor/error/type_error")
local ReferenceError = mjrequire("castl/constructor/error/reference_error")
local RangeError = mjrequire("castl/constructor/error/range_error")
local URIError = mjrequire("castl/constructor/error/uri_error")
local EvalError = mjrequire("castl/constructor/error/eval_error")
local RegExp = mjrequire("castl/constructor/regexp")
local Math = mjrequire("castl/math")
local eval = mjrequire("castl/eval")

-- load prototypes definitions
protos.loadPrototypesDefinition()

-- Exported environment
local export = {
    -- jssupport
    _throw = jssupport.throw,
    _eq = jssupport.equal,
    _add = jssupport.add,
    _addStr1 = jssupport.addString1,
    _addStr2 = jssupport.addString2,
    _addNum1 = jssupport.addNumber1,
    _addNum2 = jssupport.addNumber2,
    _bool = jssupport.boolean,
    _type = jssupport.typeof,
    _break = jssupport._break,
    _continue = jssupport._continue,
    _in = jssupport.inOp,
    _with = jssupport.with,
    _void = jssupport.void,
    _e = jssupport.e,
    _inc = jssupport.inc,
    _dec = jssupport.dec,
    _mod = jssupport.modulo,
    _lt = jssupport.lt,
    _le = jssupport.le,
    _gt = jssupport.gt,
    _ge = jssupport.ge,
    NaN = 0/0,
    Infinity = jssupport.Infinity,

    -- global functions
    isNaN = globalFunctions.isNaN,
    isFinite = globalFunctions.isFinite,
    parseFloat = globalFunctions.parseFloat,
    parseInt = globalFunctions.parseInt,
    encodeURI = globalFunctions.encodeURI,
    encodeURIComponent = globalFunctions.encodeURIComponent,
    decodeURI = globalFunctions.decodeURI,
    decodeURIComponent = globalFunctions.decodeURIComponent,
    eval = eval.eval,

    -- internal
    _tonum = internal.ToNumber,
    null = internal.null,

    -- core object
    _obj = coreObjects.obj,
    _arr = coreObjects.array,
    _regexp = coreObjects.regexp,
    _args = coreObjects.arguments,
    _new = coreObjects.new,
    _instanceof = coreObjects.instanceof,
    _props = coreObjects.props,
    this = coreObjects.this,

    -- constructors
    Object = Object,
    Function = Function,
    Array = Array,
    Boolean = Boolean,
    Number = Number,
    String = String,
    Date = Date,
    RegExp = RegExp,
    Error = Error,
    TypeError = TypeError,
    SyntaxError = SyntaxError,
    ReferenceError = ReferenceError,
    RangeError = RangeError,
    URIError = URIError,
    EvalError = EvalError,

    -- others
    console = others.console,
    JSON = json,
    Math = Math,
    _lshift = bit.lshift,
    _rshift = bit.rshift,
    _arshift = bit.arshift,
    _bor = bit.bor,
    _bxor = bit.bxor,
    _band = bit.band,
    _bnot = bit.bnot,

    -- standard library export
    _tostr = tostring,
    _pcall = pcall,
    _ipairs = ipairs,
    _seq = table.remove,

    __use = function(module, ...)
        for k,v in pairs(module) do
            if _G[k] then
                mj:warn("use: skipping duplicate symbol ", k, "\n")
            else
                _G[k] = module[k]
            end
        end
    end
}

if jit ~= nil then
    export._wenv = setfenv
end

if _nodejs ~= nil then
    local nodejs = mjrequire("castl/nodejs")
    export.require = nodejs.require
end

return export
