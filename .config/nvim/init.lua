-- @variables
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- abstraction YAY
local plugins = require "plugins"
require "settings"
require "keymaps"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath
        }
    )
end

vim.opt.rtp:prepend(lazypath)

-- @plugins
require("lazy").setup(plugins)

-- Custom file types
vim.filetype.add(
    {
        extension = {
            eslintrc = "json",
            mdx = "markdown",
            prettierrc = "json",
            mjml = "html"
        },
        pattern = {
            [".*%.env.*"] = "sh"
        }
    }
)

-- @auto-commands
-- Run Eslint automatically on certain filetypes
vim.api.nvim_create_autocmd(
    {"BufWritePost"},
    {
        pattern = "*.{js,ts,jsx,tsx}",
        callback = function()
            if vim.fn.exists(":EslintFixAll") > 0 then
                -- @TODO we need to wait for eslint to finish and save the file
                vim.cmd("EslintFixAll")
                return
            end
        end
    }
)