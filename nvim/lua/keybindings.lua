-- Using 'romgrk/barbar.nvim'
-- 'ctrl + o' and 'ctrl + p' to navigate between buffers
-- '\ + q' to close current buffer
vim.cmd("nnoremap <silent> <C-o> <Cmd>BufferPrevious<CR>")
vim.cmd("nnoremap <silent> <C-p> <Cmd>BufferNext<CR>")
vim.cmd("nnoremap <leader>q :bd<CR>")
vim.cmd("nnoremap <leader>Q :bd!<CR>")

-- 'ctrl + q' to exit
vim.cmd("nnoremap <silent> <C-q> <Cmd>:q<CR>")

-- 'ctrl + s' to save current buffer
vim.cmd("nnoremap <silent> <C-s> <Cmd>:w<CR>")
vim.cmd("inoremap <silent> <C-s> <C-o><Cmd>:w<CR>")
vim.cmd("vnoremap <silent> <C-s> <C-c><Cmd>:w<CR>")

-- 'cmd + c' to copy to system clipboard
vim.opt.clipboard = "unnamedplus"

-- 'esc' aliases
vim.cmd("imap jk <Esc>")
vim.cmd("imap kj <Esc>")

-- Switch panes with tab key
vim.cmd("nnoremap <TAB> <C-w>w")
vim.cmd("nnoremap <S-TAB> <C-w>W")

-- 'ff' for Focus mode
vim.cmd("nnoremap <silent> ff <Cmd>Goyo<CR><Cmd>highlight Normal guibg=none<CR>")

-- 'space + ff' for Prettier format
vim.cmd("nnoremap <silent> <Leader>ff <Cmd>Prettier<CR>")

-- 'space + df' for Telescope file finder
vim.cmd("nnoremap <silent> <Leader>df <Cmd>Telescope find_files<CR>")

-- 'space + tt' to open builtin-shell
vim.cmd("nnoremap <silent> <Leader>ts <Cmd>:sp<CR><C-w>w<Cmd>:terminal<CR>A")
vim.cmd("nnoremap <silent> <Leader>tv <Cmd>:vs<CR><C-w>w<Cmd>:terminal<CR>A")
vim.cmd("nnoremap <silent> <Leader>tt <Cmd>:terminal<CR>A")
vim.cmd("tnoremap <silent> <Leader>tq <C-\\><C-n>")

-- typescript-specific goToSourceDefinition
vim.cmd("nnoremap <silent> <C-k><C-k> <Cmd>:CocCommand tsserver.goToSourceDefinition<CR>")
