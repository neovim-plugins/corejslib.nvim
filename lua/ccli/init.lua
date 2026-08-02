local M

vim.o.showmode = false

M = {
    setup = function ( options )
        require( "ccli/config" ).setup( options )

        require( "ccli/commands" ).setup()

        require( "ccli/client" ).setup()
    end,
}

return setmetatable( M, {
    __index = function( _, k )
        return require( "ccli.api" )[ k ]
    end,
} )
