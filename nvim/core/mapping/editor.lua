local bindings = require("bindings")
local map = require("lib.bindings").map

map(bindings.editor.exit_insert, "<Esc>")
map(bindings.editor.paste_after_cursor_insert_mode, "<Esc><Esc>pa", {
    recurvise = true,
})
