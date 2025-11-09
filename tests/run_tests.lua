-- Simple test runner for xghost.nvim
package.path = package.path .. ";lua/?.lua;lua/?/init.lua"

local test = require("tests.theme_test")
local success = test.run_all_tests()

os.exit(success and 0 or 1)
