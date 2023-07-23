local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePost"
local async = event == "BufWritePost"

return {
    "MunifTanjim/prettier.nvim",
    dependencies = {
        {
            "jose-elias-alvarez/null-ls.nvim",
            dependencies = {
                { "nvim-lua/plenary.nvim" }
            },
            config = function()
                require("null-ls").setup(
                    {
                        on_attach = function(client, bufnr)
                            if client.supports_method("textDocument/formatting") then
                                vim.keymap.set(
                                    "n",
                                    "<Leader>f",
                                    function()
                                        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
                                    end,
                                    { buffer = bufnr, desc = "[lsp] format" }
                                )

                                -- format on save
                                vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
                                vim.api.nvim_create_autocmd(
                                    event,
                                    {
                                        buffer = bufnr,
                                        group = group,
                                        callback = function()
                                            vim.lsp.buf.format({ bufnr = bufnr, async = async })
                                        end,
                                        desc = "[lsp] format on save"
                                    }
                                )
                            end

                            if client.supports_method("textDocument/rangeFormatting") then
                                vim.keymap.set(
                                    "x",
                                    "<Leader>f",
                                    function()
                                        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
                                    end,
                                    { buffer = bufnr, desc = "[lsp] format" }
                                )
                            end
                        end
                    }
                )
            end
        },
        { "neovim/nvim-lspconfig", event = "VeryLazy" },
    },
    config = function()
        require("prettier").setup(
            {
                bin = "prettierd", -- or `'prettierd'` (v0.23.3+)
                filetypes = {
                    "css",
                    "graphql",
                    "html",
                    "javascript",
                    "javascriptreact",
                    "json",
                    "less",
                    "markdown",
                    "scss",
                    "typescript",
                    "typescriptreact",
                    "svelte",
                    "yaml",
                },
                cli_options = {
                    tab_width = 4,
                    use_tabs = false,
                    semi = true,
                    single_quote = true,
                    bracket_spacing = true,
                    bracket_sameline = false,
                    arrow_parens = "always",
                    config_precedence = "prefer-file"
                }
            }
        )
    end
}

