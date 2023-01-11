local colorscheme = "tokyonight-night"
-- local colorscheme = "aurora"
-- local colorscheme = "darkplus"
-- local colorscheme = "codemonkey"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
