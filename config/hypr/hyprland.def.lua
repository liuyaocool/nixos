local CONFIG = {
    MOD = "SUPER",
    -- hyprctl monitors all
    MON1 = { output = "HDMI-A-2", mode = "1920x1080@60",  position = "0x0",    scale = 1, },
    -- MON1 = { output = "HDMI-A-2", mode = "1080x1920@60",  position = "0x0",    scale = 1, transform = 3 },
    -- MON2 = { output = "DP-1",     mode = "2560x1440@100", position = "1920x0", scale = 1 },
}

require("event")
require("animation")
require("config")
require("keybinds")(CONFIG)
require("window-rules")

hl.config({
    input = {
        -- left_handed = true,
    },
})
