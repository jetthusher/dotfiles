return function()
    local lsp = require("lspconfig")
    local root_pattern = require("lspconfig.util").root_pattern
    local schemastore = require("schemastore")
    local on_attach = require("core.lsp").on_attach
    local do_if_client_active = require("core.lsp").do_if_client_active
    local cmp_lsp = require("cmp_nvim_lsp")

    local default_lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = cmp_lsp.default_capabilities(default_lsp_capabilities)

    local servers = {
        -- Neovim
        "vimls",
        "sumneko_lua",

        -- Web stack
        "jsonls",
        "cssls",
        "denols",
        "tsserver",
        "eslint",

        -- Systems programming
        "rust_analyzer",
        "clangd",
    }

    local settings = {
        jsonls = {
            schemas = schemastore.json.schemas(),
            validate = { enable = true },
        },
        sumneko_lua = {
            Lua = {
                runtime = {
                    --[[
                    Tell the language server which version of
                    Lua you're using (most likely LuaJIT in the
                    case of Neovim)
                    --]]
                    version = "LuaJIT",
                },
                diagnostics = {
                    --[[
                    Get the language server to recognize the `vim`
                    global
                    --]]
                    globals = { "vim" },
                },
                workspace = {
                    --[[
                    Make the server aware of Neovim runtime files
                    --]]
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    --[[
                    Do not send telemetry data containing a
                    randomized but unique identifier
                    --]]
                    enable = false,
                },
            },
        },
    }

    local root_dir = {
        -- Make sure TSServer doesn't start except when opening npm projects
        -- Prefer using deonls
        tsserver = root_pattern("package.json"),
        -- Enhance default root pattern for Lua to add Neovim config directory
        sumneko_lua = root_pattern(".luarc.json", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", ".git", "deps.lua"),
    }

    local custom_on_attach = {
        denols = function(denols, bufnr)
            local client_found = do_if_client_active("tsserver", function()
                denols.stop(true)
            end)

            if client_found then return end
            return on_attach(denols, bufnr)
        end,
        tsserver = function(tsserver, bufnr)
            do_if_client_active("denols", function(denols)
                denols.stop(true)
            end)

            return on_attach(tsserver, bufnr)
        end
    }

    local single_file_support = {
        denols = true,
    }

    for _, server in ipairs(servers) do
        lsp[server].setup({
            single_file_support = single_file_support[server],
            on_attach = custom_on_attach[server] or on_attach,
            capabilities = capabilities,
            root_dir = root_dir[server],
            settings = settings[server],
        })
    end
end
