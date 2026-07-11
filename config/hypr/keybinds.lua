-- Doc: https://wiki.hypr.land/Configuring/Basics/Binds/
-- Doc dsp: https://wiki.hypr.land/Configuring/Basics/Dispatchers/
-- keycode(36,61...) get by wev

local MOD = "SUPER" 

hl.bind(MOD .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(MOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

local workspace = "~/bin/hypr-ext workspace "
local move = "~/bin/hypr-ext movetoworkspacesilent "
for i = 1, 10 do
    local key = i % 10
    -- hl.bind(MOD .. "+" .. key,             hl.dsp.exec_cmd(workspace .. key))
    -- hl.bind(MOD .. "+ SHIFT +" .. key,     hl.dsp.exec_cmd(move .. key))
    hl.bind(MOD .. "+" .. key,         hl.dsp.focus({ workspace = i}))
    hl.bind(MOD .. "+SHIFT+" .. key,   hl.dsp.window.move({ workspace = i }))
end
hl.bind(MOD .. "+ code:20",         hl.dsp.focus({ workspace = "-1" }))
hl.bind(MOD .. "+ code:21",         hl.dsp.focus({ workspace = "+1" }))
hl.bind(MOD .. "+ SHIFT + code:20", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(MOD .. "+ SHIFT + code:21", hl.dsp.window.move({ workspace = "+1" }))

-- grim -g "$(slurp)" - | dbus-launch --exit-with-session swappy -f -
hl.bind(MOD .. "+ a",               hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | satty --filename -"))
-- local rofi = "rofi -theme ~/.config/rofi/themes/01.rasi -show "
local rofi = "rofi -show "
hl.bind(MOD .. "+ p",               hl.dsp.exec_cmd(rofi .. "drun"))
hl.bind(MOD .. "+ o",               hl.dsp.exec_cmd(rofi .. "window"))
hl.bind(MOD .. "+ code:61",         hl.dsp.exec_cmd(rofi .. "run -matching prefix -filter \"q-\" -disable-history"))
hl.bind(MOD .. "+ SHIFT + code:36", hl.dsp.exec_cmd("foot zsh"))
hl.bind(MOD .. "+ SHIFT + r",       hl.dsp.exec_cmd("hyprctl reload"))

-- https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
hl.bind(MOD .. "+ code:59", hl.dsp.layout("addmaster"))
hl.bind(MOD .. "+ code:60", hl.dsp.layout("removemaster"))
hl.bind(MOD .. "+ code:47", hl.dsp.layout("swapprev"))
hl.bind(MOD .. "+ code:48", hl.dsp.layout("swapnext"))
hl.bind(MOD .. "+ i",       hl.dsp.layout("cycleprev"))
hl.bind(MOD .. "+ k",       hl.dsp.layout("cyclenext"))
hl.bind(MOD .. "+ code:36", hl.dsp.layout("swapwithmaster master"))


-- hl.bind(MOD .. "+ c",          hl.dsp.window.center())
hl.bind(MOD .. "+ SHIFT + c", hl.dsp.window.kill())
hl.bind(MOD .. "+ f",         hl.dsp.window.float())

hl.bind(MOD .. "+ j",         hl.dsp.focus({monitor = "-1"}))
hl.bind(MOD .. "+ l",         hl.dsp.focus({monitor = "+1"}))
hl.bind(MOD .. "+ SHIFT + j", hl.dsp.window.move({monitor = "-1"}))
hl.bind(MOD .. "+ SHIFT + l", hl.dsp.window.move({monitor = "+1"}))
hl.bind(MOD .. "+ code:34",   hl.dsp.window.resize({x = "-20", y = "0", relative = true,}))
hl.bind(MOD .. "+ code:35",   hl.dsp.window.resize({x = "+20", y = "0", relative = true,}))

-- bind=$MOD,g,execr, hyprctl dispatch togglefloating && hyprctl dispatch pin && hyprctl dispatch centerwindow
-- bind=$MOD,Tab,focuscurrentorlast

-- hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
-- local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)

-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only
-- hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
-- hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
