#!/bin/env lua
local commander = require "commander"

commander.add_description = "Add numbers a and b and print the output"
commander.add_usage = "a b"
function commander:add(a, b)
    print(a + b)
end

commander:run()