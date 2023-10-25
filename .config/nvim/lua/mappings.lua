local keymap = vim.keymap
local api = vim.api
local uv = vim.loop

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- Shortcut for faster save and quit
keymap.set("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc = "save buffer" })

-- Saves the file if modified and quit
keymap.set("n", "<leader>q", "<cmd>wq<cr>", { silent = true, desc = "quit current window" })

keymap.set("n", "<leader><Tab>", "<cmd>BufferLineCycleNext<cr>")
keymap.set("n", "<leader><S-Tab>", "<cmd>BufferLineCyclePrev<cr>")

-- tab cycle between options
-- keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
-- keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- confirm selection with enter
keymap.set("i", "<enter>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- show coc
keymap.set("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})
