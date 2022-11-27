local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local function node(number, hint)
    return i(number, "", {
        node_ext_opts = {
            active = {
                virt_text = {{ hint, "NonText" }}
            }
        }
    })
end

local js = {
    s("od", fmt("const {{ {} }} = {}", {
        i(2, "properties"),
        i(1, "object"),
    })),
    s("ad", fmt("const [ {} ] = {}", {
        node(2, "items"),
        node(1, "array"),
    })),
    s("af", fmt("({}) => ", {
        node(1, "arguments")
    })),
    s("afb", fmt("({}) => {{\n\t{}\n}}", {
        node(1, "arguments"),
        i(0)
    }))
}

ls.add_snippets("javascript", js)
ls.add_snippets("typescript", js)
