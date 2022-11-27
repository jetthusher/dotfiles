local prefs = require("preferences")
local bindings = require("bindings")
local map = require("lib.bindings").map

-- Keep next/prev search item at the center of the screen if desired
if prefs.behaviour.search.center_results then
    map(bindings.reserved.search.next_item, "nzz")
    map(bindings.reserved.search.previous_item, "Nzz")
    --map(bindings.diagnostics.goto_next_error)
end

-- Enable Home/End of line for insert as in command mode
map(bindings.editor.tweaks.goto_beginning_of_line, "<Home>")
map(bindings.editor.tweaks.goto_end_of_line, "<End>")

-- Better pasting
map(bindings.reserved.editor.paste_before_cursor, "p=`]`]")
map(bindings.reserved.editor.paste_after_cursor, "P=`]`]")

-- Make 'X' in normal mode respect 'softtabstop'
map(bindings.reserved.editor.delete_character_before_cursor.normal, {
    n = "<Insert><Backspace><Esc><Esc>",
})

-- Make Backspace work in Select mode
map(bindings.reserved.editor.delete_character_before_cursor.insert, {
    s = "i<BS>"
})
