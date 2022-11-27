local opt = vim.opt

-- CORE ----------------------------------------------------------------------

opt.mouse = {}             -- Enable mouse support for all modes
opt.history = 512           -- History of ':' commands
--opt.timeout = true          -- Enable waiting for a mapped key sequence
--opt.timeoutlen = 100
--opt.completeopt = ""        -- Improve autocomplete behaviour
opt.hidden = true           -- Enable background buffers
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Limit syntax highlight to 240 characters
opt.updatetime = 700        -- Flush to swap after Nms of inactitivy
opt.undofile = true         -- Save undo history to a file
opt.backup = true           -- Make a backup before writing
opt.swapfile = true         -- Use swapfiles for buffers

-- Set up undo, backup, and swap directories
local prefix = vim.fn.stdpath("data")
opt.undodir = prefix .. "/undo//"
opt.backupdir = prefix .. "/swap//"
opt.directory = prefix .. "/backup//"

-- Disable builtins plugins
local disabled_builtins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_builtins) do
    vim.g["loaded_" .. plugin] = 1
end

-- EDITOR --------------------------------------------------------------------

opt.autoindent = true           -- Indent automatically
opt.smartindent = true          -- Try to be clever when indenting
opt.smarttab = true             -- Try to be clever when tabbing
opt.wrap = false                -- No solf wrapping
opt.expandtab = true            -- Use spaces instead of tabs
opt.shiftwidth = 4              -- Use 4 spaces for tabbing
opt.tabstop = 4                 -- Tab size equals 4 spaces
opt.softtabstop = 4             -- Treat 4 spaces as one tab

-- COMMAND PALLETE -----------------------------------------------------------

opt.wildmenu = true             -- Improve command completion

-- SEARCH --------------------------------------------------------------------

opt.hlsearch = true             -- Highlight search results
opt.incsearch = true            -- Search on the fly
opt.smartcase = true            -- Be case-sensitive when using uppercase
opt.ignorecase = true           -- Ignore case (unless uppercase is used)

-- UI ------------------------------------------------------------------------

opt.termguicolors = true        -- Enable 24 bit colour in TUI
opt.ruler = true                -- Show cursor position at the bottom
opt.number = true               -- Show numberline
opt.numberwidth = 1             -- Reduce width of number column
opt.signcolumn = "yes"          -- Show diagnostics column by default
opt.splitright = true           -- Create windows to the right
opt.splitbelow = true           -- Create windows at the bottom
opt.scrolloff = 5               -- Keep at least N lines near the cursor
opt.sidescroll = 10             -- Start scrolling to the side when at N
opt.display = "lastline"        -- Show overflowing text as @@@
opt.colorcolumn = "+1"          -- Show a max-length column
opt.showtabline = 2             -- Always show editor tabs
opt.foldmethod = "indent"       -- Fold on indent
opt.foldenable = false          -- Show all folds by default
opt.shortmess:append("sI")      -- Disable intro
opt.cursorline = true           -- Draw attention to the cursor position
