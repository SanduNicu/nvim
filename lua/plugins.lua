require "plugins-conf.coc"
require "plugins-conf.telescope"
require "plugins-conf.treesitter"
require "plugins-conf.gitsigns"
require "plugins-conf.nvim-tree"
require "plugins-conf.lualine"

require("bufferline").setup()
require("Comment").setup()

local fn = vim.fn
local cmd = vim.cmd

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- General
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "akinsho/bufferline.nvim"
  use "nvim-lualine/lualine.nvim"
  use "kyazdani42/nvim-tree.lua"
  use "tpope/vim-surround"
  use "tpope/vim-repeat"
  use {"neoclide/coc.nvim", branch = "release"}
  use "nvim-telescope/telescope.nvim"
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use "p00f/nvim-ts-rainbow"
  use "numToStr/Comment.nvim"
  use "L3MON4D3/LuaSnip"
  use "lewis6991/gitsigns.nvim"
  use "rafamadriz/friendly-snippets"
  use "famiu/bufdelete.nvim"
  use "tpope/vim-fugitive"

  -- colorscheme
  use "sainnhe/gruvbox-material"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

