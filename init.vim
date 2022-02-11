
set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
set laststatus=2     
set showtabline=2      "タブバーを常時表示する
set title             "タイトルバーにファイル名を表示
set termguicolors    "ターミナルの色を設定
set noswapfile        " swap fileを無効化する
set mouse=a            " mouse操作ができるようにする
set cursorline             "カーソル行をハイライト
set showtabline=2 " 常にタブラインを表示




tnoremap <Esc> <C-\><C-n>
" hi clear CursorLine
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

"ターミナルでescでノーマルモードに戻る
":T コマンドでVSCodeみたいにターミナルを起動する
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
autocmd TermOpen * startinsert
call plug#begin()
Plug 'lambdalisue/fern.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-bookmark.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'dracula/vim'
Plug 'vim-scripts/vim-auto-save'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cohama/lexima.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-denops/denops.vim'
Plug 'alvan/vim-closetag'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 't9md/vim-quickhl'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'RRethy/vim-illuminate'
Plug 'MunifTanjim/nui.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'windwp/nvim-ts-autotag'
Plug 'terryma/vim-expand-region'
Plug 'lambdalisue/gina.vim'
Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }
call plug#end()


" plugin settings

colorschem dracula
let g:airline_theme='dracula'
let g:auto_save = 1
set helplang=ja
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:Illuminate_delay ="300"
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

  let g:coc_global_extensions = [
  \  "coc-clangd",
  \  "coc-css",
  \  "coc-deno",
  \  "coc-docker",
  \  "coc-emmet",
  \  "coc-eslint",
  \  "coc-flutter",
  \  "coc-fzf-preview",
  \  "coc-git",
  \  "coc-json",
  \  "coc-jsref",
  \  "coc-lists",
  \  "coc-markdown-preview-enhanced",
  \  "coc-markdownlint",
  \  "coc-marketplace",
  \  "coc-npm-version",
  \  "coc-prettier",
  \  "coc-prisma",
  \  "coc-react-refactor",
  \  "coc-rls",
  \  "coc-rust-analyzer",
  \  "coc-sh",
  \  "coc-simple-react-snippets",
  \  "coc-snippets",
  \  "coc-svelte",
  \  "coc-tabnine",
  \  "coc-tailwindcss",
  \  "coc-toml",
  \  "coc-tsserver",
  \  "coc-vetur",
  \  "coc-webview",
  \  "coc-yaml"
  \]
  " Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" plugin Settings end 
""dein Scripts-----------------------------
"if &compatible
"  set nocompatible               " Be iMproved
"endif
"
"" Required:
"set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
"
"" Required:
"if dein#load_state('~/.config/nvim/dein')
"  call dein#begin('~/.config/nvim/dein')
"
"  " Let dein manage dein
"  " Required:
"  call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')
"
"  " Add or remove your plugins here like this:
"  "call dein#add('Shougo/neosnippet.vim')
"  "call dein#add('Shougo/neosnippet-snippets')
"
"  " dein begin
"  call dein#begin($HOME . '/.config/nvim/dein')
"
" " プラグインリストを収めた TOML ファイル
" " 予め TOML ファイル（後述）を用意しておく
" let s:toml_dir  = $HOME . '/.config/nvim/toml' 
"" let s:tomlb     = s:toml_dir . '/brightest.toml'
" let s:toml      = s:toml_dir . '/dein.toml'
" let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
"
" " TOML を読み込み、キャッシュしておく
" call dein#load_toml(s:toml,      {'lazy': 0})
"" call dein#load_toml(s:tomlb,     {'lazy': 0})
" call dein#load_toml(s:lazy_toml, {'lazy': 1})
"
"  " Required:
"  call dein#end()
"  call dein#save_state()
"endif
"
"" Required:
"filetype plugin indent on
" syntax enable
"
"
""If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
"
""End dein Scripts-------------------------
" map prefix

let g:mapleader = "\<Space>"
nnoremap <Leader> <Nop>
xnoremap <Leader> <Nop>
nnoremap [dev]    <Nop>
xnoremap [dev]    <Nop>
nmap     m        [dev]
xmap     m        [dev]
nnoremap [ff]     <Nop>
xnoremap [ff]     <Nop>
nmap     Z        [ff]
xmap     Z        [ff]


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
set updatetime=300

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


" vim.opt.list = true
" vim.opt.listchars:append("eol:↴")

" require("indent_blankline").setup {
"     show_end_of_line = true,
" }




" 背景をなくす
 augroup TransparentBG
   autocmd!
 	" autocmd Colorscheme * highlight Normal ctermbg=none
 "	autocmd Colorscheme * highlight NonText ctermbg=none
 "	autocmd Colorscheme * highlight LineNr ctermbg=none
 "	autocmd Colorscheme * highlight Folded ctermbg=none
 "	autocmd Colorscheme * highlight EndOfBuffer ctermbg=none 
 augroup END






lua <<EOF



EOF


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


" fzf settings  https://github.com/yuki-yano/fzf-preview.vim
nmap f [fzf-p]
xmap f [fzf-p]

nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>










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
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
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
        \ {"text": "(o)pen vsplit", "value": "vsplit"},
        \ {"text": "(v)slit", "value": "vsplit"},
        \ {"text": "(t)ab", "value": "tabedit"},
        \ ]
  return ChoseAction(actions)
endfunction

nnoremap <silent> <C-t> :<C-u>call CocActionAsync('jumpDefinition', CocJumpAction())<CR>



" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype tsx inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype typescriptreact inoremap <buffer> </ </<C-x><C-o>

augroup END




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



" coc-snipet

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)



map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

source ~/.config/nvim/config/fern.vim
source ~/.config/nvim/config/coc.nvim.vim
source ~/.config/nvim/config/mini.vim
