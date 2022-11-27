
local bindings = require("bindings")
local map = require("lib.bindings").map

map(bindings.files.save_file, {
    n = ":w<Enter>",
    i = "<Esc><Esc>:w<Enter>a",
})
