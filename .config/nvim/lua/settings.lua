-- space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Arrow keys > hjkl fight me
vim.cmd([[
   set relativenumber
   autocmd VimEnter * map <Down> j
   autocmd VimEnter * map <Up> k
   autocmd VimEnter * NvimTreeOpen	  
]])

-- @options
local opt = vim.opt

-- spaces vs tabs (tabs better)
opt.expandtab = true -- Use spaces instead of tabs
opt.softtabstop = 4 -- Number of spaces tabs count for
opt.tabstop = 4 -- Number of spaces tabs count for
opt.shiftwidth = 4 -- Size of an indent

opt.path = table.concat({"**"}) -- Search in subdirectories
opt.background = "dark" -- Dark background
opt.backup = false -- Disable backup
opt.breakindent = true -- Wrap text with indent
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.cursorline = true -- Enable highlighting of the current line
opt.guicursor = "" -- Fat cursor (old vim style)
opt.history = 500 -- History size
opt.hlsearch = true -- Highlight search
opt.ignorecase = true -- Ignore case
opt.incsearch = true -- Show search matches
opt.laststatus = 2 -- Always display the status line
opt.magic = true -- Regular expressions
opt.showmatch = true -- Show matching brackets
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smarttab = true -- Insert indents automatically
opt.smartindent = true -- Insert indents automatically
opt.so = 7 -- Minimum number of screen lines to keep above and below the cursor
opt.timeoutlen = 500 -- Time to wait for a mapped sequence to complete (in milliseconds)
opt.title = true -- Set the terminal title
opt.ttimeout = true -- Enable timeout for key mappings
opt.ttimeoutlen = 10 -- Time to wait for a mapped sequence to complete (in milliseconds)
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true -- Enable persistent undo
opt.updatetime = 250 -- Save swap file and trigger CursorHold
opt.wildmenu = true -- Enable command-line completion mode
opt.wildmode = "full" -- Command-line completion mode
opt.wrap = true -- Wrap long lines
opt.writebackup = false -- Disable backup
opt.spelllang = {"en"} -- Spell check english
opt.grepprg = "rg --vimgrep" -- Use ripgrep for grepping
opt.termguicolors = true -- True color support
opt.iskeyword:append("-") -- Treat dash separated words as a word text object

vim.wo.number = true

-- Netrw config (file explorer)
vim.g.netrw_banner = 1
vim.g.netrw_liststyle = 4
vim.g.netrw_localrmdir = "rm -r"
vim.g.netrw_hide = 0

-- Highlight on yank
vim.api.nvim_create_autocmd(
    "TextYankPost",
    {
        callback = function()
            vim.highlight.on_yank()
        end
    }
)

-- @commands
function _G.abbreviate_or_noop(input, output)
    local cmdtype = vim.fn.getcmdtype()
    local cmdline = vim.fn.getcmdline()

    if cmdtype == ":" and cmdline == input then
        return output
    else
        return input
    end
end

function _G.cmd_alias(alias, cmd)
    vim.api.nvim_command(
        "cabbrev <expr> " .. alias .. " " .. "v:lua.abbreviate_or_noop('" .. alias .. "', '" .. cmd .. "')"
    )
end
