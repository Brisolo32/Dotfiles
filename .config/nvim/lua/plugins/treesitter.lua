return {
    "nvim-treesitter/nvim-treesitter",
    cmd = "TSUpdate",
    event = "VeryLazy",
    config = function()
        require("nvim-treesitter.configs").setup(
            {
                ensure_installed = {
                    "html",
                    "javascript",
                    "typescript",
                    "json",
                    "lua",
                    "bash",
                    "markdown"
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false
                }
            }
        )
    end
}