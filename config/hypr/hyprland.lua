require("keybinds")
require("config")
require("window-rules")

hl.on("hyprland.start", function () 
    hl.exec_cmd("fcitx5 -d --replace")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("systemctl --user start waybar")
end)
hl.on("config.reloaded", function () 
    hl.exec_cmd("systemctl --user restart waybar")
    hl.exec_cmd("fcitx5 -d --replace")
end)

-- hyprctl monitors all
-- local MON1 = "HDMI-A-2"
-- local MON2 = "DP-1"
-- hl.monitor({ output = MON1, mode = "1920x1080@60", position = "0x0",    scale = 1 })
-- hl.monitor({ output = MON2, mode = "2560x1440@100", position = "1920x0", scale = 1 })
-- for i = 1, 10 do
--     hl.workspace_rule({ workspace = i,      monitor = MON1, persistent = true, })
--     hl.workspace_rule({ workspace = i + 10, monitor = MON2, persistent = true, })
-- end