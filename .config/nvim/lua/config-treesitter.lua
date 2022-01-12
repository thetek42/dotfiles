require 'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  sync_install     = false,
  ignore_install   = { 'markdown' },

  highlight = {
    enable                            = true,
    disable                           = { },
    additional_vim_regex_highlighting = false,
  },
}

