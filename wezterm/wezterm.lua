local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local config = wezterm.config_builder()

config.default_workspace = "dev"

local font = "JetBrains Mono"
-- local scheme = "Batman"
-- local scheme = "Tokyo Night Storm"
-- local scheme = "Catppuccin Frappe"
-- local scheme = "Catppuccin Mocha"
local scheme = "Catppuccin Latte"
local scheme_def = wezterm.color.get_builtin_schemes()[scheme]
config.color_scheme = scheme

config.font_size = 9

-- config.window_background_opacity = 0.9
-- config.window_decorations = "NONE"

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

config.use_fancy_tab_bar = false
config.window_frame = {
	font = wezterm.font({ family = font, weight = "Bold" }),
	font_size = 9,
}

config.command_palette_rows = 7
config.command_palette_font_size = 15
config.command_palette_bg_color = scheme_def.background
config.command_palette_fg_color = scheme_def.foreground

config.launch_menu = {
	{ label = "Yazi", args = { "yazi" } },
	{ label = "Htop", args = { "htop" } },
}

config.keys = {
	{
		key = "q",
		mods = "CTRL|ALT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "[",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "]",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	{ key = "j", mods = "CTRL|ALT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "k", mods = "CTRL|ALT", action = wezterm.action.ActivateTabRelative(1) },
	{
		key = "s",
		mods = "CTRL|ALT",
		action = wezterm.action.EmitEvent("open-serial-tab"),
	},
	{
		key = "b",
		mods = "CTRL|ALT",
		action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|LAUNCH_MENU_ITEMS" }),
	},
	{
		key = "n",
		mods = "CTRL|ALT",
		action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|TABS" }),
	},
	{
		key = "o",
		mods = "CTRL|ALT",
		action = act.ShowLauncherArgs({ flags = "TABS" }),
	},
	{
		key = "h",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Prev"),
	},
	{
		key = "l",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Next"),
	},
	{
		key = "f",
		mods = "CTRL|ALT",
		action = wezterm.action.Search({ CaseInSensitiveString = "" }),
	},
	{
		key = "Space",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivateCommandPalette,
	},
	{

		key = "R",
		mods = "CTRL|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.CompleteSelection("ClipboardAndPrimarySelection"),
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

config.audible_bell = "Disabled"
config.visual_bell = {
	target = "CursorColor",
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 150,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 300,
}

config.warn_about_missing_glyphs = false

return config
