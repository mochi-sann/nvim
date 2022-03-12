let g:airline_theme = 'dracula'               " テーマの指定
let g:airline#extensions#tabline#enabled = 1 " タブラインを表示
let g:airline_powerline_fonts = 1            " Powerline Fontsを利用

  let g:airline_filetype_overrides = {
      \ 'coc-explorer':  [ 'CoC Explorer', '' ],
      \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
      \ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
      \ 'floggraph':  [ 'Flog', '%{get(b:, "flog_status_summary", "")}' ],
      \ 'gundo': [ 'Gundo', '' ],
      \ 'help':  [ 'Help', '%f' ],
      \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
      \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
      \ 'startify': [ 'startify', '' ],
      \ 'vim-plug': [ 'Plugins', '' ],
      \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
      \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
      \ 'vaffle' : [ 'Vaffle', '%{b:vaffle.dir}' ],
      \ }


  let g:airline#extensios#branch#format = 0

  " let g:airline_extensions = ['fern', 'tabline','gina','coc','fzf','po','term','whitespace','wordcount','tablin]

    let g:airline#extensions#gina#enabled = 1


  let g:airline#extensions#tabline#buffer_idx_mode = 1

nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
" for n in range(1, 9)
"   execute 'nnoremap <silent> [Tag]'.n  '<Plug>AirlineSelectTab'.n
" endfor

  nmap [Tag]1 <Plug>AirlineSelectTab1
  nmap [Tag]2 <Plug>AirlineSelectTab2
  nmap [Tag]3 <Plug>AirlineSelectTab3
  nmap [Tag]4 <Plug>AirlineSelectTab4
  nmap [Tag]5 <Plug>AirlineSelectTab5
  nmap [Tag]6 <Plug>AirlineSelectTab6
  nmap [Tag]7 <Plug>AirlineSelectTab7
  nmap [Tag]8 <Plug>AirlineSelectTab8
  nmap [Tag]9 <Plug>AirlineSelectTab9
  nmap [Tag]0 <Plug>AirlineSelectTab0
  nmap [Tag]- <Plug>AirlineSelectPrevTab
  nmap [Tag]+ <Plug>AirlineSelectNextTab

 let g:airline#extensions#tabline#buffer_idx_format = {
        \ '0': '0 ',
        \ '1': '1 ',
        \ '2': '2 ',
        \ '3': '3 ',
        \ '4': '4 ',
        \ '5': '5 ',
        \ '6': '6 ',
        \ '7': '7 ',
        \ '8': '8 ',
        \ '9': '9 '
        \}



""let g:airline#extensions#default#layout = [
""	\ [ 'a', 'branch','z', 'y', 'x' ],
""	\ [ 'c', 'b', 'a', 'error', 'warning']
""	\ ]


