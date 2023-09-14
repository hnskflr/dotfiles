local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup {
    sources = {
        { name = "nvim_lsp" }, -- For nvim-lsp
        { name = "ultisnips" }, -- For ultisnips user.
        { name = "path" }, -- for path completion
        { name = "buffer", keyword_length = 2 }, -- for buffer word completion
        { name = "emoji", insert = true }, -- emoji completion
    },
    completion = {
        keyword_length = 1,
        completeopt = "menu,noselect",
    },
    view = {
        entries = "custom",
    },
    formatting = {
        format = lspkind.cmp_format {
            mode = "symbol_text",
            menu = {
                nvim_lsp = "[LSP]",
                ultisnips = "[US]",
                nvim_lua = "[Lua]",
                path = "[Path]",
                buffer = "[Buffer]",
                emoji = "[Emoji]",
                omni = "[Omni]",
            },
        },
    },
}

cmp.setup.filetype("tex", {
  sources = {
    { name = "omni" },
    { name = "ultisnips" }, -- For ultisnips user.
    { name = "buffer", keyword_length = 2 }, -- for buffer word completion
    { name = "path" }, -- for path completion
  },
})

vim.cmd([[
    highlight! link CmpItemMenu Comment
    " gray
    highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
    " blue
    highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
    highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
    " light blue
    highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
    highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
    highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
    " pink
    highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
    highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
    " front
    highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
    highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
    highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
]])
