# `zcli.nvim`

`@softvisio/zcli` LSP server integration for `Neovim`.

## Requirements

1. `@softvisio/zcli` `npm` package, installed globally.

Add registry for `@corejslib` namespace to your `.npmrc`:

```
@corejslib:registry = https://npm.pkg.github.com/
```

Install `@softvisio/zcli`:

```sh
npm install --global @softvisio/zcli
```

## Setup

```lua
return {
    {
        "neovim-plugins/zcli.nvim",
        tag = "latest",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        cmd = "Zcli",
        keys = {
            {
                "<Leader>sd",
                "<CMD>Zcli lint lint<CR>",
                mode = { "n", "i", "v", "s" },
                desc = "Lint buffer",
            },
            {
                "<Leader>sf",
                "<CMD>Zcli lint format<CR>",
                mode = { "n", "i", "v", "s" },
                desc = "Lint buffer using default rules",
            },
            {
                "<Leader>sc",
                "<CMD>Zcli lint compress<CR>",
                mode = { "n", "i", "v", "s" },
                desc = "Compress buffer",
            },
            {
                "<Leader>so",
                "<CMD>Zcli lint obfuscate<CR>",
                mode = { "n", "i", "v", "s" },
                desc = "Obfuscate buffer",
            },
        },
        config = function ()
            require( "zcli" ).setup( {
                hostname = "127.0.0.1",
                port = 55556,
                auto_attach = false,
                timeout = 60000,
                ignored_filetypes = {
                    "DiffviewFileHistory",
                    "DiffviewFiles",
                    "gitgraph",
                    "help",
                    "man",
                    "TelescopePrompt",
                },
            } )
        end
    }
}
```
