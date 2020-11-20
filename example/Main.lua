package.path = package.path .. ';../?.lua' --stupid shitter path shit
local PissLibrary = require "PissLibrary"

local person = PissLibrary.new()
PissLibrary.AddUrineType("White")
for _, urineType in ipairs(PissLibrary.GetUrineTypes()) do
  print(urineType)
end
person:Piss(PissLibrary.RandomUrineType())
person:Rest()
person:MultiPiss(50, PissLibrary.RandomUrineType())
person:Shit()