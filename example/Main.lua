package.path = package.path .. ';../?.lua' --stupid shitter path shit
local PissLibrary = require "PissLibrary"

local person = PissLibrary.new()
print(PissLibrary.GetUrineTypes())
person:Piss(PissLibrary.RandomUrineType())
person:Rest()
person:MultiPiss(50, PissLibrary.RandomUrineType())
person:Shit()