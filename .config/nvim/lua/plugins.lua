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
        "hrsh7th/nvim-cmp",
        -- event = 'InsertEnter',
        event = "VeryLazy",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "onsails/lspkind-nvim",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-omni",
            "hrsh7th/cmp-emoji",
            "quangnguyen30192/cmp-nvim-ultisnips",
        },
        config = function()
            require("config.nvim-cmp")
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufRead", "BufNewFile" },
        config = function()
            require("config.lsp")
        end,
    },

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
        cmd = "Telescope",
        dependencies = {
            "nvim-telescope/telescope-symbols.nvim",
        },
    },

    { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },

    {
        "akinsho/bufferline.nvim",
        event = { "BufEnter" },
        cond = firenvim_not_active,
        config = function()
            require("config.bufferline")
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        config = function()
            require("config.indent-blankline")
        end,
    },

    {
        "tyru/open-browser.vim",
        event = "VeryLazy",
    },

    { "Raimondi/delimitMate", event = "InsertEnter" },

    { "tpope/vim-commentary", event = "VeryLazy" },

    { "stevearc/dressing.nvim" },

    {
        "tpope/vim-fugitive",
        event = "User InGitRepo",
        config = function()
            require("config.fugitive")
        end,
    },

    { "preservim/vim-markdown", ft = { "markdown" } },

    {
        "iamcco/markdown-preview.nvim",
        -- build = "cd app && npm install",
        ft = { "markdown" },
        build = ":call mkdp#util#install()",
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
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-telescope/telescope-symbols.nvim",
        },
        config = function() 
            require("config.telescope")
        end,
    },
}


local lazy_opts = {
    ui = {
        border = "rounded",
        title = "Plugin Manager",
        title_pos = "center",
    },
}
require("lazy").setup(plugin_specs, lazy_opts)
