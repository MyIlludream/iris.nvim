local config = require("iris.config")
local palette = require("iris.palette")
local theme = require("iris.theme")

local M = {}

local function resolve_opts(overrides)
  if overrides == nil then
    return config.get()
  end

  return vim.tbl_deep_extend("force", config.get(), overrides)
end

local function set_terminal_colors(colors)
  vim.g.terminal_color_0 = colors.black
  vim.g.terminal_color_1 = colors.red_bright
  vim.g.terminal_color_2 = "#6fc674"
  vim.g.terminal_color_3 = "#ffbb6c"
  vim.g.terminal_color_4 = colors.blue_bright
  vim.g.terminal_color_5 = colors.magenta
  vim.g.terminal_color_6 = colors.blue_bright
  vim.g.terminal_color_7 = "#c5c8c6"
  vim.g.terminal_color_8 = "#a8b4a8"
  vim.g.terminal_color_9 = colors.red_bright
  vim.g.terminal_color_10 = "#6fc674"
  vim.g.terminal_color_11 = "#ffbb6c"
  vim.g.terminal_color_12 = colors.blue_bright
  vim.g.terminal_color_13 = colors.magenta
  vim.g.terminal_color_14 = colors.blue_bright
  vim.g.terminal_color_15 = colors.white
end

function M.setup(opts)
  config.extend(opts)
end

function M.colors(overrides)
  return palette.get(resolve_opts(overrides))
end

function M.highlights(overrides)
  local opts = resolve_opts(overrides)
  local colors = palette.get(opts)
  return theme.get(colors, opts)
end

function M.rainbow(overrides)
  local colors = M.colors(overrides)

  return {
    colors.yellow,
    colors.magenta,
    colors.blue_bright,
    colors.orange,
    colors.green_bright,
    colors.purple,
    colors.cyan,
  }
end

function M.load()
  local opts = config.get()
  local colors = M.colors()
  local highlights = M.highlights()

  vim.o.termguicolors = true
  vim.o.background = "dark"

  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end

  vim.g.colors_name = "iris"

  if opts.terminal_colors then
    set_terminal_colors(colors)
  end

  for group, spec in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

return M
