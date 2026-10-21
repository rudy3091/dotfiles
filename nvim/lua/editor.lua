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

-- Transparent background
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

vim.cmd([[
  " Color name (:help cterm-colors) or ANSI code
  let g:limelight_conceal_ctermfg = 'gray'
  let g:limelight_conceal_ctermfg = 240

  " Color name (:help gui-colors) or RGB color
  let g:limelight_conceal_guifg = 'DarkGray'
  let g:limelight_conceal_guifg = '#777777'

  " Default: 0.5
  let g:limelight_default_coefficient = 0.7

  " Highlighting priority (default: 10)
  "   Set it to -1 not to overrule hlsearch
  let g:limelight_priority = -1
]])

vim.cmd ([[
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
]])
vim.api.nvim_create_autocmd("User", {
  pattern = "GoyoEnter",
  callback = function()
    vim.cmd([[
      highlight WinSeparator guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
      highlight VertSplit    guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
      highlight NormalNC     guibg=NONE ctermbg=NONE
      highlight Normal       guibg=NONE ctermbg=NONE
      set fillchars+=vert:\ 
    ]])
  end,
})
vim.g.go_echo_command_info = 0
