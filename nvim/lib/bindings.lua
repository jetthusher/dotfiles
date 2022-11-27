local M = {}

---@alias mode
---| "n"
---| "i"
---| "c"
---| "v"
---| "s"

---@class Binding<T>: { key: T, modes: mode[] }

M.bindings_map = {
    n = {},
    i = {},
    c = {},
    v = {},
    s = {},
}

local function create_binding(key, modes, force)
    if not force then
        for _, mode in ipairs(modes) do
            local already_bound = M.bindings_map[mode][key]

            if already_bound then
                error("'" ..
                    key .. "' is about to be reassigned in '" .. mode .. "' mode when it's clearly not intended to!")
            else
                M.bindings_map[mode][key] = true
            end
        end
    end

    return { key = key, modes = modes }
end

local function parse_modes(mode_or_modes)
    if mode_or_modes == nil then
        return { "n" }
    elseif type(mode_or_modes) == "string" then
        return { mode_or_modes }
    else
        return mode_or_modes
    end
end

local function bind(keyset_or_key, mode_or_modes, force)
    local modes = parse_modes(mode_or_modes)

    if type(keyset_or_key) == "table" then
        local keyset = keyset_or_key
        local bindings = {}
        for _, key in ipairs(keyset) do
            table.insert(bindings, create_binding(key, modes, force))
        end

        return bindings
    else
        local key = keyset_or_key
        return create_binding(key, modes, force)
    end
end

local function map_single(binding, mode_map_or_function, opts)
    if opts == nil then
        opts = {}
    end

    local mode_map = {}
    if type(mode_map_or_function) == "function" or type(mode_map_or_function) == "string" then
        local fn = mode_map_or_function
        for _, mode in ipairs(binding.modes) do
            mode_map[mode] = fn
        end
    else
        local map = mode_map_or_function
        mode_map = map
    end

    for mode, action in pairs(mode_map) do
        vim.keymap.set(mode, binding.key, action, {
            noremap = not opts.recurvise,
            silent = not opts.verbose,
            buffer = opts.buffer,
        })
    end
end

local function is_binding(any)
    return type(any) == "table" and type(any.key) == "string"
end

---Recursively guard binding definition
---@generic T : string
---@param key T
---@param mode_or_modes? mode | mode[]
---@return Binding<T>
function M.bind(key, mode_or_modes)
    return bind(key, mode_or_modes, false)
end

---Recursively guard binding definition
---@generic T : string
---@generic K : mode
---@param binding_array T[]
---@param mode_or_modes? K | K[]
---@return Binding<T>[]
function M.bind_all(binding_array, mode_or_modes)
    return bind(binding_array, mode_or_modes, false)
end

---Bind without checking
---@generic T : string
---@generic K : mode
---@param key T
---@param mode_or_modes? K | K[]
---@return Binding<T, K>
function M.force_bind(key, mode_or_modes)
    return bind(key, mode_or_modes, true)
end

---Map each mode with a function from a table
---@generic T : string
---@param binding_or_array_of_bindings Binding<T> | Binding<T>[]
---@param mode_map_or_function (function | string) | table<mode, function | string>
---@param opts? { recurvise: boolean, verbose: boolean, buffer: number }
function M.map(binding_or_array_of_bindings, mode_map_or_function, opts)
    if not is_binding(binding_or_array_of_bindings) then
        local array_of_bindings = binding_or_array_of_bindings
        for _, binding in ipairs(array_of_bindings) do
            map_single(binding, mode_map_or_function, opts)
        end
    else
        local binding = binding_or_array_of_bindings
        map_single(binding, mode_map_or_function, opts)
    end
end

return M
