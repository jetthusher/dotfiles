local bindings = require("bindings")
local map = require("lib.bindings").map

map(bindings.search.clear_highlight, {
    n = ":noh<Enter>",
    i = "<Esc><Esc>:noh<Enter>"
})
