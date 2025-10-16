return {
  "sphamba/smear-cursor.nvim",
  opts = {
    smear_between_buffers = false, -- Smear cursor when switching buffers or windows.
    smear_to_cmd = false, --IMPORTANT, to not have it in vim.cmd()<3
    smear_insert_mode = false,

    -- Smear cursor when moving within line or to neighbor lines.
    -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
    smear_between_neighbor_lines = true,

    min_vertical_distance_smear = 5,
    -- min_horizontal_distance_smear = 5,
    -- Draw the smear in buffer space instead of screen space when scrolling
    scroll_buffer_space = true,

    -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    -- Smears will blend better on all backgrounds.
    legacy_computing_symbols_support = false,

    -- Default  Range
    cursor_color = "#E46876",
    stiffness = 0.5,
    trailing_stiffness = 0.6,
    damping = 0.95, -- 0.85     [0, 1]
    distance_stop_animating = 0.5,
  },
}
