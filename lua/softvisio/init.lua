local M

vim.o.showmode = false

M = {
    setup = function ( options )
        require( "corejslib/config" ).setup( options )

        require( "corejslib/commands" ).setup()

        require( "corejslib/client" ).setup()
    end,
}

return setmetatable( M, {
    __index = function( _, k )
        return require( "corejslib.api" )[ k ]
    end,
} )
