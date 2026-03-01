local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local plugin_specs = {
    {
        "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
        lazy = false,            -- REQUIRED: tell lazy.nvim to start this plugin at startup
        dependencies = {
            { "ms-jpq/coq_nvim",       branch = "coq" },
            { "ms-jpq/coq.artifacts",  branch = "artifacts" },
            { 'ms-jpq/coq.thirdparty', branch = "3p" },
        },
        init = function()
            vim.g.coq_settings = {
                auto_start = "shut-up", -- if you want to start COQ at startup
            }
        end,
        config = function()
            require("config.nvim-lspconfig")
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },

    -- {
    --     "nvim-treesitter/nvim-treesitter",
    --     event = "VeryLazy",
    --     build = ":TSUpdate",
    --     config = function()
    --         require("config.treesitter")
    --     end,
    -- },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require("config.mini")
        end,
    },
    { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
    -- {
    --     'akinsho/flutter-tools.nvim',
    --     lazy = false,
    --     dependencies = {
    --         'nvim-lua/plenary.nvim',
    --         -- 'folke/snacks.nvim', -- optional for vim.ui.select
    --         'stevearc/dressing.nvim',
    --     },
    --     config = function()
    --         require("config.flutter")
    --     end,
    -- },
    { "dart-lang/dart-vim-plugin" },
    { 'mfussenegger/nvim-dap', },
    {
        'stevearc/conform.nvim',
        opts = {},
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        config = function()
            require("config.conform")
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    -- {
    --     "Pocco81/auto-save.nvim",
    --     ft = { "c" },
    --     config = function()
    --         require("auto-save").setup {}
    --     end,
    -- },
    {
        "lervag/vimtex",
        lazy = true, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            require("config.vimtex")
        end,
    },
    {
        "vimwiki/vimwiki",
        init = function()
            require("config.vimwiki")
        end,
    },
    {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
            -- add options here
            -- or leave it empty to use the default settings
        },
        keys = {
            -- suggested keymap
            { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
        },
    },

    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = true,
        opts = {
            transparent_mode = false,
        },
    }
}


local lazy_opts = {
    ui = {
        border = "solid",
        title = "Plugin Manager",
        title_pos = "center",
    },
}
require("lazy").setup(plugin_specs, lazy_opts)
