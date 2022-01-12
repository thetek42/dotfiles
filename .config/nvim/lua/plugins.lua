local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
end


return require 'packer'.startup(function(use)

  use 'wbthomason/packer.nvim'

  -- color schemes
  use 'tiagovla/tokyodark.nvim'
  use 'projekt0n/github-nvim-theme'
  use 'catppuccin/nvim'

  -- tree sitter
  use 'nvim-treesitter/nvim-treesitter'

  -- bars
  use 'nvim-lualine/lualine.nvim'

  -- lsp and autocomplete
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'rafamadriz/friendly-snippets'
  use 'onsails/lspkind-nvim'

  -- other useful or cool stuff
  use 'junegunn/vim-easy-align'
  use 'jiangmiao/auto-pairs'
  use 'alvan/vim-closetag'
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'
  use 'yamatsum/nvim-nonicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'zah/nim.vim'
  use 'ollykel/v-vim'
  use 'vim-crystal/vim-crystal'
  use 'vim-latex/vim-latex'
  use 'elkowar/yuck.vim'

  use '/mnt/data/code/vim/vim-blueprint-syntax'
  use '/mnt/data/code/vim/vim-tlang-syntax'


  if packer_bootstrap then
    require('packer').sync()
  end

end)

