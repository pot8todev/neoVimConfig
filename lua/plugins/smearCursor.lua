return {
  "sphamba/smear-cursor.nvim",
  event = "CursorHoldI", --load when enter insertMode
  opts = {

    smear_between_buffers = false, -- Smear cursor when switching buffers or windows.
    smear_to_cmd = false, --IMPORTANT, to not have it in vim.cmd()<3
    smear_insert_mode = false,

    smear_between_neighbor_lines = true,

    min_vertical_distance_smear = 5,
    scroll_buffer_space = true,

    legacy_computing_symbols_support = false,

    -- less fireHazard
    cursor_color = "#E46876",
    -- stiffness = 0.7,
    -- trailing_stiffness = 0.5,
    -- damping = 0.8,
    -- trailing_exponent = 2,
    -- never_draw_over_target = true,
    -- hide_target_hack = true,

    -- myNormal
    stiffness = 0.3,
    trailing_stiffness = 0.5,
    damping = 0.80, -- 0.85     [0, 1]
    distance_stop_animating = 0.5,
  },
}
