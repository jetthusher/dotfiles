local icons = require("lib.icons")

vim.diagnostic.config({
    virtual_text = {
        source = "always",
        prefix = "●",
        severity = {
            min = vim.diagnostic.severity.ERROR,
        },
    },
    signs = true,
    underline = true,
    severity_sort = true,
    update_in_insert = false,
    float = {
        border = "rounded",
        focusable = false,
        source = "always",
        header = "",
        prefix = "",
    },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    focusable = false,
    max_width = 80,
})

for type, icon in pairs(icons.diagnostics) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = hl,
    })
end
