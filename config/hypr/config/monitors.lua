------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/configuring/core/monitors/
hl.monitor({ output = "eDP-1", mode = "highres", position = "auto", scale = 1.67 })
hl.monitor({ output = "HDMI-A-1", mode = "highres", position = "auto", scale = 1 })
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1, mirror = "eDP-1" })
