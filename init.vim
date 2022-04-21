set updatetime=300
set shortmess+=c
set number             "行番号を表示
set laststatus=3        "ステータスラインを画面いっぱいに描画する"
set signcolumn=yes
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
set showtabline=2      "タブバーを常時表示する
set title             "タイトルバーにファイル名を表示
set termguicolors    "ターミナルの色を設定
set noswapfile        " swap fileを無効化する
set mouse=a            " mouse操作ができるようにする
set nocursorline             "カーソル行をハイライト
set whichwrap=b,s,h,l,<,>,[,] " hjklを使ってるときにカーソルを行頭、行末で止まらないようにする
set ignorecase            " 検索するときに大文字と小文字を区別しない
set autoindent
set autoread ar           "ファイルが更新されたら自動で採用見込みする"
" set viminfo=100
" set nobackup
" set fenc=utf-8
syntax off 
set showcmd
" set wildmode=list:longest
set completeopt=menu,menuone,noselect

nnoremap <Leader> <Nop>
xnoremap <Leader> <Nop>
nnoremap [dev]    <Nop>
xnoremap [dev]    <Nop>
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
nmap     m        [dev]
xmap     m        [dev]
nnoremap [ff]     <Nop>
xnoremap [ff]     <Nop>
nmap     +        [ff]
xmap     +        [ff]
" nmap    <C-g>        [fzf-p]
" xmap     <C-g>        [fzf-p]
nnoremap [fzf-p] <Nop>
xmap [fzf-p] <Nop>

nmap <C-p> [fzf-p]
xmap <C-p> [fzf-p]
" ---------------------------------------------------------------------
" --------------- plugin liest
"  ---------------------------------------------------------

lua require('plugins')

call plug#begin()




  Plug 'lambdalisue/fern.vim',{'on': 'Fern'}
  Plug 'lambdalisue/fern-git-status.vim',{'on': 'Fern'}
  Plug 'lambdalisue/nerdfont.vim',{'on': 'Fern'}
  Plug 'lambdalisue/fern-renderer-nerdfont.vim',{'on': 'Fern'}
  Plug 'lambdalisue/glyph-palette.vim',{'on':'Fern'}
  Plug 'lambdalisue/fern-bookmark.vim',{'on': 'Fern'}
  Plug 'lambdalisue/fern-hijack.vim' 
  Plug 'lambdalisue/gina.vim'
  Plug 't9md/vim-quickhl',{'on': ['<Plug>(quickhl-manual-this)','<Plug>(quickhl-manual-reset)']}
  Plug 'terryma/vim-expand-region',{'on':[ '<Plug>(expand_region_expand)','<Plug>(expand_region_shrink)']}
  Plug 'segeljakt/vim-silicon', { 'on': 'Silicon' }
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'vim-scripts/vim-auto-save'
  Plug 'vim-jp/vimdoc-ja'
  Plug 'vim-airline/vim-airline' ,{'on' : []}
  Plug 'vim-airline/vim-airline-themes' ,{'on' : []}
  " Plug 'github/copilot.vim'
  " Plug 'cohama/lexima.vim'
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'vim-denops/denops.vim'

  Plug 'alvan/vim-closetag',{'for': ['html','vue','javascript','javascriptreact','typescriptreact','typescript']}
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'p00f/nvim-ts-rainbow',{'on':[]}
  " Plug 'nvim-treesitter/nvim-treesitter' , {'on':[]}
  Plug 'nvim-treesitter/nvim-treesitter', {'on': [],'do': ':TSUpdate'}

  " Plug 'tomtom/tcomment_vim'
  Plug 'airblade/vim-gitgutter'
  " Plug 'RRethy/vim-illuminate'
  Plug 'MunifTanjim/nui.nvim'
  " Plug 'editorconfig/editorconfig-vim'
  Plug 'windwp/nvim-ts-autotag' ,{'on':[]}
  " Plug 'kyazdani42/nvim-web-devicons'
  Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }
  Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
  " Plug 'mhinz/vim-startify'
  Plug 'folke/which-key.nvim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'relastle/vim-colorrange', { 'on': ['ColorrangeIncrement' , 'ColorrangeDecrement'] }
  Plug 'lilydjwg/colorizer'
  Plug 'machakann/vim-highlightedyank', {'on':['<Plug>(highlightedyank)']}
  Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install',
  \ 'on': ['JsDoc']
  \}
  Plug 'tyru/open-browser.vim'
  Plug 't9md/vim-choosewin' , {'on': ['<Plug>(choosewin)']}
  " Plug 'skanehira/vsession'
  " Plug 'atelierbram/vim-colors_duotones'
  " Plug 'uloco/vim-bluloco-dark'
  Plug 'skanehira/jumpcursor.vim'
  " Plug 'petertriho/nvim-scrollbar'
 call plug#end()
" ---------------------------------------------
"  遅延読み込み
"  --------------------------------------------------
function! s:LazyLoadPlugs(timer) abort
  " save current position by marking Z because plug#load reloads current buffer
  normal! mZ
  call plug#load(
        \   'nvim-treesitter',
        \   'nvim-ts-rainbow',
        \   'nvim-ts-autotag',
        \   'vim-airline',
        \   'vim-airline-themes',
        \ )
  normal! g`Z
""
  delmarks Z
lua <<EOF
require("nvim-treesitter.configs").setup {
  highlight = {
      -- ...
    enable = true,
  },
  ensure_installed = 'all',
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 20, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  autotag = {
    enable = true,
  }
}

EOF
" source ~/.config/nvim/config/airline.vim
endfunction
" 40ms ごに ロードする
call timer_start(40, function("s:LazyLoadPlugs"))
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
   autocmd FileType nerdtree,startify call glyph_palette#apply()
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

lua <<EOF
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#3F0D11 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#664914 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#324921 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#215359 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#1060A1 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#67207D gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}

EOF

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
 let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'Dracula'
 let g:fzf_preview_use_dev_icons = 1

nnoremap <silent> [fzf-p]p     :<C-u>FzfPreviewFromResourcesRpc project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatusRpc<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>FzfPreviewGitActionsRpc<CR>
nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffersRpc<CR>
nnoremap <silent> [fzf-p]B     :<C-u>FzfPreviewAllBuffersRpc<CR>
nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewFromResourcesRpc buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>FzfPreviewJumpsRpc<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChangesRpc<CR>
nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLinesRpc --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLinesRpc --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>FzfPreviewProjectGrepRpc<Space>
xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrepRpc<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTagsRpc<CR>
nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFixRpc<CR>
nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLocationListRpc<CR>

nnoremap <silent> mf           :lua vim.lsp.buf.formatting()<CR>

lua require('mini')
lua require('whichikey')
""lua require('nvim-cmp')
" lua require('null-ls')
" lua require('nvim-scrollbar')

source ~/.config/nvim/config/mini.vim
source ~/.config/nvim/config/airline.vim
