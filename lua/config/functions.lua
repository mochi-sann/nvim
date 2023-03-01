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

function search_selection_in_google()
  local selected_text = get_visual_selection()
  local base_url      = 'https://www.google.com/search?q='
  local base_cmd      = 'open '
  local new_url       = base_url .. selected_text
  local open_cmd      = base_cmd .. '"' .. new_url .. '"'
  print(open_cmd)
  print(new_url)
  vim.api.nvim_command("! " .. open_cmd)
end
