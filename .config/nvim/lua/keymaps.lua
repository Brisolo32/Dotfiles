local map = vim.keymap.set
local user_cmd = vim.api.nvim_create_user_command

-- @keymaps
-- black hole
map("n", "<leader>dd", '"_dd')
-- remove highlight
map("n", "<Esc><Esc>", ":noh<cr>")
-- navigate fast between paragraphs
map("n", "<down>", "}")
map("n", "<up>", "{")
-- quit
map("n", "<leader>q", ":bd<cr>")
-- reload current buffer
map("n", "<leader>r", ":e %<cr>")
-- format buffer
map("n", "<leader>f", ":Format<cr>")
-- save
map("n", "<leader>w", ":w<cr>")
-- fast search
map("n", "<C-space>", "/")
-- file explorer
map("n", "<leader>-", ":Explore<cr>")
-- replace word under cursor
map("n", "<C-n>", ":%s#<c-r><c-w>##g<left><left>")
map("v", "<C-n>", ":s#<c-r><c-w>##g<left><left>")
-- diagnostic
map("n", "<leader>d", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
-- nvim-tree
map("n", "<leader>t", ":NvimTreeOpen<cr>:echo \"Focused on nvim-tree\"<cr>")

-- copy current buffer absolute path into clipboard
user_cmd(
    "CopyCurrentPath",
    function()
        local path = vim.fn.expand("%:p")
        vim.fn.setreg("+", path)
        vim.notify('Copied "' .. path .. '" to the clipboard!')
    end,
    {}
)
map("n", "<leader>y", ":CopyCurrentPath<cr>")
