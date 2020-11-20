math.randomseed(os.time())
local random = math.random
local floor = math.floor

local function crash()
  while "sending hitmen" do end
end

local PissLibrary = {}

local PissLibraryObject = {}
PissLibraryObject.__index = PissLibraryObject

local OUT_OF_PISS = "Piss is no more."
local NEED_TO_PISS = "NEED TO PISS"
local STUPID_USER = "NO SHIT ONLY PISS"
local NOT_ENOUGH = "NOT ENOUGH PISS"
local INVALID_PISS = "INVALID URINE TYPE"

local URINE_TYPES = {
  "Clear",
  "Slightly yellow",
  "Very yellow",
  "Brown",
  "Bloody",
}

function PissLibrary.new()
  return setmetatable({
    _PISS_CONSTANT = "Piss",
    _PISS_LEFT = 100
  }, PissLibraryObject)
end

function PissLibrary.GetUrineTypes()
  return URINE_TYPES
end

function PissLibrary.RandomUrineType()
  return URINE_TYPES[random(1, #URINE_TYPES)]
end

local function isValidUrineType(urineType)
  for _, urineItem in ipairs(PissLibrary.GetUrineTypes()) do
    if urineItem == urineType then
      return true
    end
  end
  return false
end

function PissLibraryObject:Piss(urineType)
  assert(self._PISS_LEFT > 0, OUT_OF_PISS)
  assert(isValidUrineType(urineType), INVALID_PISS)

  print(string.format("%sING...\n%s IS %s", self._PISS_CONSTANT, self._PISS_CONSTANT, urineType))
  self._PISS_LEFT = self._PISS_LEFT - 1
end

function PissLibraryObject:MultiPiss(amount, urineType)
  assert(type(amount) ==  "number", "Amount must be a number")
  assert(not (amount <= 0), NOT_ENOUGH)
  assert(isValidUrineType(urineType), INVALID_PISS)

  local enoughPiss = ( self._PISS_LEFT >= amount )
  urineType = urineType or self:RandomUrineType()

  assert(enoughPiss, OUT_OF_PISS)

  for _ = 1, amount do
    self._PISS_LEFT = self._PISS_LEFT - 1
    if self._PISS_LEFT < 1 then
      error(OUT_OF_PISS)
    else
      self:Piss(urineType)
    end
  end
end

function PissLibraryObject:Rest()
  if random() >= 0.5 then
    print(NEED_TO_PISS) 
  else
    self._PISS_LEFT = self._PISS_LEFT + 1
  end
end

function PissLibraryObject:Shit()
  if random(2^62) == floor((2^62)/random(10)) then
    local SHIT_CONSTANT = "SHIT"
    print(string.format("%sTING??1!!?", SHIT_CONSTANT))
    crash()
  else
    error(STUPID_USER)
  end
end


return PissLibrary