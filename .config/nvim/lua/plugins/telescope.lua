return {
    "nvim-telescope/telescope.nvim",
    keys = {
        {"<C-f>", ":Telescope find_files<cr>", desc = "Find files"},
        {"<C-p>", ":Telescope commands<cr>", desc = "Commands"},
        {"<C-e>", ":Telescope grep_string<cr>", desc = "Grep String"},
        {"<leader>fb", ":Telescope buffers<cr>", desc = "[F]ind [B]uffers"},
        {"<leader>fd", ":Telescope diagnostics<cr>", desc = "[F]ind [D]iagnostics"},
        {"<leader>ff", ":Telescope git_status<cr>", desc = "[F]ind [F]iles Git Status"},
        {"<leader>fh", ":Telescope oldfiles<cr>", desc = "[F]ind [H]istory"},
        {"<leader>fg", ":Telescope live_grep<cr>", desc = "[F]ind [G]rep"},
        {"<leader>fr", ":Telescope registers<cr>", desc = "[Find] [R]egisters"},
        {"<leader>fk", ":Telescope keymaps<cr>", desc = "[Find] [K]eymaps"},
        {"<leader>fm", ":Telescope marks<cr>", desc = "[Find] [M]arks"},
        {"gd", ":Telescope lsp_definitions<cr>", desc = "Go to Definition"},
        {"gr", ":Telescope lsp_references<cr>", desc = "Go to References"}
    },
    dependencies = {{"nvim-lua/plenary.nvim", lazy = true}},
    config = function()
        require("telescope").setup(
            {
                defaults = {
                    file_ignore_patterns = {
                        ".git"
                    }
                },
                pickers = {
                    find_files = {
                        follow = true,
                        hidden = true
                    }
                },
                extensions = {
                    file_browser = {
                        theme = "ivy",
                        mappings = {
                            ["i"] = {},
                            ["n"] = {}
                        }
                    }
                }
            }
        )
    end
}