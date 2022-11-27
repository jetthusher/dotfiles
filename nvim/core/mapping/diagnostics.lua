local bindings = require("bindings")
local map = require("lib.bindings").map

map(bindings.diagnostics.open_float, vim.diagnostic.open_float)
map(bindings.diagnostics.open_panel, vim.diagnostic.setloclist)
map(bindings.diagnostics.goto_next_error, vim.diagnostic.goto_next)
map(bindings.diagnostics.goto_previous_error, vim.diagnostic.goto_prev)
