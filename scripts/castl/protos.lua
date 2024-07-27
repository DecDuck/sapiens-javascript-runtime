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

local protos = {}

-- forward declaration
protos.arrayProto = {}
protos.booleanProto = {}
protos.dateProto = {}
protos.functionProto = {}
protos.numberProto = {}
protos.objectProto = {}
protos.regexpProto = {}
protos.stringProto = {}

protos.errorProto = {}
protos.rangeErrorProto = {}
protos.referenceErrorProto = {}
protos.syntaxErrorProto = {}
protos.typeErrorProto = {}
protos.evalErrorProto = {}
protos.uriErrorProto = {}
protos.callSiteProto = {}

-- load definition
protos.loadPrototypesDefinition = function()
    mjrequire("castl/prototype/array")(protos/arrayProto)
    mjrequire("castl/prototype/boolean")(protos/booleanProto)
    mjrequire("castl/prototype/date")(protos/dateProto)
    mjrequire("castl/prototype/function")(protos/functionProto)
    mjrequire("castl/prototype/number")(protos/numberProto)
    mjrequire("castl/prototype/object")(protos/objectProto)
    mjrequire("castl/prototype/regexp")(protos/regexpProto)
    mjrequire("castl/prototype/string")(protos/stringProto)

    mjrequire("castl/prototype/error/error")(protos/errorProto)
    mjrequire("castl/prototype/error/range_error")(protos/rangeErrorProto)
    mjrequire("castl/prototype/error/reference_error")(protos/referenceErrorProto)
    mjrequire("castl/prototype/error/syntax_error")(protos/syntaxErrorProto)
    mjrequire("castl/prototype/error/type_error")(protos/typeErrorProto)
    mjrequire("castl/prototype/error/eval_error")(protos/evalErrorProto)
    mjrequire("castl/prototype/error/uri_error")(protos/uriErrorProto)
    mjrequire("castl/prototype/error/call_site")(protos/callSiteProto)
end

return protos
