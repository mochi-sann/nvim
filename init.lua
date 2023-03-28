require("config/options")
require("config/plugins")
require("config/functions")

vim.cmd([[
autocmd BufRead,BufEnter *.astro set filetype=astro
nmap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
tnoremap <Esc> <C-\><C-n>
colorschem tokyonight-moon
]])
