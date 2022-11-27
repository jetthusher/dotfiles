return function()
    local hop = require("hop")
    local bindings = require("bindings")
    local map = require("lib.bindings").map
    map(bindings.editor.jump_to_char, hop.hint_char1)

    hop.setup({
        multi_windows = true,
    })
end
