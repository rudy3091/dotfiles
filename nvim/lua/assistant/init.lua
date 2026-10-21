vim.api.nvim_create_user_command('FocusMode', function()
  -- vim.api.nvim_open_win(0, true, {
  --   relative = 'editor',
  --   width = math.floor(vim.o.columns * 0.6),
  --   height = math.floor(vim.o.lines * 0.8),
  --   row = math.floor(vim.o.lines * 0.1),
  --   col = math.floor(vim.o.columns * 0.2),
  --   style = 'minimal',
  --   border = 'rounded',
  -- })
  vim.api.nvim_open_win(0, false,
    {relative='win', width=40, height=4, bufpos={100,10}})
  local mark = vim.api.nvim_buf_get_mark(0, '<')
  print(mark[1], mark[2])
end, {})

vim.cmd("nnoremap <silent> <Leader>k :FocusMode<CR>")
