local config = require("iris.config")
local palette = require("iris.palette")
local theme = require("iris.theme")

local M = {}

local function sanitize_highlight(spec)
  if type(spec) ~= "table" then
    return spec
  end

  return spec
end

local function resolve_opts(overrides)
  if overrides == nil then
    return config.get()
  end

  return vim.tbl_deep_extend("force", config.get(), overrides)
end

local function set_terminal_colors(colors)
  vim.g.terminal_color_0 = colors.black
  vim.g.terminal_color_1 = colors.red_400
  vim.g.terminal_color_2 = colors.green_500
  vim.g.terminal_color_3 = colors.yellow_600
  vim.g.terminal_color_4 = colors.blue_500
  vim.g.terminal_color_5 = colors.magenta_500
  vim.g.terminal_color_6 = colors.cyan_600
  vim.g.terminal_color_7 = colors.text_secondary
  vim.g.terminal_color_8 = colors.text_muted
  vim.g.terminal_color_9 = colors.red_500
  vim.g.terminal_color_10 = colors.green_400
  vim.g.terminal_color_11 = colors.yellow_500
  vim.g.terminal_color_12 = colors.blue_400
  vim.g.terminal_color_13 = colors.magenta_400
  vim.g.terminal_color_14 = colors.cyan_500
  vim.g.terminal_color_15 = colors.paper
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
    colors.rainbow_2,
    colors.rainbow_1,
    colors.rainbow_3,
    colors.rainbow_4,
    colors.rainbow_5,
    colors.rainbow_6,
    colors.rainbow_7,
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
    vim.api.nvim_set_hl(0, group, sanitize_highlight(spec))
  end
end

return M
