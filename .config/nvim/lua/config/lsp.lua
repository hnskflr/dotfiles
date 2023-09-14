local lsp = vim.lsp
local api = vim.api
local diagnostic = vim.diagnostic

local custom_attach = function(client, bufnr)
    local map = function(mode, l, r, opts)
        opts = opts or {}
        opts.silent = true
        opts.buffer = bufnr
        keymap.set(mode, l, r, opts)
    end

    api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local float_opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = "rounded",
                source = "always", -- show source in diagnostic popup window
                prefix = " ",
            }

            if not vim.b.diagnostics_pos then
                vim.b.diagnostics_pos = { nil, nil }
            end

            local cursor_pos = api.nvim_win_get_cursor(0)
            if (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
                and #diagnostic.get() > 0
                then
                    diagnostic.open_float(nil, float_opts)
                end

                vim.b.diagnostics_pos = cursor_pos
            end,
        })

        -- The blow command will highlight the current variable and its usages in the buffer.
        if client.server_capabilities.documentHighlightProvider then
            vim.cmd([[
            hi! link LspReferenceRead Visual
            hi! link LspReferenceText Visual
            hi! link LspReferenceWrite Visual
            ]])

            local gid = api.nvim_create_augroup("lsp_document_highlight", { clear = true })
            api.nvim_create_autocmd("CursorHold" , {
                group = gid,
                buffer = bufnr,
                callback = function ()
                    lsp.buf.document_highlight()
                end
            })

            api.nvim_create_autocmd("CursorMoved" , {
                group = gid,
                buffer = bufnr,
                callback = function ()
                    lsp.buf.clear_references()
                end
            })
        end

        if vim.g.logging_level == "debug" then
            local msg = string.format("Language server %s started!", client.name)
            vim.notify(msg, vim.log.levels.DEBUG, { title = "Nvim-config" })
        end
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require("lspconfig")

    lspconfig.pyright.setup {
        on_attach = custom_attach,
        capabilities = capabilities
    }
    lspconfig.dartls.setup {
        on_attach = custom_attach,
        capabilities = capabilities
    }


    -- global config for diagnostic
    diagnostic.config {
        underline = false,
        virtual_text = false,
        signs = true,
        severity_sort = true,
    }

    lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })
