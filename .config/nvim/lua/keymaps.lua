local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }


vim.g.mapleader = ' '


-- NORMAL

-- better window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- vem tabline stuff
map('n', '<leader>p', '<Plug>vem_move_buffer_left-',  {})
map('n', '<leader>n', '<Plug>vem_move_buffer_right-', {})
map('n', '<leader>h', '<Plug>vem_prev_buffer-',       {})
map('n', '<leader>l', '<Plug>vem_next_buffer-',       {})
map('n', '<leader>d', '<Plug>vem_delete_buffer-',     {})

-- resize with arrows
map('n', '<C-Up>',    ':resize -2<CR>',          opts)
map('n', '<C-Down>',  ':resize +2<CR>',          opts)
map('n', '<C-Left>',  ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- move text up and down
map('n', '<A-j>', '<Esc>:m .+1<CR>==', opts)
map('n', '<A-k>', '<Esc>:m .-2<CR>==', opts)


-- VISUAL

-- stay in indent mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- move text up and down
map('v', '<A-j>', ':m .+1<CR>==', opts)
map('v', '<A-k>', ':m .-2<CR>==', opts)


-- VISUAL BLOCK

-- move text up and down
map('x', '<A-j>', ':move \'>+1<CR>gv-gv', opts)
map('x', '<A-k>', ':move \'<-2<CR>gv-gv', opts)


-- TERMINAL

-- better terminal integration
map('t', '<C-h>', '<C-\\><C-N><C-w>h', opts)
map('t', '<C-j>', '<C-\\><C-N><C-w>j', opts)
map('t', '<C-k>', '<C-\\><C-N><C-w>k', opts)
map('t', '<C-l>', '<C-\\><C-N><C-w>l', opts)


-- COMMAND

-- menu navigation
map('c', '<C-j>', 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true })
map('c', '<C-k>', 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true })

