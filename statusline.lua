local M = {}

local bg_color = "#111111"
local primary = "#df6510"
local secondary = "#af6510"
local white = "#e5e5e5"

local hl_table = {
  BufferNum = { fg = bg_color, bg = white },
  Filename = { fg = bg_color, bg = primary },
  ModifySign = { fg = secondary, bg = bg_color },
  LineNum = { fg = primary, bg = bg_color },
  LineMaxNum = { fg = primary, bg = bg_color },
  ColumnNum = { fg = secondary, bg = bg_color },
}

local function set_hl(group, color)
  vim.cmd(string.format("autocmd ColorScheme * hi %s guifg=%s guibg=%s",
    group, color.fg, color.bg))
end

local component_table = {
  { "BufferNum", "\\ %n\\ " },
  { "Filename", "\\ %<%F\\ " },
  { "ModifySign", "%m" },
  { "LineNum", "%=%5l" },
  { "LineMaxNum", "\\ /\\ %L" },
  { "ColumnNum", "%5v\\ " },
}

local function append_comp_label(name, str)
  return "%#" .. name .. "#" .. str .. "%*"
end

local function set_statusline(cmd)
  vim.cmd(string.format("set statusline +=%s", cmd))
end

M.init_statusline = function ()
  -- print("filename: " .. vim.api.nvim_eval("expand('%:p')"))
  -- print(vim.api.nvim_eval("mode()"))

  vim.cmd("set statusline=")
  for _, item in ipairs(component_table) do
    local component = append_comp_label(item[1], item[2])
    set_statusline(component)
  end

  for key, val in pairs(hl_table) do
    set_hl(key, val)
  end
end

return M
