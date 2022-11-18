-- This file is loaded by './init.lua'

local fn = vim.fn

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
  -- Only required if you have packer configured as `opt`
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Packer could not be loaded from 'packer.lua'")
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

-- List of custom plugins
return packer.startup(function(use)
  -- Useful management plugins
  use 'wbthomason/packer.nvim'                 -- Have packer manage itself
  use "nvim-lua/popup.nvim"                    -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"                  -- Useful lua functions used ny lots of plugins
  use "williamboman/mason.nvim"                -- Plugin to install LSP servers, debuggers and similar

  -- Personal plugins

  use {'nvim-telescope/telescope.nvim',        -- Extendable fuzzy finder over lists 
        tag = '0.1.0',
        requires = {'nvim-lua/plenary.nvim'}}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }  -- Better syntax highlighting and stuff
  use {'nvim-tree/nvim-tree.lua',              -- Tree-like side file explorer
        requires = {'nvim-tree/nvim-web-devicons'}, -- optional, for file icons
        tag = 'nightly'} -- optional, updated every week. 
  use {'jdhao/better-escape.vim',              -- Remove lag when escaping with JK
        event = 'InsertEnter'}  
  use 'numToStr/Comment.nvim'                  -- Easily comment lines and blocks
  use 'nvim-lualine/lualine.nvim'              -- Fancy statusbar at the bottom
  use 'goolord/alpha-nvim'                     -- Start screen

  -- Colorschemes
  use 'Shatur/neovim-ayu' 
  use 'folke/tokyonight.nvim'                  -- Tokyonight theme
  use {"catppuccin/nvim", as = "catppuccin"}   -- Catppuccin theme 

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

