-- disable this stupid comment continuation
vim.cmd 'autocmd BufNewFile,BufRead,BufWinEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o'

-- disable this stupid folding stuff
vim.cmd 'autocmd BufNewFile,BufRead,BufWinEnter * setlocal nofoldenable'

-- crystal fix
vim.cmd 'autocmd BufNewFile,BufRead,BufWinEnter *.cr setlocal ts=2 sw=2 et'
vim.cmd 'autocmd BufNewFile,BufRead,BufWinEnter *.cr setfiletype ruby'

