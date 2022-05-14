vim.cmd([[
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
""let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_filenames = '*.html,*.xhtml,*.vue'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

]])
