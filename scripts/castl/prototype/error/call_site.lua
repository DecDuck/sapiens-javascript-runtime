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

-- [[ CASTL CallSite prototype submodule]] --

return function(callSitePrototype)
    local getmetatable = getmetatable
    local gsub = string.gsub
    _ENV = nil

    callSitePrototype.getThis = function(this)
        return this.receiver
    end
    callSitePrototype.getTypeName = function(this)
    end
    callSitePrototype.getFunction = function(this)
        return this.fun
    end
    callSitePrototype.getFunctionName = function(this)
    end
    callSitePrototype.getMethodName = function(this)
    end
    callSitePrototype.getFileName = function(this)
        return getmetatable(this).frame.short_src
    end
    callSitePrototype.getLineNumber = function(this)
        return getmetatable(this).frame.currentline
    end
    callSitePrototype.getColumnNumber = function(this)
    end
    callSitePrototype.getEvalOrigin = function(this)
    end
    callSitePrototype.isToplevel = function(this)
    end
    callSitePrototype.isEval = function(this)
    end
    callSitePrototype.isNative = function(this)
    end
    callSitePrototype.isConstructor = function(this)
    end

    callSitePrototype.toString = function (this)
        local frame = getmetatable(this).frame
        local name = frame.name or "<anonymous>"
        local file = gsub(frame.short_src, "%[[TC]%]. ", '')
        return name .. " (" .. file .. ":" .. frame.currentline .. ")"
    end
end
