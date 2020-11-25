local Lest = require("Lest")

local units = {
  "errorHandling",
  "functionality"
}

for _, unitName in ipairs(units) do
  local unit = require("./tests/"..unitName)
  local lestUnit = Lest.new(unitName)
  for testName, test in pairs(unit) do
    lestUnit:it(testName, test)
  end
end

os.exit(Lest.Run())