require("auto-session").setup({
	log_level = "info",
	auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads" },
	auto_save_enabled = true,
	auto_session_allowed_dirs = { "~/workspace", "~/.config/nvim" },
})
