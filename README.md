# commander.lua
An easy to use lua command line argument parsing library.

## Usage
```lua
local commander = require "commander"

-- This function will run when called with no parameters
commander.default_description = "Print all arguments"
commander.default_usage = "arg..."
function commander:default(...)
    for i,v in ipairs({...}) do
        print(v)
    end
end

commander.add_usage = "a b [--subtract, -s]"
commander.add_description = "Add a and b, or subtract if the subtract flag is set"
function commander:add(a, b)
    if self.subtract or self.s then
        print(a - b)
    else
        print(a + b)
    end
end

commander:run()
```

```bash
$ lua print.lua a b c
a
b
c

$ lua print.lua add 1 2
3.0

$ lua print.lua add 1 2 --subtract
-1.0

$ lua print.lua add 1 2 -s
-1.0

$ lua print.lua help
Usage:
    print.lua arg...
        Print all arguments
    print.lua add a b [--subtract, -s]
        Add a and b, or subtract if the subtract flag is set
    print.lua help
        Show this text
```

# LICENSE
Licensed under the MIT license. See `LICENSE` for the full text.