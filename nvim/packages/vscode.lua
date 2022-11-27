return function()
    local vscode = require("vscode")
    local colours = require("vscode.colors")
    local apply_theme = require("core.colours").apply_theme

    vscode.setup({
        transparent = false,
        italic_comments = true,
        group_overrides = {
            TSConstant = { fg = colours.vcsBlue },
        }
    })


    apply_theme()
end
