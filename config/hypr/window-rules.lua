-- # # ------ 其他 ------
-- # windowrulev2 = float,class:(wemeetapp)
-- # windowrulev2 = tile,class:(GTK Application),title:(Open File)
hl.window_rule({ match = { class = "com.gabm.satty" }, float = true })

------ 有一些不是窗口 而是layer(图层 不继承普通窗口的blur 需要单独设置)， 查看： hyprctl layers
hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "rofi" }, blur = true })
