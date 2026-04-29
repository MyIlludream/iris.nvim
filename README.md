# iris.nvim

Neovim 主题。

## 安装

Neovim 0.12+ 可直接使用 `vim.pack`：

```lua
vim.pack.add({
  {
    src = "https://github.com/your-name/iris.nvim",
    name = "iris",
  },
})

require("iris").setup({
  transparent = false,
})

vim.cmd.colorscheme("iris")
```

如果你是在本地开发这个仓库，也可以直接指向本地仓库路径：

```lua
vim.pack.add({
  {
    src = "file:///D:/iris.nvim",
    name = "iris",
  },
})
```

`vim.pack` 会把 `src` 当成 Git 源处理，所以本地仓库至少需要有一个提交。

## 内置调色板

下面这些名字都可以在 `palette = { ... }` 里覆盖：

| 名字                | 色值        |
| ------------------- | ----------- |
| `none`            | `NONE`    |
| `bg`              | `#212121` |
| `bg_dark`         | `#1a1a1a` |
| `bg_float`        | `#1f1f1f` |
| `bg_highlight`    | `#2b2b2b` |
| `bg_visual`       | `#616161` |
| `bg_search`       | `#000000` |
| `fg`              | `#ecffff` |
| `fg_dark`         | `#8d8d8d` |
| `fg_gutter`       | `#424242` |
| `fg_comment`      | `#3e9cc7` |
| `fg_comment_soft` | `#4ba7d0` |
| `border`          | `#444444` |
| `accent`          | `#82cd64` |
| `accent_2`        | `#89ddff` |
| `red`             | `#f07178` |
| `red_bright`      | `#ff6969` |
| `orange`          | `#f78c6c` |
| `yellow`          | `#ffcb6b` |
| `green`           | `#90cc89` |
| `green_bright`    | `#c3e88d` |
| `cyan`            | `#80cbc4` |
| `blue`            | `#6b9aff` |
| `blue_bright`     | `#78dcf3` |
| `purple`          | `#b9adff` |
| `magenta`         | `#a36ac7` |
| `white`           | `#ffffff` |
| `black`           | `#1d1f21` |
| `cursor`          | `#ff6969` |
| `error`           | `#ff6969` |
| `warning`         | `#ffcb6b` |
| `info`            | `#78d9ff` |
| `hint`            | `#80cbc4` |
| `diff_add`        | `#9bb955` |
| `diff_delete`     | `#f07178` |
| `diff_change`     | `#89ddff` |
| `selection`       | `#616161` |

## 配置

最小示例：

```lua
require("iris").setup({
  transparent = false,
})
```

完整可配置示例：

```lua
require("iris").setup({
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = { bold = false },
    strings = {},
    variables = { italic = false },
  },
  palette = {
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
    accent = "#7fd15f",
    accent_2 = "#89ddff",
    red = "#f07178",
    red_bright = "#ff6969",
    orange = "#f78c6c",
    yellow = "#ffcb6b",
    green = "#90cc89",
    green_bright = "#c3e88d",
    cyan = "#80cbc4",
    blue = "#6b9aff",
    blue_bright = "#78dcf3",
    purple = "#b9adff",
    magenta = "#a36ac7",
    white = "#ffffff",
    black = "#1d1f21",
    cursor = "#ff8080",
    error = "#ff6969",
    warning = "#ffcb6b",
    info = "#78d9ff",
    hint = "#80cbc4",
    diff_add = "#9bb955",
    diff_delete = "#f07178",
    diff_change = "#89ddff",
    selection = "#616161",
  },
  highlights = {
    Normal = { bg = "NONE" },
    FloatBorder = { fg = "#7fd15f" },
    Comment = { fg = "#3e9cc7", italic = true },
    CursorLineNr = { fg = "#7fd15f", bold = true },
  },
  on_colors = function(colors)
    colors.diff_add = "#9ad17b"
    colors.fg_comment = "#56b6e2"
  end,
  on_highlights = function(highlights, colors)
    highlights.CursorLineNr = { fg = colors.accent, bold = true }
    highlights.TelescopeBorder = { fg = colors.accent, bg = colors.bg_dark }
    highlights.CmpItemAbbrMatch = { fg = colors.accent, bold = true }
  end,
})
```

## 自定义方式

- `palette`: 覆盖主题内部命名颜色。
- `highlights`: 直接覆盖任何高亮组。
- `on_colors(colors)`: 在生成高亮前动态修改调色板。
- `on_highlights(highlights, colors)`: 在应用前动态修改高亮表。

## 说明

- 主题主色和语义色来自 `iris-color-theme.json`。
- 额外合并了你提供的 VS Code `editor.tokenColorCustomizations`，注释与 docstring 会偏蓝青色。
- VS Code 中带透明度的颜色已按 Neovim 能力做近似映射。
- 已包含基础 UI、语法、Tree-sitter、LSP 诊断、Git，以及 `telescope.nvim`、`nvim-cmp`、`gitsigns.nvim`、`mini.nvim`、`noice.nvim`、`nvim-notify`、`trouble.nvim`、`flash.nvim`、`neo-tree.nvim`、`oil.nvim`、`lazy.nvim`、`which-key.nvim`、`indent-blankline.nvim`、`dashboard-nvim` / `alpha-nvim`、`snacks.nvim` 的常见高亮。
