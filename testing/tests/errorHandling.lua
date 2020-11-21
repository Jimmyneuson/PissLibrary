package.path = package.path..";../?.lua"
local PissLibrary = require "PissLibrary"

local errorHandlingTests = {}

errorHandlingTests["should error AddUrineType pass 1 as argument"] = function()
  local succ = pcall(PissLibrary.AddUrineType, 1)
  return not succ
end

errorHandlingTests["should error AddUrineType pass -5 as argument"] = function()
  local succ = pcall(PissLibrary.AddUrineType, -5)
  return not succ
end

errorHandlingTests["should work AddUrineType pass string as argument"] = function()
  local succ = pcall(PissLibrary.AddUrineType, "string")
  return succ
end

errorHandlingTests["should error Piss invalid urine type pass 1"] = function()
  local person = PissLibrary.new()
  local succ = pcall(person.Piss, person, 1)
  return not succ
end

errorHandlingTests["should work Piss valid urine type pass Clear"] = function()
  local person = PissLibrary.new()
  local succ = pcall(person.Piss, person, "Clear")
  return succ
end

errorHandlingTests["should error MultiPiss wrong amount type pass string"] = function()
  local person = PissLibrary.new()
  local succ = pcall(person.MultiPiss, person, "string")
  return not succ
end

errorHandlingTests["should work MultiPiss right type amount pass 1"] = function()
  local person = PissLibrary.new()
  local succ = pcall(person.MultiPiss, person, 0)
  return succ
end

errorHandlingTests["should error MultiPiss wrong amount pass -1"] = function()
  local person = PissLibrary.new()
  local succ = pcall(person.MultiPiss, person, -1)
  return not succ
end

return errorHandlingTests