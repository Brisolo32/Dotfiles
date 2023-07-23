local map = vim.keymap.set

return {
    "VonHeikemen/lsp-zero.nvim",
    event = "VeryLazy",
    dependencies = {
        -- LSP Support
        {"neovim/nvim-lspconfig", event = "VeryLazy"},
        -- LSP servers manager
        {"williamboman/mason.nvim", config = true, event = "VeryLazy"},
        {"williamboman/mason-lspconfig.nvim", event = "VeryLazy"},
        -- Autocompletion
        {"hrsh7th/nvim-cmp", event = "VeryLazy"},
        {"hrsh7th/cmp-buffer", event = "VeryLazy"},
        {"hrsh7th/cmp-path", event = "VeryLazy"},
        {"hrsh7th/cmp-nvim-lsp", event = "VeryLazy"},
        {"hrsh7th/cmp-nvim-lua", event = "VeryLazy"},
        -- UI
        {"j-hui/fidget.nvim", config = true, event = "VeryLazy", tag = "legacy"},
        -- Snippet engine
        {"saadparwaiz1/cmp_luasnip", event = "VeryLazy"},
        {"L3MON4D3/LuaSnip", event = "VeryLazy"}
    },
    config = function()
        -- Lsp
        local lsp = require("lsp-zero")
        lsp.preset("recommended")

        -- disable defaults mappings
        lsp.set_preferences(
            {
                set_lsp_keymaps = false
            }
        )

        -- lsp servers based on: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
        lsp.ensure_installed(
            {
                -- web
                "html",
                "tsserver",
                "cssls",
                "tailwindcss",
                "stylelint_lsp",
                "eslint",
                "marksman",
                "astro",
                -- "svelte_language_server",
                "vls",
                "rust_analyzer",
                -- devops/infrastructure
                "bashls"
                -- "sumneko_lua",
            }
        )

        local cmp = require("cmp")

        local cmp_select = {behavior = cmp.SelectBehavior.Select}

        cmp.setup({
            snippet = {
                expand = function(args)
                    -- Sets up luasnip as the default snippet engine
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = {
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<cr>"] = cmp.mapping.confirm({select = true})
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "luasnip" }
            }, {
                { name = "buffer" }
            })
        })

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        -- https://github.com/neovim/nvim-lspconfig
        lsp.on_attach(
            function(_, bufnr)
                map("n", "gI", vim.lsp.buf.implementation, {desc = "[G]oto [I]mplementation"})
                map("n", "<leader>rn", vim.lsp.buf.rename, {desc = "[R]e[n]ame"})
                map("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "[C]ode [A]ction"})
                map("n", "<leader>f", vim.lsp.buf.format, {desc = "[F]ormat current buffer"})
                map("n", "<leader>h", vim.lsp.buf.hover, {desc = "[H]over"})

                -- Create a command `:Format` local to the LSP buffer
                vim.api.nvim_buf_create_user_command(
                    bufnr,
                    "Format",
                    function(_)
                        if vim.lsp.buf.format then
                            vim.lsp.buf.format()
                        elseif vim.lsp.buf.formatting then
                            vim.lsp.buf.formatting()
                        end
                    end,
                    {desc = "Format current buffer with LSP"}
                )
            end
        )

        lsp.nvim_workspace()
        lsp.setup()
    end
}
