local bindings = require("bindings")
local map = require("lib.bindings").map

vim.g.mapleader = bindings.core.leader
map(bindings.core.reload_file, ":source %<Enter>")
