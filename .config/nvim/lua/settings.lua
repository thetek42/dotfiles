local opts = {
  backup         = false,
  clipboard      = 'unnamedplus',
  conceallevel   = 0,
  cursorline     = true,
  expandtab      = true,
  fileencoding   = 'utf-8',
  guifont        = 'Iosevka Nerd Font:h14',
  hidden         = true,
  hlsearch       = true,
  ignorecase     = true,
  mouse          = 'a',
  number         = true,
  numberwidth    = 4,
  pumheight      = 8,
  relativenumber = true,
  scrolloff      = 5,
  shiftwidth     = 4,
  showmode       = false,
  sidescrolloff  = 5,
  signcolumn     = 'yes',
  smartcase      = true,
  smartindent    = true,
  splitbelow     = true,
  splitright     = true,
  swapfile       = false,
  tabstop        = 4,
  termguicolors  = true,
  timeoutlen     = 500,
  undofile       = true,
  updatetime     = 300,
  wrap           = false,
  writebackup    = false,
}

for key, value in pairs(opts) do
  vim.o[key] = value
end

vim.cmd 'set whichwrap+=<,>,[,],h,l'
vim.cmd 'set completeopt=menu,menuone,noselect'
vim.cmd 'set shortmess+=c'



local neovide_opts = {
  cursor_animation_length = 0.03,
  cursor_trail_length     = 0.3,
}

for key, value in pairs(neovide_opts) do
  vim.g['neovide_' .. key] = value
end

