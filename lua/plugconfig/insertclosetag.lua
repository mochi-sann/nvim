vim.cmd([[
  let g:loadedInsertTag = 1
inoremap <space>t <ESC> :call InsertClosingTag()<CR>i
k
]])
