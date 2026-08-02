local api = require( "ccli/api" )
local utils = require( "ccli/utils" )
local M

local function execute ( input )

    if not input.fargs[ 1 ] then
        utils.echoe( "Command is required" )

    -- lint
    elseif input.fargs[ 1 ] == "lint" then
        api.lint( input.fargs[ 2 ] )

    -- browser
    elseif input.fargs[ 1 ] == "browser" then
        api.browser()

    -- invalid command
    else
        utils.echoe( "Command is not valid: " .. input.fargs[ 1 ] )
    end
end

local function complete ( ... )
end

M = {
    setup = function ()
        vim.api.nvim_create_user_command( "Ccli", execute, {
            nargs = "*",
            complete = complete,
            desc = "ccli LSP",
        } )
    end,
}

return M
