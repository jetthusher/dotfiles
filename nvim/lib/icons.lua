local M = {}

-- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-codicons-to-the-menu
M.lsp = {
    Text = " ",
    Method = " ",
    Function = " ",
    Constructor = " ",
    Field = " ",
    Variable = " ",
    Class = " ",
    Interface = " ",
    Module = " ",
    Property = " ",
    Unit = " ",
    Value = " ",
    Enum = " ",
    Keyword = " ",
    Snippet = " ",
    Color = " ",
    File = " ",
    Reference = " ",
    Folder = " ",
    EnumMember = " ",
    Constant = " ",
    Struct = " ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
}

M.diagnostics = {
    Error = "",
    Warn = "",
    Info = "",
    Hint = "",
}

return M
