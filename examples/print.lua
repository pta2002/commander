local commander = require "commander"
function commander:default(...)
    print("Called with parameters:")
    for i,a in ipairs({...}) do
        print(a)
    end
end

commander:run()