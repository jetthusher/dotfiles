return function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
        ensure_installed = {
            "typescript",
            "javascript",
            "lua",
            "vim",
            "rust",
            "c",
            "cpp",
            "python",
            "go",
            "bash",
        },
        sync_install = false,
        highlight = {
            enable = true,
        },
    })
end
