-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    Packer_bootstrap = vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    })
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

return packer.startup({
    function(use)
        use("lewis6991/impatient.nvim")
        use("wbthomason/packer.nvim")
        use("editorconfig/editorconfig-vim")
        use({
            "phaazon/hop.nvim",
            branch = "v2",
            config = require("packages.hop")
        })

        use({
            "nvim-treesitter/nvim-treesitter",
            config = require("packages.treesitter"),
            run = function()
                require("nvim-treesitter.install").update({ with_sync = true })
            end,
        })

        use({
            "neovim/nvim-lspconfig",
            config = require("packages.lspconfig"),
            requires = {
                "b0o/schemastore.nvim",
                "hrsh7th/cmp-nvim-lsp",
            }
        })

        use({
            "hrsh7th/nvim-cmp",
            config = require("packages.cmp"),
            requires = {
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
                "hrsh7th/cmp-nvim-lsp-signature-help",
                "hrsh7th/cmp-nvim-lsp-document-symbol",
                "saadparwaiz1/cmp_luasnip",
            }
        })

        use({
            "L3MON4D3/LuaSnip",
            config = require("packages.luasnip"),
        })

        use({
            "windwp/nvim-autopairs",
            config = require("packages.autopairs")
        })

        use({
            "kylechui/nvim-surround",
            config = require("packages.surround")
        })

        use({
            "Mofiqul/vscode.nvim",
            config = require("packages.vscode"),
            run = require("core.colours").apply_theme,
        })

        --use("carriga/nvim-notify")
        --use("windwp/nvim-ts-autotag")
        --use("jose-elias-alvarez/null-ls.nvim")
        --use("nvim-treesitter/nvim-treesitter-textobjects")
        --use("nvim-treesitter/nvim-treesitter-refactor")
        --use("norcalli/nvim-colorizer.lua")
        --use("RRethy/vim-illuminate")
        --use("b3nj5m1n/kommentary")
        --use("kevinhwang91/nvim-bqf")

        use({
            "kyazdani42/nvim-tree.lua",
            config = require("packages.tree"),
            requires = {
                {
                    "kyazdani42/nvim-web-devicons",
                    config = require("packages.web-devicons"),
                },
            },
        })

        if Packer_bootstrap then
            packer.sync()
        end
    end,
    config = {
        max_jobs = 16
    }
})
