local api = vim.api

local exclude_ft = { "help", "git", "markdown", "snippets", "text", "gitconfig", "alpha" }
require("indent_blankline").setup {
    show_end_of_line = true,
    disable_with_nolist = true,
    buftype_exclude = { "terminal" },
    filetype_exclude = exclude_ft,
}

local gid = api.nvim_create_augroup("indent_blankline", { clear = true })
api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    group = gid,
    command = "IndentBlanklineDisable",
})

api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    group = gid,
    callback = function()
        if not vim.tbl_contains(exclude_ft, vim.bo.filetype) then
            vim.cmd([[IndentBlanklineEnable]])
        end
    end,
})
