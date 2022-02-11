lua <<EOF

require('mini.misc').setup({
    palette = nil,
  use_cterm = nil,

sessions = {
  make_global = { 'put', 'put_text', 'zoom'}
    " -- Whether to read latest session if Neovim opened without file arguments
  autoread = false,

  " -- Whether to write current session before quitting Neovim
  autowrite = true,

  " -- Directory where global sessions are stored (use `''` to disable)
  directory = "~/.config/sessions"--<"session" subdir of user data directory from |stdpath()|>,

  " -- File for local session (use `''` to disable)
  file = 'Session.vim',

  " -- Whether to force possibly harmful actions (meaning depends on function)
  force = { read = false, write = true, delete = false },

  " -- Whether to print session path after action
  verbose = { read = false, write = true, delete = true },
  }
})
 
EOF