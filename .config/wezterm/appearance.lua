local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

local tab_bar_theme = {
    bg = '#20202E',
    active_bg = '#212132',
    active_fg = '#30FE93',
    inactive_bg = '#212132',
    inactive_fg =  '#D3D3FE',
}

return {
    front_end = "WebGpu",
    webgpu_power_preference = "HighPerformance",

    --- theme
    term = "xterm-256color",
    color_scheme = "Catppuccin Mocha",

    --- scroll bar
    -- enable_scroll_bar = true,
    -- min_scroll_bar_height = "3cell",
    -- colors = {
    --     scrollbar_thumb = "#34354D",
    -- },

    --- tab
    enable_tab_bar = true,
    tab_max_width = 30,
    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = true,
    tab_bar_at_bottom = false,
    show_new_tab_button_in_tab_bar = false,
    show_tab_index_in_tab_bar = false,

    --- window
    window_background_opacity = 0.90,
    macos_window_background_blur = 20,
    text_background_opacity = 0.90,
    window_decorations = "RESIZE",
    window_padding = {
        left = 20,
        right = 20,
        top = 0,
        bottom = 5,
    },

    --- colors
    window_frame = {
        active_titlebar_bg = tab_bar_theme.bg,
        inactive_titlebar_bg = tab_bar_theme.bg,
    },
    colors = {
        tab_bar = {
            active_tab = {
                bg_color = tab_bar_theme.active_bg,
                fg_color = tab_bar_theme.active_fg,
            },
            inactive_tab = {
                bg_color = tab_bar_theme.inactive_bg,
                fg_color = tab_bar_theme.inactive_fg,
            },
            inactive_tab_edge = tab_bar_theme.bg,
        },
    },
}
