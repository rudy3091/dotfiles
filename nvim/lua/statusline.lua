local M = {}

local dark = "#111111"
-- local primary = "#df6510"
local primary = "#df65f0"
local primary_input = "#df6510"
local primary_visual = "#dff510"
local secondary = "#af6510"
local white = "#e5e5e5"

local hl_table = {
  BufferNum = { fg = dark, bg = white },
  Filename = { fg = primary, bg = dark },
  ModifySign = { fg = secondary, bg = dark },
  LineNum = { fg = primary, bg = dark },
  LineMaxNum = { fg = primary, bg = dark },
  ColumnNum = { fg = secondary, bg = dark },
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
  vim.cmd("set statusline=")
  for _, item in ipairs(component_table) do
    local component = append_comp_label(item[1], item[2])
    set_statusline(component)
  end

  for key, val in pairs(hl_table) do
    set_hl(key, val)
  end
end

M.init_statusline()

