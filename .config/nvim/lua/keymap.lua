local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("i", "jj", "<Esc>", opts)
map("n", "<S-t>", ":NvimTreeToggle<CR>", opts)

-- tab操作
map("n", "<C-t>", ":tabnew<CR>", opts)
map("n", "<C-z>", ":tabclose<CR>", opts)
map("n", "<C-n>", ":tabnext<CR>", opts)
map("n", "<C-b>", ":tabprevious<CR>", opts)

