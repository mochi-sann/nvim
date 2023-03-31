local notify = require("notify")

notify.setup({
	---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
	stages = "fade",
	-- ---@usage Function called when a new window is opened, use for changing win settings/config
	on_open = nil,
	-- ---@usage Function called when a window is closed
	on_close = nil,
	---@usage timeout for notifications in ms, default 5000
	timeout = 1700,
	top_down = false,
	-- -- Render function for notifications. See notify-render()
	render = "default",
	-- ---@usage highlight behind the window for stages that change opacity
	-- background_colour = "Normal",
	-- ---@usage minimum width for notification windows
	minimum_width = 50,

	-- ---@usage notifications with level lower than this would be ignored. [ERROR > WARN > INFO > DEBUG > TRACE]
	-- ---@usage Icons for the different levels
})

vim.cmd([[
" autocmd BufRead * lua vim.notify('BufRead ' .. vim.fn.expand('%'))
" autocmd BufEnter * lua vim.notify('BufEnter ' .. vim.fn.expand('%'))
" autocmd WinEnter * lua vim.notify('WinEnter ' .. vim.fn.winnr())
]])
vim.notify = notify
