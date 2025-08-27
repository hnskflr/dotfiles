local fn = vim.fn
local api = vim.api

vim.g.mapleader = " "

vim.g.vim_markdown_math = 1

vim.g.latexindent_opt = "-m"

local options = {
    termguicolors = true
}

vim.diagnostic.config({
    virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
