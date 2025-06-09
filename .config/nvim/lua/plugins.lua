local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
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
    "dstein64/vim-startuptime",

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
              auto_start = "shut-up", -- if you want to start COQ at startup
              -- shut_up = true
              -- Your COQ settings here
          }
        end,
        config = function()
            require("config.nvim-lspconfig")
        end,
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
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = function()
            require("config.flutter")
        end,
    },
    {
        "dart-lang/dart-vim-plugin"
    },
    {
        'mfussenegger/nvim-dap',
    },
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('nordic').setup({
                transparent = {
                    -- bg = true,
                    float = true,
                },
                bright_border = true,
                reduce_blue = true,
            })
        end
    },
    { 
        "sbdchd/neoformat",
    },
    { "wakatime/vim-wakatime", lazy = false },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        'echasnovski/mini.nvim',
        version = false,
        config =  function()
            require("config.mini")
        end,
    },
    {
	    "Pocco81/auto-save.nvim",
	    config = function()
	    	 require("auto-save").setup{}
	    end,
    },
    {
      "lervag/vimtex",
      lazy = false,     -- we don't want to lazy load VimTeX
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
