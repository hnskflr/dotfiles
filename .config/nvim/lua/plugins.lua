local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

local plugin_specs = {

    {
        "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
        lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
        dependencies = {
          { "ms-jpq/coq_nvim", branch = "coq" },
          { "ms-jpq/coq.artifacts", branch = "artifacts" },
          { 'ms-jpq/coq.thirdparty', branch = "3p" },
        },
        init = function()
          vim.g.coq_settings = {
              auto_start = true, -- if you want to start COQ at startup
              -- Your COQ settings here
          }
        end,
        config = function()
            require("config.nvim-lspconfig")
        end,
        opts = {
            servers = {
                dartls = {},
            },
        },
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
        "JoosepAlviste/palenightfall.nvim",
        config = function()
            require("config.palenightfall")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = ":TSUpdate",
        config = function()
            require("config.treesitter")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-symbols.nvim",
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require("config.telescope")
        end,
    },
    { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
    {
        "akinsho/bufferline.nvim",
        event = { "BufEnter" },
        config = function()
            require("config.bufferline")
        end,
    },
    { "Raimondi/delimitMate", event = "InsertEnter" },
    'numToStr/Comment.nvim',
    "stevearc/dressing.nvim",
    {
        "tpope/vim-fugitive",
        config = function()
            require("config.fugitive")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        keys = { "<leader>t" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("config.nvim-tree")
        end,
    },
    "nvim-lua/plenary.nvim",
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("config.toggleterm")
        end,
    },
    "nordtheme/vim",
    { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = true,
    }
}


local lazy_opts = {
    ui = {
        border = "rounded",
        title = "Plugin Manager",
        title_pos = "center",
    },
}
require("lazy").setup(plugin_specs, lazy_opts)
