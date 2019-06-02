#!/bin/env lua
local commander = require "commander"

commander.add_description = "Add numbers a and b and print the output"
commander.add_usage = "a b [--subtract, -s]"
function commander:add(a, b)
    if self.subtract or self.s then
        print(a - b)
        return
    end
    print(a + b)
end

commander:run()