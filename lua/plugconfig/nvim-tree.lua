local config = {
  renderer = {

    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },
    },
  },
  view = {
    side = "right",

    mappings = {
      custom_only = false,
      list = {
        { key = "l", action = "edit", action_cb = edit_or_open },
        { key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
        { key = "h", action = "close_node" },
        { key = "H", action = "collapse_all", action_cb = collapse_all }
      }
    },
  },
  actions = {
    open_file = {
      quit_on_open = false
    }
  },
  git = {
    ignore = false
  }
}

vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
require("nvim-tree").setup(config)
