return function(config)
    -- Doc: https://wiki.hypr.land/Configuring/Basics/Binds/
    -- Doc dsp: https://wiki.hypr.land/Configuring/Basics/Dispatchers/
    -- keycode(36,61...) get by wev
    -- animation： https://wiki.hypr.land/configuring/core/animations/#curves
    -- functions
        -- https://alejandrominaya.github.io/hyprland-lua-docs/
        -- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Expanding-functionality/?utm_source=chatgpt.com#convenience-functions

    local MOD = config.MOD 
    local rofi = "rofi -theme ~/.config/rofi/01.rasi -show "

    hl.bind(MOD .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
    hl.bind(MOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

    hl.bind(MOD .. "+ code:20",         hl.dsp.focus({ workspace = "-1" }))
    hl.bind(MOD .. "+ code:21",         hl.dsp.focus({ workspace = "+1" }))
    hl.bind(MOD .. "+ SHIFT + code:20", hl.dsp.window.move({ workspace = "-1" }))
    hl.bind(MOD .. "+ SHIFT + code:21", hl.dsp.window.move({ workspace = "+1" }))

    -- hl.bind(MOD .. "+ a",               hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | dbus-launch --exit-with-session swappy -f -"))
    hl.bind(MOD .. "+ a",               hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | swappy -f -"))
    hl.bind(MOD .. "+ s",               hl.dsp.exec_cmd("grim - | swappy -f -"))
    -- hl.bind(MOD .. "+ s",               hl.dsp.exec_cmd("grim /tmp/grim$(date +'%m%d-%H.%M.%S').png"))
    hl.bind(MOD .. "+ q",               hl.dsp.exec_cmd("str=\"$(wl-paste)\" && qrencode -s 10 -m 1 -o - \"$str\" | swappy -f -"))
    hl.bind(MOD .. "+ p",               hl.dsp.exec_cmd(rofi .. " drun"))
    hl.bind(MOD .. "+ o",               hl.dsp.exec_cmd(rofi .. " window"))
    hl.bind(MOD .. "+ code:61",         hl.dsp.exec_cmd(rofi .. " run -matching prefix -filter \"q-\" -disable-history"))
    hl.bind(MOD .. "+ SHIFT + code:36", hl.dsp.exec_cmd("foot zsh"))
    hl.bind(MOD .. "+ SHIFT + r",       hl.dsp.exec_cmd("hyprctl reload"))

    -- https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
    -- hl.bind(MOD .. "+ i",        hl.dsp.layout("cycleprev"))
    -- hl.bind(MOD .. "+ k",        hl.dsp.layout("cyclenext"))
    hl.bind(MOD .. " + j",  hl.dsp.focus({ direction = "left" }))
    hl.bind(MOD .. " + l",  hl.dsp.focus({ direction = "right" }))
    hl.bind(MOD .. " + i",  hl.dsp.focus({ direction = "up" }))
    hl.bind(MOD .. " + k",  hl.dsp.focus({ direction = "down" }))
    -- hl.bind(MOD .. "+ SHIFT + j",  hl.dsp.window.move({ direction = "left" }))
    -- hl.bind(MOD .. "+ SHIFT + l",  hl.dsp.window.move({ direction = "right" }))
    -- hl.bind(MOD .. "+ SHIFT + i",  hl.dsp.window.move({ direction = "up" }))
    -- hl.bind(MOD .. "+ SHIFT + k",  hl.dsp.window.move({ direction = "down" }))
    hl.bind(MOD .. "+ SHIFT + i", hl.dsp.layout("swapprev"))
    hl.bind(MOD .. "+ SHIFT + k", hl.dsp.layout("swapnext"))
    -- hl.bind(MOD .. "+ j",         hl.dsp.focus({monitor = "-1"}))
    -- hl.bind(MOD .. "+ l",         hl.dsp.focus({monitor = "+1"}))
    -- hl.bind(MOD .. "+ SHIFT + j", hl.dsp.window.move({monitor = "-1"}))
    -- hl.bind(MOD .. "+ SHIFT + l", hl.dsp.window.move({monitor = "+1"}))

    -- key: <>
    hl.bind(MOD .. "+ code:59",  hl.dsp.layout("addmaster"))
    hl.bind(MOD .. "+ code:60",  hl.dsp.layout("removemaster"))
    hl.bind(MOD .. "+ RETURN",   hl.dsp.layout("swapwithmaster master"))
    hl.bind(MOD .. "+ c",         hl.dsp.window.center())
    hl.bind(MOD .. "+ SHIFT + c", hl.dsp.window.kill())
    hl.bind(MOD .. "+ f",         hl.dsp.window.float())
    -- key: []
    hl.bind(MOD .. "+ code:34",   hl.dsp.window.resize({x = "-20", y = "0", relative = true,}))
    hl.bind(MOD .. "+ code:35",   hl.dsp.window.resize({x = "+20", y = "0", relative = true,}))

    if config.MON1 ~= nil then hl.monitor(config.MON1) end
    if config.MON2 ~= nil then hl.monitor(config.MON2) end
    local function do_ws(key, dsp_action)
        local cur_mon = hl.get_active_monitor()
        local mons = hl.get_monitors()
        if key == 0 then key = 10 end
        local i;
        if #mons == 1 then
            i = key
        elseif #mons == 2 then
            if     cur_mon.name == config.MON1.output then i = key
            elseif cur_mon.name == config.MON2.output then i = key + 10
            else return end
        else
            return
        end
        hl.dispatch(dsp_action({ workspace = i }))
    end
    for i = 1, 10 do
        local key = i % 10
        hl.bind(MOD .. "+"       .. key, function() do_ws(key, hl.dsp.focus)       end)
        hl.bind(MOD .. "+SHIFT+" .. key, function() do_ws(key, hl.dsp.window.move) end)
        if config.MON1 ~= nil then hl.workspace_rule({ workspace = i,      monitor = config.MON1.output }) end
        if config.MON2 ~= nil then hl.workspace_rule({ workspace = i + 10, monitor = config.MON2.output }) end
    end

    local function move_moonlight()
        local windows = hl.get_windows({class = "com.moonlight_stream.Moonlight"})
        if #windows < 1 then return false end
        --  lua 数组下标以1开始
        hl.dispatch(hl.dsp.window.move({
            window = windows[1],
            workspace = "special:moonlight"
        }))
        hl.dispatch(hl.dsp.window.float({  window = windows[1], action = "enable" }))
        hl.dispatch(hl.dsp.window.resize({ window = windows[1], x = 1920, y = 1080 }))
        hl.dispatch(hl.dsp.window.center({ window = windows[1] }))
        return true
    end
    hl.bind(MOD .. "+ code:49",   function()
        hl.dispatch(hl.dsp.workspace.toggle_special("moonlight"))
        local sp_ws = hl.get_workspace("special:moonlight")
        if sp_ws == nil or not sp_ws.active then return end
        local windows = hl.get_windows({class = "com.moonlight_stream.Moonlight", workspace = "special:moonlight"})
        if #windows > 0 then
            hl.dispatch(hl.dsp.window.center({ window = windows[1] }))
        end
        windows = hl.get_windows({class = "com.moonlight_stream.Moonlight"})
        if move_moonlight() then return end
        hl.exec_cmd("moonlight")
        -- 直接执行 窗口尺寸 浮动不会执行
        hl.timer(move_moonlight, { timeout = 1000, type = "oneshot" })
    end)

    hl.bind(MOD .. "+ g", function()
        local cur_win = hl.get_active_window()
        if cur_win.floating then
            hl.dispatch(hl.dsp.window.float())
        else
            -- local y = math.floor(cur_win.size.y * 0.95);
            local y = cur_win.size.y - 50
            local x = cur_win.size.x
            hl.dispatch(hl.dsp.window.float())
            hl.dispatch(hl.dsp.window.resize({ x = x, y = y }))
            hl.dispatch(hl.dsp.window.pin())
            hl.dispatch(hl.dsp.window.center())
        end
    end)

    hl.bind(MOD .. "+ Tab", function()
        local cur_mon = hl.get_active_monitor()
        local last_ws = hl.get_last_workspace(cur_mon)
        if last_ws == nil then return end
        hl.dispatch(hl.dsp.focus({ workspace = last_ws.id }))
    end)

    -- local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
    -- closeWindowBind:set_enabled(false)
    -- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only
    -- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })

end
