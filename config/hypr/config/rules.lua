--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/configuring/core/rules/

hl.window_rule({
	name = "default",
	match = {
		class = ".*",
	},

	float = true, -- opens all windows floating by default
	idle_inhibit = "fullscreen", -- inhibit hypridle on fullscreen windows (e.g. video players)
	suppress_event = "maximize", -- ignore maximize requests from apps
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	name = "picture-in-picture",
	match = {
		title = "^(picture-in-Picture)$",
	},

	float = true,
	pin = true,
	move = { "69.5%", "4%" },
})

-- hl.window_rule({
-- 	name = "cursor-in-4th-workspace",
-- 	match = {
-- 		class = "^cursor$",
-- 	},
--
-- 	workspace = "4 silent",
-- })
--
hl.window_rule({
	name = "tiled",
	match = {
		class = "^zen|com.mitchellh.ghostty|cursor$",
	},

	tile = true,
})

hl.window_rule({
	name = "bitwarden-float",
	match = {
		title = "^Extension: (Bitwarden Password Manager) - Bitwarden"
	},

	float = true,
})
--
-- hl.workspace_rule({
-- 	workspace = "1",
-- 	persistent = true,
-- 	default = true,
-- })
-- for i = 2, 6 do
-- 	hl.workspace_rule({
-- 		workspace = tostring(i),
-- 		persistent = true,
-- 	})
-- end
