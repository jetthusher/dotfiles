local navigation = require("bindings").code.navigation
local refactoring = require("bindings").code.refactoring
local lsp_workspace_folders = require("bindings").code.lsp_workspace_folders
local map = require("lib.bindings").map

local M = {}

function M.do_if_client_active(client_name, callback)
    local active_clients = vim.lsp.get_active_clients()
    for _, active_client in ipairs(active_clients) do
        if active_client.name == client_name then
            callback(active_client)
            return true
        end
    end
    return false
end

function M.on_attach(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local lsp = vim.lsp.buf
    local opts = { buffer = bufnr }
    map(navigation.goto_declaration, lsp.declaration, opts)
    map(navigation.goto_definition, lsp.definition, opts)
    map(navigation.goto_type_definition, lsp.type_definition, opts)
    map(navigation.goto_implementation, lsp.implementation, opts)
    map(navigation.goto_references, lsp.references, opts)
    map(navigation.hover, lsp.hover, opts)
    map(navigation.show_signature, lsp.signature_help, opts)

    map(lsp_workspace_folders.add, lsp.add_workspace_folder, opts)
    map(lsp_workspace_folders.remove, lsp.remove_workspace_folder, opts)
    map(lsp_workspace_folders.list, function()
        print(vim.inspect(lsp.list_workspace_folders()))
    end, opts)

    map(refactoring.rename_symbol, lsp.rename, opts)
    map(refactoring.show_code_actions, lsp.code_action, opts)
    map(refactoring.format_whole_file, function()
        lsp.format({ async = true })
    end, opts)

    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup('lsp_document_highlight', {
            clear = false
        })

        vim.api.nvim_clear_autocmds({
            buffer = bufnr,
            group = 'lsp_document_highlight',
        })

        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd('CursorMoved', {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

return M
