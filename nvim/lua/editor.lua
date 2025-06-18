-- Language settings
vim.cmd([[
set noswapfile
set langmenu=en_US.UTF-8
language message en_US.UTF-8
]])

-- Cursor appearance
vim.cmd([[
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
]])

vim.opt.guifont = "DejaVu_Sans_Mono_for_Powerline:h1"

vim.opt.completeopt = "menu,menuone,noselect"

-- Hides --insert-- under the status line
vim.opt.showmode = false

-- Delay to wait for next key in combo
vim.opt.timeoutlen = 200

-- Show line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Set tabs to have 2 spaces by default
vim.cmd("set tabstop=2 softtabstop=0 expandtab shiftwidth=0 smarttab")

-- Save edit history between sessions
vim.cmd("set undofile")
vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undodir")

-- Preview changes when 'search and replace'
vim.opt.inccommand = "nosplit"

-- Do not open same file in two different buffers
vim.opt.switchbuf = "useopen"

-- Keep first and last n lines between cursor and edge when scrolling
vim.opt.scrolloff = 5

vim.opt.wrap = false
vim.opt.mouse = "a"
