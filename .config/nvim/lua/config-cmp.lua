local cmp     = require 'cmp'
local lspkind = require 'lspkind'



lspkind.init {
  with_text = false,
  symbol_map = {
    Text          = ' ',
    Method        = ' ',
    Function      = ' ',
    Constructor   = ' ',
    Field         = '識',
    Variable      = ' ',
    Class         = 'ﴰ ',
    Interface     = ' ',
    Module        = ' ',
    Property      = '識',
    Unit          = '塞',
    Value         = ' ',
    Enum          = '料',
    Keyword       = ' ',
    Snippet       = ' ',
    Color         = ' ',
    File          = ' ',
    Reference     = '艹',
    Folder        = ' ',
    EnumMember    = '料',
    Constant      = ' ',
    Struct        = 'פּ ',
    Event         = ' ',
    Operator      = ' ',
    TypeParameter = 'ﯿ ',
  }
}



cmp.setup {
  snippet = {
    expand = function (args)
      vim.fn['vsnip#anonymous'](args.body)
    end
  },
  mapping = {
    ['<C-b>']     = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>']     = cmp.mapping(cmp.mapping.scroll_docs( 4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(),      { 'i', 'c' }),
    ['<C-y>']     = cmp.config.disable,
    ['<C-e>']     = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
    ['<CR>']      = cmp.mapping.confirm { select = false },
    ['<Tab>']     = cmp.mapping.confirm { select = true  },
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip'    },
  }, {
    { name = 'buffer'   }
  }),
  formatting = {
    format = lspkind.cmp_format { with_text = false },
  }
}



vim.cmd 'hi! link CmpItemKindText          String'
vim.cmd 'hi! link CmpItemKindMethod        Function'
vim.cmd 'hi! link CmpItemKindFunction      Function'
vim.cmd 'hi! link CmpItemKindConstructor   Type'
vim.cmd 'hi! link CmpItemKindField         Tag'
vim.cmd 'hi! link CmpItemKindVariable      Tag'
vim.cmd 'hi! link CmpItemKindClass         StorageClass'
vim.cmd 'hi! link CmpItemKindInterface     StorageClass'
vim.cmd 'hi! link CmpItemKindModule        StorageClass'
vim.cmd 'hi! link CmpItemKindProperty      Tag'
vim.cmd 'hi! link CmpItemKindUnit          Tag'
vim.cmd 'hi! link CmpItemKindValue         Tag'
vim.cmd 'hi! link CmpItemKindEnum          StorageClass'
vim.cmd 'hi! link CmpItemKindKeyword       Keyword'
vim.cmd 'hi! link CmpItemKindSnippet       String'
vim.cmd 'hi! link CmpItemKindColor         Number'
vim.cmd 'hi! link CmpItemKindFile          Number'
vim.cmd 'hi! link CmpItemKindReference     Tag'
vim.cmd 'hi! link CmpItemKindFolder        Number'
vim.cmd 'hi! link CmpItemKindEnumMember    Tag'
vim.cmd 'hi! link CmpItemKindConstant      Tag'
vim.cmd 'hi! link CmpItemKindStruct        Structure'
vim.cmd 'hi! link CmpItemKindEvent         Function'
vim.cmd 'hi! link CmpItemKindOperator      Operator'
vim.cmd 'hi! link CmpItemKindTypeParameter Type'

