require("config/options")
require("config/plugins")

vim.cmd([[
autocmd BufRead,BufEnter *.astro set filetype=astro
nmap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
"検索結果のハイライトを、ESC キー連打で解除する。"
tnoremap <Esc> <C-\><C-n>
colorschem tokyonight-night
]])
