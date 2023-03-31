vim.api.nvim_set_keymap("n", "J", "<Plug>(faster_move_j)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "K", "<Plug>(faster_move_k)", { noremap = false, silent = true })
-- or
-- vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_gj)', {noremap=false, silent=true})
-- vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_gk)', {noremap=false, silent=true})
-- if you need map in visual mode
-- vim.api.nvim_set_keymap('v', 'j', '<Plug>(faster_vmove_j)', {noremap=false, silent=true})
-- vim.api.nvim_set_keymap('v', 'k', '<Plug>(faster_vmove_k)', {noremap=false, silent=true})
