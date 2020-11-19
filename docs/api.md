# Api Documentation

## Constructor 

`Person` `PissLibrary.new()` constructs a new person which is exposed to several other methods and no properties. People also keep track of how much piss they have left. Here is a quick example of a person being constructed.
```lua
local PissLibrary = require("PissLibrary")

local person = PissLibrary.new()
```

## Static Methods

Methods of the library which can't be directly accessed by a person.

### GetUrineTypes 
`Table` `PissLibrary.GetUrineTypes()` returns all the available urine types available. This example shows all the possible urine types available.
```lua
local PissLibrary = require("PissLibrary")

local urineTypes = PissLibrary.GetUrineTypes()
--[[
  {
    Clear,
    Slightly Yellow,
    Very Yellow,
    Brown,
    Bloody
  }
]]

for _, urineType in ipairs(urineTypes) do
  print(urineType)
end
```

### RandomUrineType
`String` `PissLibrary.RandomUrineType()` returns a randomly selected urine type from `PissLibrary.RandomUrineType()`. This example randomly prints two urine types.
```lua
  local PissLibrary = require("PissLibrary")

  print(PissLibrary.RandomUrineType()) -- Clear
  print(PissLibrary.RandomUrineType()) -- Bloody
```

## Methods
These methods are directly exposed to objects (or people) constructed with `PissLibrary.new()`.

### Piss
`void` `Person:Piss(String urineType)` This will print a message telling you what type of urine you pissed. It will also take away some piss from the person. The following example shows how to use it and what it prints.  
```lua
local PissLibrary = require("PissLibrary")

local person = PissLibrary.new()

local urineType = "Clear" -- has to be a valid urine type 
person:Piss(urineType)
--PISSING...
--PISS IS Clear
```

### MultiPiss
`void` `Person:MultiPiss(Int amount, [, String urineType])` This is the same as `Person:Piss()` but it does it multiple times. It will go until there is no piss left or the amount is reached. This also optionally takes a urineType, otherwise it will be random.
```lua
local PissLibrary = require("PissLibrary")

local person = PissLibrary.new()
person:MultiPiss(2)
--PISSING...
--PISS IS Clear
--PISSING...
--PISS IS Bloody
```

### Shit
`void` `Person:Shit()` Won't actually make you shit obviously. Don't use.
```lua
local PissLibrary = require("PissLibrary")

local person = PissLibrary.new()
person:Shit()
--NO SHIT ONLY PISS
```
!!! warning "There is a slight chance of shit."