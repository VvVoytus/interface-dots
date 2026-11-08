-- Hyprland config for the hyprlogin greeter session.
-- https://wiki.hypr.land/Configuring/Start/

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprlogin")
end)


hl.monitor({ output = "eDP-1", mode = "highres", position = "auto", scale = 1.67 })

hl.config({
    input = {
        kb_layout  = "pl",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },
})
