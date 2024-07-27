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

-- [[ CASTL Function constructor submodule]] --
-- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function

local esprima, castl, runtime
local luajit = jit ~= nil

local errorHelper = mjrequire("castl/modules/error_helper")
local throw = mjrequire("castl/jssupport").throw
local functionProto = mjrequire("castl/protos").functionProto

local Function

local pack = table.pack or function(...) return {n = select('#',...),...} end
local require, assert, load, tinsert, concat = require, assert, load, table.insert, table.concat

_ENV = nil

Function = function(this, ...)
    if ... then
        local args = pack(...)
        local body = args[args.n]

        if luajit then
            castl = castl or mjrequire("castl/jscompile/castl_jit")
            esprima = esprima or mjrequire("castl/jscompile/esprima_jit")
        else
            castl = castl or mjrequire("castl/jscompile/castl")
            esprima = esprima or mjrequire("castl/jscompile/esprima")
        end

        -- parse body of the function in error-tolerant mode
        local esprimaOptions = {tolerant = true}
        local ast = esprima:parse(body, esprimaOptions)

        -- get the params
        local params = {"local this"}
        for i = 1, args.n - 1 do
            tinsert(params, ",")
            tinsert(params, args[i])
        end
        tinsert(params, " = ...;\n")

        -- compile the ast
        -- castl used in eval mode
        local castlOptions = {jit = luajit}
        local castlResult = castl:compileAST(ast, castlOptions)

        local compiledFunction
        if castlResult.success then
            local luaCode = concat(params) .. castlResult.compiled
            -- eval lua code
            runtime = runtime or mjrequire("castl/runtime")
            compiledFunction = assert(load(luaCode, nil, "t", runtime))
        else
            throw(errorHelper.newEvalError("Function(): Failed to compile AST to Lua code"))
        end

        return compiledFunction
    end

    return function () end
end

Function.prototype = functionProto
functionProto.constructor = Function

return Function
