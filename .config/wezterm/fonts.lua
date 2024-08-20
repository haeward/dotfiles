local wezterm = require("wezterm")

return {
    font = wezterm.font {
        family = "JetBrains Mono",
        weight = "Regular",
    },
    font_size = 14,

    window_frame = {
        font = wezterm.font {
            family = 'Hack Nerd Font',
            weight = 'Bold' 
        },
        font_size = 13,
    },
}
