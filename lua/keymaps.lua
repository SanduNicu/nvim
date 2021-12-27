local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Disable Ctrl z
keymap("n", "<C-z>", "", opts)

-- Disable search highlight on enter
keymap("n", "<leader><CR>", ":noh<cr>", opts)

-- Buffers
keymap("n", "<leader>w", ":bd<CR>", opts)

-- Open in chrome
keymap("n", "<F12>", ":silent !open -a /Applications/Google\\ Chrome.app %", opts)

-- These commands will move the current buffer backwards or forwards in the bufferline
keymap("n", "<C-l>", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<C-h>", ":BufferLineMovePrev<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Keep yanked work in register after pasting
keymap("v", "p", '"_dP', opts)

-- Visual Block --

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope --
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader><S-f>", "<cmd>Telescope live_grep<cr>", opts)
--keymap("n", "<leader><S-f>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)

-- NvimTree --
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", {})

