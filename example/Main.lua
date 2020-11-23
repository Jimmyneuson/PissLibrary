package.path = package.path .. ';../?.lua' --stupid shitter path shit
local PissLibrary = require ("PissLibrary")

local person = PissLibrary.new() -- Create a new person

PissLibrary.AddUrineType("White") -- Add a new urine type
for _, urineType in ipairs(PissLibrary.GetUrineTypes()) do
  print(urineType)
end

person:Piss("White") -- Make them piss out with a urine type of White

person:Rest() -- Let them rest

person:MultiPiss(20, "White") -- Make them piss 20 times with a urine type of White

person:Shit() -- wait what

-- Read the documentation on the website for more detailed information