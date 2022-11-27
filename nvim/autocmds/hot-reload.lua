local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd

create_augroup("PackerDependencyListChange", { clear = true })
create_autocmd("BufWritePost", {
    group = "PackerDependencyListChange",
    pattern = "**/nvim/deps.lua",
    callback = function()
        vim.cmd("source %")
        local status_ok, packer = pcall(require, "packer")
        if status_ok then
            packer.sync()
        end
    end,
})

create_augroup("NeovimConfigChange", { clear = true })
create_autocmd("BufWritePost", {
    group = "NeovimConfigChange",
    pattern = {
        "**/nvim/core/*.lua",
        "**/nvim/packages/*.lua",
        "**/nvim/snippets/*.lua",
        "**/nvim/autocmds/*.lua",
        "**/nvim/bindings.lua",
        "**/nvim/preferences.lua",
        "**/nvim/init.lua",
    },
    callback = function(event)
        -- Check if path to saved file ends with "bindings.lua",
        -- If so, need to reset the binding safeguard to prevent errors
        if event.file:sub(- #"bindings.lua") == "bindings.lua" then
            local bindings_map = require("lib.bindings").bindings_map
            for mode, _ in pairs(bindings_map) do
                bindings_map[mode] = {}
            end
        end

        vim.cmd("source %")
        local status_ok, packer = pcall(require, "packer")
        if status_ok then
            packer.compile()
        end
    end,
})
