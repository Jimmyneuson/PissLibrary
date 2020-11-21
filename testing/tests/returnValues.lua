package.path = package.path..";../?.lua"
local PissLibrary = require "PissLibrary"

local returnValueTests = {}

returnValueTests["should return table"] = function()
  local person = PissLibrary.new()
  return (type(person) == "table")
end

returnValueTests["should have correct piss property new"] = function()
  local person = PissLibrary.new()
  return (person._PISS_CONSTANT == "Piss")
end

returnValueTests["should have correct piss left property new"] = function()
  local person = PissLibrary.new()
  return (person._PISS_LEFT == 100)
end

returnValueTests["should return table GetUrineTypes"] = function()
  return (type(PissLibrary.GetUrineTypes()) == "table")
end

returnValueTests["should return string RandomUrineType"] = function()
  return (type(PissLibrary.RandomUrineType()) == "string")
end

returnValueTests["should return valid urine type RandomUrineType"] = function()
  local randomUrineType = PissLibrary.RandomUrineType()
  for _, urineType in ipairs(PissLibrary.GetUrineTypes()) do
    if urineType == randomUrineType then
      return true
    end
  end
  return false
end

return returnValueTests