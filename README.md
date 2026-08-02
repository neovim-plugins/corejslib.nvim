# `ccli.nvim`

`@corejslib/cli` LSP server integration for `Neovim`.

## Requirements

1. `@corejslib/cli` `npm` package, installed globally.

Add registry for `@corejslib` namespace to your `.npmrc`:

```
@corejslib:registry = https://npm.pkg.github.com/
```

Install `@corejslib/cli`:

```sh
npm install --global @corejslib/cli
```

## Setup

```lua
return {
    {
        "neovim-plugins/ccli.nvim",
        tag = "latest",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        cmd = "S",
        keys = {
            {
                "<Leader>sd",
                "<CMD>S lint lint<CR>",
                mode = { "n", "i", "v", "s" },
                desc = "Lint buffer",
            },
            {
                "<Leader>sf",
                "<CMD>S lint format<CR>",
                mode = { "n", "i", "v", "s" },
                desc = "Lint buffer using default rules",
            },
            {
                "<Leader>sc",
                "<CMD>S lint compress<CR>",
                mode = { "n", "i", "v", "s" },
                desc = "Compress buffer",
            },
            {
                "<Leader>so",
                "<CMD>S lint obfuscate<CR>",
                mode = { "n", "i", "v", "s" },
                desc = "Obfuscate buffer",
            },
        },
        config = function ()
            require( "ccli" ).setup( {
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
