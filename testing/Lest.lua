-- Unit Testing Library by Anh Luong
-- Not documented yet recommended to use another one like LuaUnit.

local insert = table.insert

local SUCCESS_CODE = 0
local FAILED_CODE = -1

local function clearOutput()
  if not os.execute("clear") then
    os.execute("cls")
  end
end

local Lest = {}
Lest._categories = {}
Lest._failed = {}

local Category = {}
Category.__index = Category

function Lest.new(categoryName)
  local self = setmetatable({
    _units = {};
    _passedUnits = {};
    _failedUnits = {}
  }, Category)
  Lest._categories[categoryName] = self
  return self
end

function Category:it(should, unit)
  self._units[should] = unit
end

function Lest.Run()
  local passed = true;

  for _, category in pairs(Lest._categories) do
    local passedUnits = {}
    local failedUnits = {}

    for unitName, unit in pairs(category._units) do
      local testPassed = unit()
      if testPassed then
        insert(passedUnits, unitName)
        insert(category._passedUnits, unitName)
      else
        passed = false
        insert(Lest._failed, unitName)
        insert(failedUnits, unitName)
        insert(category._failedUnits, unitName)
      end
    end
  end

  clearOutput()

  for categoryName, category in pairs(Lest._categories) do
    print(string.format("Testing category: %s", categoryName))
    for _, unitName in ipairs(category._passedUnits) do
      print(string.format("\tUnit Passed: %s", unitName))
    end
    for _, unitName in ipairs(category._failedUnits) do
      print(string.format("\tUnit Passed: %s", unitName))
    end
    print()
  end

  if passed then
    print("All unit tests passed")
    return SUCCESS_CODE
  else
    print("One or more unit tests failed.")
    print("Units failed:")
    for _, testName in ipairs(Lest._failed) do
      print("\t"..testName)
    end
    return FAILED_CODE
  end
end

return Lest