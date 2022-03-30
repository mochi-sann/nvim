set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
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
set autoread           "ファイルが更新されたら自動で採用見込みする"
" set nobackup
" set fenc=utf-8
syntax on
set showcmd
" set wildmode=list:longest

nnoremap <Leader> <Nop>
xnoremap <Leader> <Nop>
nnoremap [dev]    <Nop>
xnoremap [dev]    <Nop>
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
call plug#begin()
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
  Plug 'joshdick/onedark.vim'
  Plug 'vim-scripts/vim-auto-save'
  Plug 'vim-jp/vimdoc-ja'
  Plug 'vim-airline/vim-airline' ,{'on' : []}
  Plug 'vim-airline/vim-airline-themes' ,{'on' : []}
  " Plug 'github/copilot.vim'
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
  Plug 'relastle/vim-colorrange', { 'on': ['ColorrangeIncrement' , 'ColorrangeDecrement'] }
  Plug 'lilydjwg/colorizer'
  Plug 'machakann/vim-highlightedyank', {'on':['<Plug>(highlightedyank)']}
  Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
  \}
  Plug 'tyru/open-browser.vim'
  Plug 't9md/vim-choosewin' , {'on': ['<Plug>(choosewin)']}

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
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
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
"  vim auto save
let g:auto_save = 1
" let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
 let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
" help の言語を日本語にする
set helplang=ja

"--------------------------------
" ヤンクしたときにhighlightする
""if !exists('##TextYankPost')
  nmap y <Plug>(highlightedyank)
  xmap y <Plug>(highlightedyank)
  omap y <Plug>(highlightedyank)
""endif
let g:highlightedyank_highlight_duration = 500



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





"---------------------------------------------------------- coc.nvim の設定


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
