-- https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    ecosystem = {
        no_update_news = true,
    },
    general = {
        layout = "master",
        gaps_in  = 0,
        gaps_out = 2,
        border_size = 2,
        col = {
            active_border = "0xff00ffff",
            inactive_border = "0x00000000",
        },
    },
    input = {
        natural_scroll = true,
		-- left_handed = true,
        follow_mouse = 1,
        mouse_refocus = false,
        float_switch_override_focus = 2,
        -- kb_options = "caps:swapescape", // swap keyboard
        touchpad = {
            natural_scroll = true,
        },
    },
    decoration = {
        active_opacity = 1,
        inactive_opacity = 1,
        rounding = 0,
        blur = {
            enabled = true,
            size = 10,
            passes = 2,
        },
        shadow = {
            enabled = false,
            sharp = true, -- true:无渐变； false:有渐变

            color_inactive = 0x66333333,
            range = 2,
            render_power = 1,
            -- ARGB 会影响foot的float背景色
            color = 0xff00ffff;

            offset = {0, 0},
            scale = 1,
        },
    },
    cursor = {
        hide_on_key_press = true,
        -- 关闭鼠标自动移到焦点窗口
        no_warps = false,
    },
    misc = {
    	-- focus_on_activate = true
    },
    animations = {
        enabled = true,
    },
    -- https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
    master = {
        new_on_top = true,
        -- new_status = master
    }
})

