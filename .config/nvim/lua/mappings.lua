local keymap = vim.keymap
local api = vim.api
local uv = vim.loop

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

-- Shortcut for faster save and quit
keymap.set("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc = "save buffer" })

-- quit
keymap.set("n", "<leader>q", "<cmd>bd<cr>", { silent = true, desc = "close tab" })

----------
-- Tabs --
keymap.set("n", "<leader><Tab>", "<cmd>tabnext<cr>")
keymap.set("n", "<leader><S-Tab>", "<cmd>tabprevious<cr>")


---------------
-- telecsope --
keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<Leader>fb", "<cmd>Telescope buffers<cr>")

----------------
-- netrw --
keymap.set("n", "<Leader>t", "<cmd>Lexplore<cr>")
-- keymap.set("n", "<Leader>t", "<cmd>Lexplore %:p:h<cr>") -- netrw in current path

----------------
-- lsp --
keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")

keymap.set("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")

----------------
-- sessions --
-- keymap.set("n", "<Leader>ss", function()
--     local path = vim.fn.expand('%:p')
--     local n = string.find(string.reverse(path), "/")
--     path = string.sub(path, 0, string.len(path) - n)
--     vim.cmd("mksession! /home/hannes/.config/nvim/sessions" .. path .. ".vim")
-- end)
