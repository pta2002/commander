local commander = require "commander"
commander.default_description = "Print all arguments"
commander.default_usage = "arg..."
function commander:default(...)
    print("Called with parameters:")
    for i,a in ipairs({...}) do
        print(a)
    end
end

commander:run()