return function()
    local autopairs = require("nvim-autopairs")

    autopairs.setup({
        check_ts = true,
        map_c_h = true,
        map_c_w = true,
    })

    local Rule = require("nvim-autopairs.rule")

    -- Insert first space evenly inside brackets
    autopairs.add_rules({
        Rule(' ', ' ')
            :with_pair(function (opts)
                local pair = opts.line:sub(opts.col - 1, opts.col)
                return vim.tbl_contains({ '()', '[]', '{}' }, pair)
            end),
        Rule('( ', ' )')
            :with_pair(function() return false end)
            :with_move(function(opts)
                return opts.prev_char:match('.%)') ~= nil
            end)
            :use_key(')'),
        Rule('{ ', ' }')
            :with_pair(function() return false end)
            :with_move(function(opts)
                return opts.prev_char:match('.%}') ~= nil
            end)
            :use_key('}'),
        Rule('[ ', ' ]')
            :with_pair(function() return false end)
            :with_move(function(opts)
                return opts.prev_char:match('.%]') ~= nil
            end)
            :use_key(']')
    })
end
