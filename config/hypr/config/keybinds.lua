---------------------
---- KEYBINDINGS ----
---------------------

-- See https://wiki.hypr.land/configuring/core/binds/ for more

local consts = require("config.consts")

local function main_mod(key)
	return "SUPER + " .. key
end

hl.bind(main_mod("SHIFT + Q"), hl.dsp.exec_cmd("wleave"))

hl.bind(main_mod("T"), hl.dsp.exec_cmd(consts.apps.terminal))
-- hl.bind(main_mod("E"), hl.dsp.exec_cmd(uwsm_launch_app(file_manager)))
hl.bind(main_mod("S"), hl.dsp.exec_cmd(consts.apps.menu_app))

hl.bind(main_mod("Q"), hl.dsp.window.close())
-- hl.bind(main_mod("W"), hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))

hl.bind(main_mod("V"), hl.dsp.window.float({ action = "toggle" }))
hl.bind(main_mod("P"), hl.dsp.window.pseudo())
hl.bind(main_mod("J"), hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with main_mod arrow keys
hl.bind(main_mod("left"), hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod("right"), hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod("up"), hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod("down"), hl.dsp.focus({ direction = "down" }))

-- Scroll through workspaces with main_mod + SHIFT + left/right
hl.bind(main_mod("SHIFT + left"), hl.dsp.focus({ workspace = "e-1" }))
hl.bind(main_mod("SHIFT + right"), hl.dsp.focus({ workspace = "e+1" }))

-- Switch workspaces with main_mod [0-9]
-- Move active window to a workspace with main_mod SHIFT [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(main_mod(key), hl.dsp.focus({ workspace = tostring(i) }))
	hl.bind(main_mod("SHIFT + " .. key), hl.dsp.window.move({ workspace = tostring(i) }))
end

-- Move current workspace to a monitor with main_mod + CTRL + [1-2]
hl.bind(main_mod("CTRL + 1"), hl.dsp.workspace.move({ monitor = "eDP-1" }))
hl.bind(main_mod("CTRL + 2"), hl.dsp.workspace.move({ monitor = "HDMI-A-1" }))

-- Swap monitors with main_mod + CTRL + SHIFT + [1-2]
hl.bind(main_mod("CTRL + SHIFT + 1"), function()
	for i = 1, 10 do
		hl.dispatch(hl.dsp.workspace.move({ monitor = "eDP-1", workspace = tostring(i) }))
	end
end)
hl.bind(main_mod("CTRL + SHIFT + 2"), function()
	for i = 1, 10 do
		hl.dispatch(hl.dsp.workspace.move({ monitor = "HDMI-A-1", workspace = tostring(i) }))
	end
end)

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(main_mod("mouse:272"), hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod("mouse:273"), hl.dsp.window.resize(), { mouse = true })

-- Example special workspace (scratchpad)
hl.bind(main_mod("M"), hl.dsp.workspace.toggle_special("magic"))
hl.bind(main_mod("SHIFT + M"), hl.dsp.window.move({ workspace = "special:magic" }))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Requires hyprshot
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

-- Requires wleave
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("wleave"), { locked = true })
