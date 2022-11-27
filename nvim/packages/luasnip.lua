return function()
    local luasnip = require("luasnip")
    local types = require("luasnip.util.types")
    local bindings = require("bindings")
    local map = require("lib.bindings").map

    luasnip.config.setup({
        history = false,
        ext_opts = {
            [types.insertNode] = {
                passive = {
                    hl_group = "MatchParen",
                },
            },
            [types.exitNode] = {
                passive = {
                    hl_group = "DiffChange",
                }
            }
        }
    })

    for _, file in ipairs(vim.api.nvim_get_runtime_file("**/snippets/*.lua", true)) do
        vim.api.nvim_cmd({
            cmd = "source",
            args = { file },
        }, {})
    end

    map(bindings.code.completion.exit_snippet_mode, luasnip.unlink_current)
    map(bindings.code.completion.select_next_item_or_goto_next_snippet_node, {
        n = function() luasnip.jump(1) end
    })

    map(bindings.code.completion.select_previous_item_goto_previous_snippet_node, {
        n = function()
            luasnip.jump(-1)
        end
    })
end
