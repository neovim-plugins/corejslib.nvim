local M

vim.o.showmode = false

M = {
    setup = function ( options )
        require( "zcli/config" ).setup( options )

        require( "zcli/commands" ).setup()

        require( "zcli/client" ).setup()
    end,
}

return setmetatable( M, {
    __index = function( _, k )
        return require( "zcli.api" )[ k ]
    end,
} )
