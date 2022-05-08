local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
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
keymap("n", "<leader>w", ":Bdelete<CR>", opts)

-- Open in chrome
keymap("n", "<F12>", ":silent !open -a /Applications/Google\\ Chrome.app %", opts)

-- These commands will move the current buffer backwards or forwards in the bufferline
keymap("n", "<S-l>", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineMovePrev<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<TAB>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Keep yanked work in register after pasting
keymap("v", "p", '"_dP', opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope --
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

-- NvimTree --
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", {})
keymap("n", "<leader><S-e>", ":NvimTreeFindFile<CR>", {})

-- LSP
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>dl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
keymap("n", "<leader>ds", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<leader>di", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', opts)
keymap("n", "<leader>fo", ":Format<CR>", {})
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])

-- format on save
vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])

-- Troble
keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
keymap("n", "gr", "<cmd>Trouble lsp_references<cr>", opts)
