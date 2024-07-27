-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   comma = "tabdo wincmd =",
-- })

-- lost to history where this came form or why its here.....
-- vim.cmd('set runtimepath^=~/.vim runtimepath+=~/.vim/after') vim.o.packpath = vim.o.runtimepath vim.cmd('source ~/.vimrc')

-- this actually sources our old vimrc.
vim.cmd('source ~/vim.vim')

--Uncomment below if you get deprecation warnings in nvim that can't be fixed. 
--vim.deprecate = function() end


