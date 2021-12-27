require "options"
require "keymaps"
require "plugins"
require "colorscheme"
require "coc"
require "telescope"
require "treesitter"
require "gitsigns-conf"

require'nvim-tree'.setup()
require('lualine').setup{options = { theme = 'gruvbox'}}
require("bufferline").setup()
