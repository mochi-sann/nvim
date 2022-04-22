require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
  },
    ensure_installed = { "c", "lua", "rust","astro", "bash" , "cmake","dockerfile","go","html","javascript","json","json5","latex","lua","markdown","php","prisma","python","ruby", "rust","svelte","tsx","typescript", "vim","vue","yaml" },

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
