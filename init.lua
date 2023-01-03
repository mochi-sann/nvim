require("config/options")
require("config/plugins")

-- local function highlight_yank()
-- 	-- vim.api.nvim_command("autocmd! highlight_yank")
-- 	vim.api.nvim_command(
-- 		"autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }"
-- 	)
-- end
--
-- highlight_yank()
--  vim.cmd([[autocmd BufWritePost config/plugins.lua PackerCompile]])
vim.cmd([[
autocmd BufRead,BufEnter *.astro set filetype=astro
nmap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
"検索結果のハイライトを、ESC キー連打で解除する。"

tnoremap <Esc> <C-\><C-n>
"
 " colorschem dracula
 colorschem tokyonight-moon
]])
