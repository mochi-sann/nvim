local function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)

  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end

  return table.concat(lines, '\n')
end

local function search_selection_in_google(text)
  local selected_text     = text
  local base_url          = 'https://www.google.com/search?q={search_text}'
  local base_cmd          = 'open {open_url}'
  local new_url           = base_url:gsub("{search_text}", selected_text)
  local open_cmd          = base_cmd:gsub("{open_url}", '"' .. new_url .. '"')
  local remove_line_break = open_cmd:gsub("\n", " ")
  vim.api.nvim_command("! " .. remove_line_break)
end

vim.api.nvim_create_user_command(
  'Selected2Google',
  function()
    local text = get_visual_selection()
    print(text)
    search_selection_in_google(text)
  end,
  { nargs = 0, range = true }
)
