require("config/options")
require("config/plugins")
vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])

vim.cmd([[
call jetpack#begin()
  ""Jetpack 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

  Jetpack 'neovim/nvim-lspconfig'

""  Jetpack 'williamboman/nvim-lsp-installer'
""
""  Jetpack 'hrsh7th/cmp-buffer'
""  Jetpack 'hrsh7th/cmp-path'
""  Jetpack 'hrsh7th/cmp-cmdline'
""  Jetpack 'hrsh7th/nvim-cmp'
""  Jetpack 'hrsh7th/cmp-nvim-lsp-signature-help'
""  Jetpack 'hrsh7th/cmp-emoji'
""  Jetpack 'hrsh7th/cmp-nvim-lsp-document-symbol'
""  Jetpack 'tzachar/cmp-tabnine', { 'do': './install.sh' }
""  Jetpack 'onsails/lspkind.nvim'

""  Jetpack 'hrsh7th/cmp-vsnip'
""  Jetpack 'hrsh7th/vim-vsnip'

  Jetpack 'jose-elias-alvarez/null-ls.nvim'
  Jetpack 'nvim-lua/plenary.nvim'

  Jetpack 'lambdalisue/fern.vim',{'on': 'Fern'}
  Jetpack 'lambdalisue/fern-git-status.vim',{'on': 'Fern'}
  Jetpack 'lambdalisue/nerdfont.vim',{'on': 'Fern'}
  Jetpack 'lambdalisue/fern-renderer-nerdfont.vim',{'on': 'Fern'}
  Jetpack 'lambdalisue/glyph-palette.vim',{'on':'Fern'}
  Jetpack 'lambdalisue/fern-bookmark.vim',{'on': 'Fern'}
  Jetpack 'lambdalisue/fern-hijack.vim' 
  Jetpack 'lambdalisue/gina.vim', {'on': ['VimEnter']}

  Jetpack 't9md/vim-quickhl',{'on': ['<Plug>(quickhl-manual-this)','<Plug>(quickhl-manual-reset)']}
  Jetpack 'terryma/vim-expand-region',{'on':[ '<Plug>(expand_region_expand)','<Plug>(expand_region_shrink)']}
  Jetpack 'segeljakt/vim-silicon', { 'on': 'Silicon' }
  Jetpack 'dracula/vim', { 'as': 'dracula' }
  Jetpack 'vim-scripts/vim-auto-save', {'on': ['VimEnter']}
  Jetpack 'vim-jp/vimdoc-ja'
  " Jetpack 'vim-airline/vim-airline' , {'on': ['VimEnter']}
  " Jetpack 'vim-airline/vim-airline-themes' , {'on': ['VimEnter']}
  " jetpack 'github/copilot.vim'
  " jetpack 'cohama/lexima.vim'
  " jetpack 'neoclide/coc.nvim', {'branch': 'release'}
  Jetpack 'akinsho/toggleterm.nvim',{'tag': 'v1.*'}

  Jetpack 'vim-denops/denops.vim'

  Jetpack 'alvan/vim-closetag',{'for': ['html','vue','javascript','javascriptreact','typescriptreact','typescript']}
  Jetpack 'lukas-reineke/indent-blankline.nvim'
  Jetpack 'p00f/nvim-ts-rainbow'
  " jetpack 'nvim-treesitter/nvim-treesitter' , {'on':[]}
  Jetpack 'nvim-treesitter/nvim-treesitter'

  " jetpack 'tomtom/tcomment_vim'
  Jetpack 'airblade/vim-gitgutter', {'on': ['VimEnter']}
  " jetpack 'RRethy/vim-illuminate'
  Jetpack 'MunifTanjim/nui.nvim'
  " jetpack 'editorconfig/editorconfig-vim'
  Jetpack 'windwp/nvim-ts-autotag' , {'on': ['VimEnter']}
  Jetpack 'nvim-lualine/lualine.nvim'

  Jetpack 'kyazdani42/nvim-web-devicons'
  Jetpack 'echasnovski/mini.nvim', { 'branch': 'stable' }
  Jetpack 'tversteeg/registers.nvim', { 'branch': 'main' }
  " jetpack 'mhinz/vim-startify'
  Jetpack 'folke/which-key.nvim'
  Jetpack 'ryanoasis/vim-devicons'
  Jetpack 'relastle/vim-colorrange', { 'on': ['ColorrangeIncrement' , 'ColorrangeDecrement'] }
  Jetpack 'lilydjwg/colorizer'
  Jetpack 'machakann/vim-highlightedyank', {'on':['<Plug>(highlightedyank)']}
  Jetpack 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install',
  \ 'on': ['JsDoc']
  \}
  " Jetpack 'tyru/open-browser.vim'
  Jetpack 't9md/vim-choosewin' , {'on': ['<Plug>(choosewin)']}
  Jetpack 'mhinz/vim-startify'
  Jetpack 'rmagatti/auto-session'
  " jetpack 'skanehira/vsession'
  " jetpack 'atelierbra/vim-colors_duotones'
  " jetpack 'uloco/vim-bluloco-dark'
  Jetpack 'skanehira/jumpcursor.vim', {'on': ['<Plug>(jumpcursor-jump)']}
  " jetpack 'petertriho/nvim-scrollbar'
 call jetpack#end()
 let g:jetpack#optimization=2


" source ~/.config/nvim/config/airline.vim
"
"--------------------------------
" 小規模プラグインは先に書く
" -------------------- 
" --------------------  vsnip
let g:vsnip_filetypes = {}

let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']
"  vim auto save
let g:auto_save = 1
" let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
 let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
" help の言語を日本語にする
set helplang=ja

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
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

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
nmap [j <Plug>(jumpcursor-jump)

"--------------------------------
" Fern settings 


let g:fern#renderer = 'nerdfont'
let g:fern#disable_drawer_auto_restore_focus = 1
let g:fern#renderer#default#leading = "hogehogeho "
nnoremap <C-n> :Fern . -reveal=% -drawer -right -width=35  <CR>
let g:fern#default_hidden=1 "不可視ファイルを表示する


 augroup my-glyph-palette
   autocmd! *
   autocmd FileType fern call glyph_palette#apply()
   autocmd FileType nerdtree call glyph_palette#apply()
 augroup END


"--------------------------------
"  colorschem settings 
"
colorschem dracula

" 背景をなくす
hi Normal guibg=NONE ctermbg=NONE
augroup TransparentBG
  autocmd!
  autocmd Colorscheme * hi Normal guibg=NONE ctermbg=NONE
 augroup END



"-------------------------------------------
" インデントにいろをつけるところ


"------------------------------------------------------"
"relastle/vim-colorrange
"カラーコードを編集するところ

nnoremap <A-a> :ColorrangeIncrement<CR>
nnoremap <A-x> :ColorrangeDecrement<CR>



"------------------------------------------------------"
" カーソル下の単語をGoogleで検索する
function! s:search_by_google() 
    let line = line(".")
    let col  = col(".")
    let searchWord = expand("<cword>")
    if searchWord  != ''
        execute 'read !open https://www.google.co.jp/search\?q\=' . searchWord
        execute 'call cursor(' . line . ',' . col . ')'
    endif
endfunction
command! SearchByGoogle call s:search_by_google()
nnoremap <silent> <Space>g :SearchByGoogle<CR>

"------------------------------------------------------"
" タブを使いやすくする設定

" https://qiita.com/wadako111/items/755e753677dd72d8036d を参考にした
" Anywhere SID. vim のタブの設定
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'

" The prefix key.
" Tab jump
" for n in range(1, 9)
"   execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
" endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ


"------------------------------------------------------"
"定義元にジャンプする

" 定義にジャンプする https://zenn.dev/skanehira/articles/2021-12-12-vim-coc-nvim-jump-split
" [
"   {"text": "(e)dit", "value": "edit"}
"   {"text": "(n)ew", "value": "new"}
" ]
" NOTE: text must contains '()' to detect input and its must be 1 character
function! ChoseAction(actions) abort
  echo join(map(copy(a:actions), { _, v -> v.text }), ", ") .. ": "
  let result = getcharstr()
  let result = filter(a:actions, { _, v -> v.text =~# printf(".*\(%s\).*", result)})
  return len(result) ? result[0].value : ""
endfunction

function! CocJumpAction() abort
  let actions = [
        \ {"text": "(s)plit", "value": "split"},
        \ {"text": "(v)slit", "value": "vsplit"},
        \ {"text": "(t)ab", "value": "tabedit"},
        \ ]
  return ChoseAction(actions)
endfunction

" -------------------------"
"               t9md/vim-choosewin                "
" ----------------------------------------------------------------------------""
nmap  -  <Plug>(choosewin)
" オーバーレイ機能を有効にしたい場合
let g:choosewin_overlay_enable          = 1

" オーバーレイ・フォントをマルチバイト文字を含むバッファでも綺麗に表示する。
" let g:choosewin_overlay_clear_multibyte = 1


"------------------------- fzf-preivew の設定
" let $BAT_THEME                     = 'Dracula'
nnoremap <silent> mf           :lua vim.lsp.buf.formatting()<CR>


]])
require("mini")
require("whichikey")
--require("nvim-cmp")
require("treesitter")
require("indent-blank-line")
require("nvim-lualine")
require("nvim-auto-session")
require("nvim-null-ls")
