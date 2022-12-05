require("config/options")
require("config/plugins")

local function highlight_yank()
	-- vim.api.nvim_command("autocmd! highlight_yank")
	vim.api.nvim_command(
		"autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }"
	)
end

highlight_yank()

--  vim.cmd([[autocmd BufWritePost config/plugins.lua PackerCompile]])
vim.cmd([[
autocmd BufRead,BufEnter *.astro set filetype=astro


nmap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
"検索結果のハイライトを、ESC キー連打で解除する。"

tnoremap <Esc> <C-\><C-n>
" tnoremap <C-;> <C-\><C-n>
" hi clear CursorLine
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

"ターミナルでescでノーマルモードに戻る
":T コマンドでVSCodeみたいにターミナルを起動する
command! -nargs=* T split | wincmd j | resize 15 | terminal <args>
"

" let g:highlightedyank_highlight_duration = 500
"----------------------------
"------------------------------------------------
" skanehira/jumpcursor.vim


"--------------------------------
"  colorschem settings 
"
 colorschem dracula
"colorschem  sonokai



" タブを使いやすくする設定

" https://qiita.com/wadako111/items/755e753677dd72d8036d を参考にした
" Anywhere SID. vim のタブの設定
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" -------------------------"
"               t9md/vim-choosewin                "
" ----------------------------------------------------------------------------""
nmap  -  <Plug>(choosewin)

autocmd! ColorScheme * hi VertSplit ctermbg=none
autocmd! VimEnter,ColorScheme * hi VertSplit ctermbg=none


]])
