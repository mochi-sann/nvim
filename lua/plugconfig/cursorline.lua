require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 150,
    number = false,
  },
  cursorword = {
    enable = false,
    min_length = 3,
    hl = { underline = true },
  }
}

