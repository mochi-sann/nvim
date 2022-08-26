require("config/options")
require("config/plugins")

--  vim.cmd([[autocmd BufWritePost config/plugins.lua PackerCompile]])
vim.cmd([[
autocmd BufRead,BufEnter *.astro set filetype=astro


nmap <Esc><Esc> :nohlsearch<CR><Esc>
"検索結果のハイライトを、ESC キー連打で解除する。"

tnoremap <Esc> <C-\><C-n>
" tnoremap <C-;> <C-\><C-n>
" hi clear CursorLine
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

"ターミナルでescでノーマルモードに戻る
":T コマンドでVSCodeみたいにターミナルを起動する
command! -nargs=* T split | wincmd j | resize 15 | terminal <args>
"

"--------------------------------
" ヤンクしたときにhighlightする
""if !exists('##TextYankPost')
  nmap y <Plug>(highlightedyank)
  xmap y <Plug>(highlightedyank)
  omap y <Plug>(highlightedyank)
""endif
let g:highlightedyank_highlight_duration = 500
"----------------------------
"------------------------------------------------
" skanehira/jumpcursor.vim


"--------------------------------
"  colorschem settings 
"
colorschem dracula
""colorschem  sonokai 



"------------------------------------------------------"
"relastle/vim-colorrange
"カラーコードを編集するところ

nnoremap <A-a> :ColorrangeIncrement<CR>
nnoremap <A-x> :ColorrangeDecrement<CR>



"------------------------------------------------------"
"------------------------------------------------------"
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

]])
