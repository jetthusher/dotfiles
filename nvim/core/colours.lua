local prefs = require("preferences")
local opt = vim.opt

local M = {}

function M.apply_theme()
    opt.background = prefs.appearance.variant
    pcall(vim.cmd, "colorscheme " .. prefs.appearance.theme)

    -- Make completion sources subdued
    vim.cmd([[
        highlight clear CmpItemMenu
        highlight link CmpItemMenu NonText
    ]])
end

-- Make sure languages get highlighted in markdown
vim.g.markdown_fenced_languages = {
    "ts=typescript",
    "js=javascript",
}

return M
