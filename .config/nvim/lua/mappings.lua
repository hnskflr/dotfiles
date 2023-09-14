local keymap = vim.keymap
local api = vim.api
local uv = vim.loop

-- Shortcut for faster save and quit
keymap.set("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc = "save buffer" })

-- Saves the file if modified and quit
keymap.set("n", "<leader>q", "<cmd>wq<cr>", { silent = true, desc = "quit current window" })
