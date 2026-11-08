local function init()
  -- Enable faster startup by caching compiled Lua modules
  vim.loader.enable()

  -- setup <space> as the map leader
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "

	-- setup additional global variables
	vim.g.health = { style = "float" }

	-- load config
	vim.g.config = require("config.options")

	-- configure vim.opt
	for k, v in pairs(vim.g.config.options) do
		vim.opt[k] = v
	end

	-- auto commands
	require("config.autocmds")

	-- file type patches
	require("config.ft")

	-- plugin managment
	require("config.pack")

	-- install plugins
	require("plugins")

	-- key mappings - must be done after plugin installation
	require("config.keymaps")
end

init()
