local insert = table.insert

local SUCCESS_CODE = 0
local FAILED_CODE = -1

local Lest = {}
Lest._units = {}
Lest._failed = {}

local Unit = {}
Unit.__index = Unit

function Lest.new(unitName)
  local self = setmetatable({
    _tests = {}
  }, Unit)
  Lest._units[unitName] = self
  return self
end

function Unit:it(should, test)
  self._tests[should] = test
end

function Lest.Run()
  local passed = true;

  for unitName, unit in pairs(Lest._units) do
    local passedTests = {}
    local failedTests = {}

    for testName, test in pairs(unit._tests) do
      local testPassed = test()
      if testPassed then
        insert(passedTests, testName)
      else
        passed = false
        insert(Lest._failed, testName)
        insert(failedTests, testName)
      end
    end

    print(string.format("Testing unit: %s", unitName))
    for _, testName in ipairs(passedTests) do
      print(string.format("\tTest Passed: %s", testName))
    end
    for _, testName in ipairs(failedTests) do
      print(string.format("\tTest Failed: %s", testName))
    end
    print()
  end

  if passed then
    print("All unit tests passed")
    return SUCCESS_CODE
  else
    print("One or more unit tests failed.")
    print("Tests failed:")
    for _, testName in ipairs(Lest._failed) do
      print("\t"..testName)
    end
    return FAILED_CODE
  end
end

return Lest