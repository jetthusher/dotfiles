return function()
    local map = require("lib.bindings").map
    local bindings = require("bindings")
    local icons = require("lib.icons")
    local tree = require("nvim-tree")

    tree.setup({
        hijack_cursor = true,
        update_focused_file = {
            enable = true,
            update_cwd = false,
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
                error = icons.diagnostics.Error,
                warning = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
            },
        },
        renderer = {
            icons = {
                git_placement = "signcolumn",
            },
            add_trailing = true,
            highlight_git = true,
            highlight_opened_files = "none",
            indent_markers = {
                enable = true,
            },
        },
        open_on_tab = true,
        filters = {
            custom = {
                "^.git$",
            },
        },
    })

    --map(bindings.file_explorer.open_selected_file_in_vertical_split, "vsplit")
end
