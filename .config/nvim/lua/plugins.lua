local plugins_cnf = {
    -- ui plugins
    "catppuccin",
    "gitsigns",
    
    -- text manipulation
    "prettier",
    "vim-surround",
    "vim-repeat",
    "mini-comment",
    "minipairs",
    "miniai",
    
    -- utils
    "hop",

    -- coding
    "vim-test",
    
    -- git plugins
    "vim-fugitive",
    "vim-gh-line",
    "gv-vim",
    
    -- file explorer
    "nvim-tree",
    "vim-vinegar",
    -- "telescope",
    
    -- syntax & lsp
    "treesitter",
    "lsp-zero"
}

local plugins = {}

for _, v in pairs(plugins_cnf) do
    local plugin = require("plugins." .. v)
    table.insert(plugins, plugin)
end

return plugins
