local colorscheme = "gruvbox"
vim.o.background = "dark"
vim.cmd [[hi normal guibg=NONE ctermbg=NONE]]

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

