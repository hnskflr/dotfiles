local keymap = vim.keymap
local nvim_tree = require("nvim-tree")

nvim_tree.setup {

}

keymap.set("n", "<leader>t", require("nvim-tree.api").tree.toggle, {
    silent = true,
    desc = "toggle nvim-tree",
})
