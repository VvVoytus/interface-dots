-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
-- Autostart necessary processes (like notifications daemons, status bars, etc.) or apps at launch
local consts = require("config.consts")

hl.on("hyprland.start", function()
	hl.exec_cmd(consts.services.menu)
-- 	hl.exec_cmd(uwsm_launch_app(browser), { workspace = "2 silent" })
-- 	hl.exec_cmd(uwsm_launch_app(terminal), { workspace = "3 silent" })
-- 	hl.exec_cmd(uwsm_launch_app(code_editor))
-- 	hl.exec_cmd(uwsm_launch_app(music_player), { workspace = "5 silent" })
-- 	hl.exec_cmd(uwsm_launch_app(mail_client), { workspace = "6 silent" })
-- 	hl.dsp.focus({ workspace = 1 })
-- 	hl.exec_cmd("hyprpm reload -f")
end)
--
hl.on("config.reloaded", function()
	hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'catppuccin-mocha-rosewater-standard+default'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-Dark'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name 'sans-serif 10'")
end)
