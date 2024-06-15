-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   comma = "tabdo wincmd =",
-- })
vim.cmd('set runtimepath^=~/.vim runtimepath+=~/.vim/after') vim.o.packpath = vim.o.runtimepath vim.cmd('source ~/.vimrc')
vim.cmd('source ~/vim.vim')

vim.deprecate = function() end


