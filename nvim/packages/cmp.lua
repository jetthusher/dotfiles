return function()
    local icons = require("lib.icons").lsp
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local completion = require("bindings").code.completion
    if cmp == nil then return end

    local mapping = {
        [completion.select_next_item_or_goto_next_snippet_node.key] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                --fallback()
            end
        end, completion.select_next_item_or_goto_next_snippet_node.modes),
        [completion.scroll_docs_up.key] = cmp.mapping.scroll_docs(-4),
        [completion.scroll_docs_down.key] = cmp.mapping.scroll_docs(4),
        [completion.toggle_completion_popup.key] = cmp.mapping(function()
            if not cmp.visible() then
                cmp.complete()
            else
                cmp.close()
            end
        end, completion.toggle_completion_popup.modes),
        [completion.close_completion_popup.key] = cmp.mapping.close(),
        [completion.abort_completion.key] = cmp.mapping.abort(),
        [completion.complete_or_expand_snippet.key] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({ select = true })
            elseif luasnip.expandable() then
                luasnip.expand()
            else
                fallback()
            end
        end, { "i", "s" }),
    }

    for _, binding in ipairs(completion.select_previous_item_goto_previous_snippet_node) do
        mapping[binding.key] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                --fallback()
            end
        end, binding.modes)
    end

    cmp.setup({
        experimental = {
            ghost_text = false,
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        },
        completion = {
            completeopt = "menu,menuone"
        },
        window = {
            completion = {
                border = "rounded",
                side_padding = 1,
                winhighlight = "Normal:LspFloatWinNormal,FloatBorder:LspFloatWinBorder,CursorLine:PmenuSel,Search:None",
            },
            documentation = {
                border = "rounded",
                side_padding = 1,
                winhighlight = "Normal:LspFloatWinNormal,FloatBorder:LspFloatWinBorder,CursorLine:PmenuSel,Search:None",
            },
        },
        preselect = cmp.PreselectMode.None,
        mapping = mapping,
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                vim_item.kind = icons[vim_item.kind] or ""
                vim_item.menu = ({
                    luasnip = "[Snip]",
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[NVIM]",
                    buffer = "[Buffer]",
                    path = "[Path]",
                    cmdline = "[CMD]",
                    nvim_lsp_document_symbol = "[Symbol]",
                    nvim_lsp_signature_help = "[Sig]",
                })[entry.source.name] or entry.source.name

                return vim_item
            end
        },
        sources = {
            { name = "luasnip", priority = 9999, max_item_count = 1, },
            { name = "nvim_lua" },
            { name = "nvim_lsp" },
            { name = "nvim_lsp_signature_help" },
            {
                name = "buffer",
                option = {
                    get_bufnrs = function()
                        return vim.api.nvim_list_bufs()
                    end,
                },
            },
            { name = "path" },
        },
    })

    local cmdline_completeopt = "menu,menuone,noselect,noinsert"
    cmp.setup.cmdline("/", {
        completion = {
            completeopt = cmdline_completeopt,
        },
        sources = cmp.config.sources({
            { name = "nvim_lsp_document_symbol" }
        }, {
            { name = "buffer" },
        }),
        mapping = cmp.mapping.preset.cmdline(),
    })

    cmp.setup.cmdline(":", {
        completion = {
            completeopt = cmdline_completeopt,
        },
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
        mapping = cmp.mapping.preset.cmdline(),
    })
end
