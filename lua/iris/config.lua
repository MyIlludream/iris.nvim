local M = {}

M.defaults = {
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    strings = {},
    variables = {},
  },
  palette = {},
  highlights = {},
  on_colors = nil,
  on_highlights = nil,
}

local options = vim.deepcopy(M.defaults)

function M.extend(user)
  options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), user or {})
  return options
end

function M.get()
  return options
end

return M
