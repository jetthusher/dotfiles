local bindings = require("bindings")
local map = require("lib.bindings").map

local function switch_to_window_or_tmux_pane(direction)
    return function()
        local is_tmux = os.getenv("TMUX")
        local pre_window_number = vim.api.nvim_win_get_number(0)
        vim.api.nvim_command("wincmd " .. direction)
        local post_window_number = vim.api.nvim_win_get_number(0)
        local tmux_direction = {
            l = "R",
            h = "L",
            j = "D",
            k = "U",
            p = "l",
        }

        if is_tmux and pre_window_number == post_window_number then
            os.execute("tmux select-pane -" .. tmux_direction[direction])
        end
    end
end

map(bindings.windows.switch_to_top_window_or_tmux_pane, switch_to_window_or_tmux_pane("k"))
map(bindings.windows.switch_to_bottom_window_or_tmux_pane, switch_to_window_or_tmux_pane("j"))
map(bindings.windows.switch_to_left_window_or_tmux_pane, switch_to_window_or_tmux_pane("h"))
map(bindings.windows.switch_to_right_window_or_tmux_pane, switch_to_window_or_tmux_pane("l"))
--map_modes(bindings.windows.close_focused_window, "<C-w>c")
map(bindings.windows.split_window_horizontally, ":split ", { verbose = true })
map(bindings.windows.split_window_vertically, ":vsplit ", { verbose = true })
