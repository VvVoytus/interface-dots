local function uwsm_launch_app(name)
	return "uwsm app -- " .. name
end

local function uwsm_launch_service(name)
	return "uwsm app -t service -- " .. name
end


return {
  apps = {
    terminal = uwsm_launch_app("ghostty"),
    menu_app = uwsm_launch_app("hyprlauncher"),
    browser = uwsm_launch_app("apulse zen-browser"),
    -- file_manager = "thunar",
    -- code_editor = "cursor",
    -- music_player = "/usr/share/applications/com.yktoo.ymuse.desktop",
    -- mail_client = "thunderbird",
  },
  services = {
    menu = uwsm_launch_service("hyprlauncher -d"),
  }
}
