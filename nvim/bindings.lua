local bindlib = require("lib.bindings")
local bind = bindlib.bind
local bind_all = bindlib.bind_all
local force_bind = bindlib.force_bind

local M = {
    reserved = {},
    core = {},
    windows = {},
    search = {},
    editor = {},
    diagnostics = {},
    code = {},
    files = {},
    file_explorer = {},
}

M.reserved = {
    editor = {
        miscellaneous = {
            increment_number_under_cursor = bind("<C-a>"),
            decrement_number_under_cursor = bind("<C-x>"),
        },
        movement = {
            move_cursor_up = bind("k", { "n", "v" }),
            move_cursor_down = bind("j", { "n", "v" }),
            move_cursor_left = bind("h", { "n", "v" }),
            move_cursor_right = bind("l", { "n", "v" }),
            move_cursor_half_screen_up = bind("<C-u>", { "n", "v" }),
            move_cursor_half_screen_down = bind("<C-d>", { "n", "v" }),
            move_cursor_full_screen_up = bind("<C-b>", { "n", "v" }),
            move_cursor_full_screen_down = bind("<C-f>", { "n", "v" }),
            scroll_view_up = bind("<C-y>", { "n", "v" }),
            scroll_view_down = bind("<C-e>", { "n", "v" }),
            goto_previous_cursor_position = bind("<C-o>"),
            goto_next_cursor_position = bind_all({ "<C-i>", "<Tab>" }),
            goto_character_in_line_forwards = bind("f", { "n", "v" }),
            goto_character_in_line_backwards = bind("F", { "n", "v" }),
            goto_next_matched_character_in_line = bind(";", { "n", "v" }),
            goto_previous_matched_character_in_line = bind(",", { "n", "v" }),
        },
        insert_mode_before_cursor = bind("i"),
        insert_mode_after_cursor = bind("a"),
        insert_at_beginning_of_line = bind("I", { "n", "v" }),
        insert_at_end_of_line = bind("A", { "n", "v" }),
        delete_character_after_cursor = bind("x", { "n", "v" }),
        delete_character_before_cursor = {
            normal = bind("X", { "n", "v" }),
            insert = bind({ "<BS>", "<C-h>" }, { "i" }),
        },
        change_in_motion = bind("c", { "n", "v" }),
        change_all_after_cursor = bind("C", { "n", "v" }),
        delete_in_motion = bind("d", { "n", "v" }),
        delete_all_after_cursor = bind("D", { "n", "v" }),
        delete_character_under_cursor_and_enter_insert_mode = bind("s", { "n", "v" }),
        clear_line_and_enter_insert_mode = bind("S", { "n", "v" }),
        replace_character_under_cursor = bind("r", { "n", "v" }),
        replace_mode = bind("R", { "n", "v" }),
        copy_in_motion = bind("y"),
        paste_after_cursor = bind("P"),
        paste_before_cursor = bind("p"),
    },
    search = {
        next_item = bind("n", { "n", "v" }),
        previous_item = bind("N", { "n", "v" }),
    },
}

M.core = {
    leader = "k",
    reload_file = bind("<Leader>r"),
}

M.windows = {
    switch_to_left_window_or_tmux_pane = bind("<C-h>"),
    switch_to_right_window_or_tmux_pane = bind("<C-l>"),
    switch_to_top_window_or_tmux_pane = bind("<C-k>"),
    switch_to_bottom_window_or_tmux_pane = bind("<C-j>"),
    close_focused_window = bind("<C-c>"),
    split_window_vertically = bind("<Bar>"),
    split_window_horizontally = bind("-"),
}

M.search = {
    clear_highlight = bind("<Leader>n"),
}

M.editor = {
    exit_insert = bind_all({ "<Leader>j", "KJ" }, "i"),
    jump_to_char = bind("<Leader>f"),
    paste_after_cursor_insert_mode = bind("<C-v>", "i"),
    tweaks = {
        goto_beginning_of_line = bind("<C-b>", "i"),
        goto_end_of_line = bind("<C-e>", "i")
    },
}

M.diagnostics = {
    open_float = bind("<Space>e"),
    open_panel = bind("<Space>p"),
    goto_previous_error = bind("[d"),
    goto_next_error = bind("]d"),
}

M.code = {
    navigation = {
        goto_declaration = bind("gD"),
        goto_definition = bind("gd"),
        goto_type_definition = bind("<Space>D"),
        goto_implementation = bind("gi"),
        goto_references = bind("gr"),
        hover = bind("K"),
        show_signature = bind("<Space>s"),
    },
    completion = {
        toggle_completion_popup = bind("<C-Space>", { "i", "s" }),
        close_completion_popup = bind("<C-c>", { "i", "s" }),
        select_next_item_or_goto_next_snippet_node = bind("<C-n>", { "i", "n", "s" }),
        select_previous_item_goto_previous_snippet_node = bind_all({ "<C-p>", "<S-Tab>" }, { "i", "n", "s" }),
        scroll_docs_down = bind("<C-f>", { "i", "s" }),
        scroll_docs_up = force_bind("<C-b>", { "i", "s" }),
        complete_or_expand_snippet = bind("<Tab>", { "i", "s" }),
        abort_completion = bind("<C-a>", { "i", "s" }),
        exit_snippet_mode = bind("<M-c>", { "i", "n", "s" }),
    },
    refactoring = {
        format_whole_file = bind("Q"),
        rename_symbol = bind("<Space>rn"),
        show_code_actions = bind("<Space>ca"),
    },
    lsp_workspace_folders = {
        add = bind("<Space>wa"),
        remove = bind("<Space>wr"),
        list = bind("<Space>wl"),
    },
}

M.files = {
    save_file = bind("<C-s>", { "i", "n" }),
}

-- TODO: write bindings in full `:help nvim-tree-mappings`
M.file_explorer = {
    open_selected_file = force_bind({ "o", "<CR>" }),
    open_selected_file_in_vertical_split = force_bind("<Bar>"),
    open_selected_file_in_horizontal_split = force_bind("-"),
    close_parent_directory = force_bind({ "<BS>", "<C-h>" }),
}

return M
