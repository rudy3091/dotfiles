-- Using 'romgrk/barbar.nvim'
-- 'ctrl + o' and 'ctrl + p' to navigate between buffers
-- '\ + q' to close current buffer
vim.cmd("nnoremap <silent> <C-o> <Cmd>BufferPrevious<CR>")
vim.cmd("nnoremap <silent> <C-p> <Cmd>BufferNext<CR>")
vim.cmd("nnoremap <leader>q :bd<CR>")

-- 'ctrl + q' to exit
vim.cmd("nnoremap <silent> <C-q> <Cmd>:q<CR>")
vim.cmd("nnoremap <silent> <C-q> <Cmd>:q<CR>")

-- 'ctrl + s' to save current buffer
vim.cmd("nnoremap <silent> <C-s> <Cmd>:w<CR>")
vim.cmd("inoremap <silent> <C-s> <C-o><Cmd>:w<CR>")
vim.cmd("vnoremap <silent> <C-s> <C-c><Cmd>:w<CR>")

-- 'esc' aliases
vim.cmd("imap jk <Esc>")
vim.cmd("imap kj <Esc>")

-- Switch panes with tab key
vim.cmd("nnoremap <TAB> <C-w>w")

-- 'ff' for Focus mode
vim.cmd("nnoremap <silent> ff <Cmd>Goyo<CR><Cmd>Limelight!!<CR>")

-- 'space + ff' for Prettier format
vim.cmd('nnoremap <silent> <Leader>ff <Cmd>Prettier<CR>')

-- 'space + df' for Telescope file finder
vim.cmd('nnoremap <silent> <Leader>df <Cmd>Telescope find_files<CR>')
