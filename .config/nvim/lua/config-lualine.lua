local colors = {
  bg     = '#11121d',
  bg1    = '#1a1b2a',
  bg2    = '#212234',
  fg     = '#a0a8cd',
  grey   = '#444b6a',
  red    = '#ee6d85',
  orange = '#f6955b',
  yellow = '#d7a65f',
  green  = '#95c561',
  blue   = '#7199ee',
  purple = '#a485dd',
}

require 'lualine'.setup {
  options = {
    theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.bg    },
        c = { fg = colors.fg, bg = colors.bg    },
      },
      insert  = { a = { fg = colors.bg, bg = colors.blue,   gui = 'bold' } },
      visual  = { a = { fg = colors.bg, bg = colors.purple, gui = 'bold' } },
      replace = { a = { fg = colors.bg, bg = colors.orange, gui = 'bold' } },
      command = { a = { fg = colors.bg, bg = colors.red,    gui = 'bold' } },
      inactive = {
        a = { fg = colors.fg, bg = colors.bg1 }
      },
    },
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {{ 'mode', separator = { left = ' ', right = ' ' } }},
    lualine_b = { 'filename' },
    lualine_c = { },
    lualine_x = { },
    lualine_y = { 'progress' },
    lualine_z = {{ 'location', separator = { left = ' ', right = ' ' } }},
  },
  inactive_sections = {
    lualine_a = {{ 'filename', separator = { left = ' ', right = ' ' } }},
    lualine_b = { },
    lualine_c = { },
    lualine_x = { },
    lualine_y = { },
    lualine_z = {{ 'location', separator = { left = ' ', right = ' ' } }},
  },
  tabline = { },
  extensions = { },
}

