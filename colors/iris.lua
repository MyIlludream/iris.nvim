if vim.g.colors_name then
  vim.cmd("highlight clear")
end

vim.g.colors_name = "iris"

require("iris").load()
