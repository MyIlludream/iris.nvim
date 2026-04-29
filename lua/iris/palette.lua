local M = {}

function M.get(opts)
  local colors = {
    none = "NONE",
    bg = "#212121",
    bg_dark = "#1a1a1a",
    bg_float = "#1f1f1f",
    bg_highlight = "#2b2b2b",
    bg_visual = "#616161",
    bg_search = "#000000",
    fg = "#ecffff",
    fg_dark = "#8d8d8d",
    fg_gutter = "#424242",
    fg_comment = "#3e9cc7",
    fg_comment_soft = "#4ba7d0",
    border = "#444444",
    accent = "#82cd64",
    accent_2 = "#89ddff",
    red = "#f07178",
    red_bright = "#ff6969",
    orange = "#f78c6c",
    yellow_bright = "#ffd700",
    yellow = "#ffcb6b",
    green = "#90cc89",
    green_bright = "#c3e88d",
    cyan = "#80cbc4",
    blue_bright = "#78dcf3",
    blue = "#179fff",
    blue_dark = "#6b9aff",
    purple = "#b9adff",
    magenta = "#da70d6",
    white = "#ffffff",
    black = "#1d1f21",
    cursor = "#ff6969",
    error = "#ff6969",
    warning = "#ffcb6b",
    info = "#78d9ff",
    hint = "#80cbc4",
    diff_add = "#9bb955",
    diff_delete = "#f07178",
    diff_change = "#89ddff",
    selection = "#616161",
  }

  colors = vim.tbl_deep_extend("force", colors, opts.palette or {})

  if type(opts.on_colors) == "function" then
    opts.on_colors(colors)
  end

  return colors
end

return M
