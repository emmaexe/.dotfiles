-- Options
vim.opt.number = true
vim.opt.relativenumber = false
if vim.fn.executable("/bin/zsh") == 1 then
    vim.opt.shell = "/bin/zsh"
else
    vim.opt.shell = "/bin/bash"
end

require("config.lazy")

-- Regular keymap
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { desc = "Copy to clipboard" })
vim.api.nvim_set_keymap("v", "<C-x>", '"+d', { desc = "Cut to clipboard" })
vim.api.nvim_set_keymap("v", "<C-v>", '"+p', { desc = "Paste from clipboard" })
vim.api.nvim_set_keymap("n", "<C-v>", '"+p', { desc = "Paste from clipboard" })

vim.api.nvim_set_keymap("n", "<leader>v", "<C-v>", { noremap = true, desc = "Enter block visual mode" })

vim.api.nvim_set_keymap("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })

vim.api.nvim_set_keymap("n", "<Tab>", ">>", { desc = "Indent the current line" })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<<", { desc = "Unindent the current line" })
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { desc = "Indent the selected lines" })
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { desc = "Unindent the selected lines" })

vim.api.nvim_set_keymap("n", "<leader>d", ":t.<CR>", { desc = "Duplicate line" })

vim.api.nvim_set_keymap("n", "<C-Up>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })
vim.api.nvim_set_keymap("n", "<C-Down>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
vim.api.nvim_set_keymap(
    "v",
    "<C-Up>",
    ":m '<-2<CR>gv=gv",
    { noremap = true, silent = true, desc = "Move selected lines up" }
)
vim.api.nvim_set_keymap(
    "v",
    "<C-Down>",
    ":m '>+1<CR>gv=gv",
    { noremap = true, silent = true, desc = "Move selected lines down" }
)

-- Custom commands
vim.api.nvim_create_user_command("Term", function()
    Snacks.terminal()
end, { desc = "Toggle the terminal" })
vim.api.nvim_create_user_command("Tree", "Neotree reveal=true toggle", { desc = "Toggle the file tree" })
vim.api.nvim_create_user_command("Find", "Telescope live_grep", { desc = "Search with telescope" })
vim.api.nvim_create_user_command("Format", function()
    vim.api.nvim_command("StripWhitespace")
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format the current buffer" })

-- Custom command keymap
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>Term<CR>", { desc = "Toggle Terminal" })
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>Tree<CR>", { desc = "Toggle File Explorer" })
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Find<CR>", { desc = "Telescope search" })
vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>vsplit | enew<CR>", { desc = "New File in Horizontal Split" })
vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>tabnew<CR>", { desc = "New File in New Tab" })
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>w")

-- Mark spaces and tabs
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "python",
        "javascript",
        "typescript",
        "lua",
        "json",
        "xml",
        "html",
        "css",
        "c",
        "cpp",
        "java",
        "rust",
        "go",
        "sh",
        "yaml",
        "toml",
    },
    callback = function()
        vim.opt_local.list = true
        vim.opt_local.listchars = { tab = "→ ", space = "·" }
    end,
})

-- Default tab settings and tab whitelist
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.api.nvim_create_autocmd("FileType", {
    pattern = "make",
    callback = function()
        vim.opt_local.expandtab = false
    end,
})
