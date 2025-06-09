-- require('nordic').load()
local colorscheme = "gruvbox"
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.o.background = "dark" -- or "light" for light mode
