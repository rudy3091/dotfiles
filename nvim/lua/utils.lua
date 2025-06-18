local M = {
  load_module = function (name)
    local ok, _ = pcall(require, name)
    if not ok then
      print "Failed to load '" .. name .. ".lua'."
    end
  end
}

return M
