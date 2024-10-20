local keymap = vim.keymap
local api = vim.api
local uv = vim.loop

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- Shortcut for faster save and quit
keymap.set("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc = "save buffer" })

-- Saves the file if modified and quit
keymap.set("n", "<leader>w", "<cmd>wq<cr>", { silent = true, desc = "quit current window" })

-- quit
keymap.set("n", "<leader>q", "<cmd>wq<cr>", { silent = true, desc = "quit current window" })

----------
-- Tabs --
-- Cycle Bufferline Tabs
keymap.set("n", "<leader><Tab>", "<cmd>BufferLineCycleNext<cr>")
keymap.set("n", "<leader><S-Tab>", "<cmd>BufferLineCyclePrev<cr>")


---------------
-- telecsope --
keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<Leader>fb", "<cmd>Telescope buffers<cr>")

----------------
-- toggleterm --
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ 
    cmd = "lazygit",
    hidden = true,
    direction = "float"
})


-------------
-- lazygit --
function _lazygit_toggle()
  lazygit:toggle()
end

keymap.set("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
