# PissLibrary

## About
A piss library for all your piss needs. This includes an easy to understand interface and beautifully written documentation. I also assure you, there is no piss in this library. Never again will you have to worry about studying to use a simple library or even ~~shit~~ in your piss library. Just use it out of the box!

## Support
You can support me and this library by pinging and thanking me in the roblox discord server (jimmyneuson#3519).

## Example

```lua
local PissLibrary = require("PissLibrary")

local person = PissLibrary.new() -- Create a new person

PissLibrary.AddUrineType("White") -- Add a new urine type
for _, urineType in ipairs(PissLibrary.GetUrineTypes()) do
  print(urineType)
end

person:Piss("White") -- Make them piss out with a urine type of White

person:Rest() -- Let them rest

person:MultiPiss(20, "White") -- Make them piss 20 times with a urine type of White

person:Shit() -- wait what
```
For the whole documentation visit the [documentation website](https://jimmyneuson.github.io/PissLibrary/)