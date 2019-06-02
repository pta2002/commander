local commander = {}

commander.run_command = false
function commander:run(arguments, program)
    arguments = arguments or arg
    program = program or arg[0]
    local args = {}
    local command
    local stoppedParsing = false

    for i,argument in ipairs(arguments) do
        if string.sub(argument, 1, 1) ~= "-" or stoppedParsing then
            if not command then
                command = argument
            else
                table.insert(args, argument)
            end
        else
            if string.sub(argument, 1, 2) == "--" then
                if argument == "--" then
                    stoppedParsing = true
                else
                    self[string.sub(argument, 3)] = true
                end
            else
                self[string.sub(argument, 2)] = true
            end
        end
    end

    self.program = program
    if not command then
        self:default(command, unpack(args))
        return
    end

    local cmd_function = self[command]
    if type(cmd_function) == "function" and self[command .. "_command"] ~= false then
        cmd_function(self, unpack(args))
    else
        if self.default == self.help then
            print("Command " .. command .. " not found.")
        end
        self:default(command, unpack(args))
    end
end

commander.help_description = "Show this text"
function commander:help(...)
    if self.help_text then print(self.help_text .. "\n") end
    print("Usage:")
    for k,v in pairs(self) do
        if type(v) == "function" and self[k .. "_command"] ~= false then
            local calling = self.program .. " " .. k
            if self[k .. "_usage"] then
                calling = calling .. " " .. self[k .. "_usage"]
            end

            print("    ".. calling)
            if self[k .. "_description"] then
                print("        " .. self[k .. "_description"])
            end
        end
    end
end
commander.default = commander.help

return commander