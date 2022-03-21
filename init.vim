" denops プラグイン開発するためのところ"
"set runtimepath^=~/workspace/color-code-hilight.vim
"let g:denops#debug = 0   "1でデバッグモードになる"



set number             "行番号を表示
set laststatus=3
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
syntax on
set showcmd

" nnoremap <Leader> <Nop>
" xnoremap <Leader> <Nop>
nnoremap [dev]    <Nop>
xnoremap [dev]    <Nop>
nmap     m        [dev]
xmap     m        [dev]
nnoremap [ff]     <Nop>
xnoremap [ff]     <Nop>
nmap     +        [ff]
xmap     +        [ff]
nmap    <C-g>        [fzf-p]
xmap     <C-g>        [fzf-p]


let g:did_install_default_menus = 1
let g:did_install_syntax_menu   = 1
let g:did_indent_on             = 1
let g:did_load_filetypes        = 1
let g:did_load_ftplugin         = 1
let g:loaded_2html_plugin       = 1
let g:loaded_gzip               = 1
let g:loaded_man                = 1
let g:loaded_matchit            = 1
let g:loaded_matchparen         = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_remote_plugins     = 1
let g:loaded_shada_plugin       = 1
let g:loaded_spellfile_plugin   = 1
let g:loaded_tarPlugin          = 1
let g:loaded_tutor_mode_plugin  = 1
let g:loaded_zipPlugin          = 1
let g:skip_loading_mswin        = 1


tnoremap <Esc> <C-\><C-n>
" tnoremap <C-;> <C-\><C-n>
" hi clear CursorLine
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

"ターミナルでescでノーマルモードに戻る
":T コマンドでVSCodeみたいにターミナルを起動する
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
" autocmd TermOpen * startinsert
call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  
  Plug 'lambdalisue/fern.vim',{'on': 'Fern'}
  Plug 'lambdalisue/fern-git-status.vim',{'on': 'Fern'}
  Plug 'lambdalisue/nerdfont.vim',{'on': 'Fern'}
  Plug 'lambdalisue/fern-renderer-nerdfont.vim',{'on': 'Fern'}
  Plug 'lambdalisue/glyph-palette.vim'
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
  Plug 'github/copilot.vim'
  " Plug 'cohama/lexima.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-denops/denops.vim'

  Plug 'alvan/vim-closetag',{}
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'p00f/nvim-ts-rainbow',{'on':[]}
  Plug 'nvim-treesitter/nvim-treesitter' , {'on':[]}
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
  "Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' , 'for':['javascript','javascriptreact','typescript','typescriptreact']}

  Plug 'machakann/vim-highlightedyank', {'on':['<Plug>(highlightedyank)']}
  Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
  \}
  " Plug 'glepnir/dashboard-nvim'

" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'

  " Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }


call plug#end()
" Load Event
" 遅延読み込み"
function! s:LazyLoadPlugs(timer) abort
  " save current position by marking Z because plug#load reloads current buffer
  normal! mZ
  call plug#load(
        \   'coc.nvim',
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
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  autotag = {
    enable = true,
  }
}

EOF
source ~/.config/nvim/config/coc.nvim.vim
" source ~/.config/nvim/config/airline.vim
endfunction

call timer_start(40, function("s:LazyLoadPlugs"))

let g:mapleader = "\<Space>"



" plugin settings

"let g:airline_theme='dracula'
let g:auto_save = 1
set helplang=ja
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:Illuminate_delay ="300"
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
" plugin Settings end 
" map prefix

map <C-l> <Plug>(expand_region_expand)
map <C-h> <Plug>(expand_region_shrink)


""if !exists('##TextYankPost')
  nmap y <Plug>(highlightedyank)
  xmap y <Plug>(highlightedyank)
  omap y <Plug>(highlightedyank)
""endif
let g:highlightedyank_highlight_duration = 500


"" coc vim settings

  " Set internal encoding of vim, not needed on neovim, since coc.nvim using some

" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
"set hidden

" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup

" Give more space for displaying messages.
"set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
""set updatetime=300

" Don't pass messages to |ins-completion-menu|.
"set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this ito your config.
" Ctrl+nでファイルツリーを表示/非表示する
" // nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>
" ファイルアイコンを表示
let g:fern#renderer = 'nerdfont'


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

" vim.opt.list = true
" vim.opt.listchars:append("eol:↴")

" require("indent_blankline").setup {
"     show_end_of_line = true,
" }


colorschem dracula

" 背景をなくす
 augroup TransparentBG
  autocmd!
  autocmd Colorscheme * highlight Normal ctermbg=none
  autocmd Colorscheme * highlight NonText ctermbg=none
  autocmd Colorscheme * highlight LineNr ctermbg=none
  autocmd Colorscheme * highlight Folded ctermbg=none
  autocmd Colorscheme * highlight EndOfBuffer ctermbg=none 
 augroup END

" ------------------------------ vim-startify settings
" " 'Most Recent Files' number
"  let g:startify_files_number           = 12
"  let g:startify_fortune_use_unicode = 1
" " " Update session automatically as you exit vim
"  let g:startify_session_persistence    = 1
" "
" " " Simplify the startify list to just recent files and sessions
" let g:startify_lists = [
"           \ { 'type': 'sessions',  'header': ['   Sessions']       },
"           \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
"           \ { 'type': 'files',     'header': ['   Files']            },
"           \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
"           \ ]
" let g:startify_bookmarks = [
"             \ { 'c': '~/.config/i3/config' },
"             \ { 'n': '~/.config/nvim/init.vim' },
"             \ { 'z': '~/.zshrc' },
"             \ ]
" "  let g:startify_session_dir = '~/.config/nvim/session'
"  let g:startify_custom_header = [
"            \ '    _   _         __     ___         ',
"            \ '   | \ | | ___  __\ \   / (_)________  ',
"            \ '   |  \| |/ _ \/ _ \ \ / /| |  _   _ \  ',
"            \ '   | |\  |  __/ (_) \ V / | | | | | | |',
"            \ '   |_| \_|\___|\___/ \_/  |_|_| |_| |_| ',
"            \]
"
" " " `SPC l s` - save current session
"  nnoremap <leader>ls :SSave<CR>
" "
" " " `SPC l l` - list sessions / switch to different project
"  nnoremap <leader>ll :SClose<CR>




"  vim.opt.listchars:append("space:⋅")


" # vim.opt.listchars:append("eol:↴")
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
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
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



let g:dashboard_default_executive ='fzf'

" auto reload .vimrc
 " "augroup source-vimrc
 " "  autocmd!
 " "  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
 " "  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
 " "augroup END
 " "
 " "" auto comment off
 " "augroup auto_comment_off
 " "  autocmd!
 " "  autocmd BufEnter * setlocal formatoptions-=r
 " "  autocmd BufEnter * setlocal formatoptions-=o
 " "augroup END
 " "
 " "" HTML/XML閉じタグ自動補完
 " "augroup MyXML
 " "  autocmd!
 " "  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
 " "  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
 " "  autocmd Filetype tsx inoremap <buffer> </ </<C-x><C-o>
 " "  autocmd Filetype typescriptreact inoremap <buffer> </ </<C-x><C-o>
 " "
 " "augroup END

"
" set laststatus=2



lua require('mini')
lua require('whichikey')
source ~/.config/nvim/config/mini.vim
source ~/.config/nvim/config/airline.vim
