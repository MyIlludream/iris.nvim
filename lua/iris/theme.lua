local M = {}

local function style(spec, extra)
  return vim.tbl_extend("force", spec or {}, extra or {})
end

function M.get(colors, opts)
  local transparent_bg = opts.transparent and colors.none or colors.bg
  local transparent_bg_dark = opts.transparent and colors.none or colors.bg_dark

  local highlights = {
    ColorColumn = { bg = colors.bg_highlight }, -- 用于 'colorcolumn' 设置的列高亮
    Conceal = { fg = colors.fg_dark }, -- 被隐藏文本的替代占位符高亮
    CurSearch = { fg = colors.black, bg = colors.accent }, -- 当前搜索命中的匹配高亮
    Cursor = { fg = colors.bg, bg = colors.cursor }, -- 光标下的字符高亮
    lCursor = { fg = colors.bg, bg = colors.cursor }, -- 语言映射下的光标高亮
    CursorColumn = { bg = colors.bg_highlight }, -- 光标所在的列高亮
    CursorIM = { fg = colors.bg, bg = colors.cursor }, -- 输入法激活时的光标高亮
    CursorLine = { bg = colors.bg_highlight }, -- 光标所在的行高亮
    CursorLineNr = { fg = colors.accent, bold = true }, -- 光标所在行的行号高亮
    Directory = { fg = colors.accent }, -- 目录名称及列表中的特殊名称高亮
    DiffAdd = { bg = "#2c3827", fg = colors.green_bright }, -- diff 模式下新增的内容
    DiffChange = { bg = "#223743", fg = colors.accent_2 }, -- diff 模式下改变的内容
    DiffDelete = { bg = "#40272d", fg = colors.red }, -- diff 模式下删除的内容
    DiffText = { bg = "#35515d", fg = colors.blue_bright }, -- diff 模式下改变内容的具体差异
    EndOfBuffer = { fg = colors.bg }, -- 文件末尾之后的填充符 (~)
    ErrorMsg = { fg = colors.error }, -- 错误消息高亮
    FloatBorder = { fg = colors.border, bg = transparent_bg_dark }, -- 浮动窗口边框
    FloatTitle = { fg = colors.accent, bg = transparent_bg_dark, bold = true }, -- 浮动窗口标题
    FoldColumn = { fg = colors.fg_gutter, bg = transparent_bg }, -- 用于显示折叠状态的列
    Folded = { fg = colors.fg_dark, bg = colors.bg_dark }, -- 被折叠的行
    IncSearch = { fg = colors.black, bg = colors.yellow }, -- 增量搜索时的匹配预览
    LineNr = { fg = colors.fg_gutter }, -- 普通行号
    MatchParen = { fg = colors.yellow, bold = true }, -- 匹配的括号对
    ModeMsg = { fg = colors.accent, bold = true }, -- 'showmode' 消息 (如 "-- INSERT --")
    MoreMsg = { fg = colors.accent }, -- 'more-prompt' 消息 (如 "-- More --")
    NonText = { fg = colors.fg_gutter }, -- 窗口中的非文本字符
    Normal = { fg = colors.fg, bg = transparent_bg }, -- 普通文本及背景
    NormalFloat = { fg = colors.fg, bg = transparent_bg_dark }, -- 浮动窗口中的普通文本
    NormalNC = { fg = colors.fg, bg = transparent_bg }, -- 非当前窗口中的普通文本
    Pmenu = { fg = colors.fg, bg = transparent_bg_dark }, -- 弹出菜单 (如补全列表)
    PmenuSbar = { bg = colors.bg_highlight }, -- 弹出菜单滚动条背景
    PmenuSel = { fg = colors.accent, bg = colors.bg_highlight }, -- 弹出菜单选中项
    PmenuThumb = { bg = colors.accent }, -- 弹出菜单滚动条滑块
    Question = { fg = colors.accent }, -- 询问用户的提示语
    QuickFixLine = { bg = colors.bg_highlight, bold = true }, -- Quickfix 窗口中的当前选中行
    Search = { fg = colors.fg, bg = colors.bg_search }, -- 搜索匹配的高亮
    SignColumn = { fg = colors.fg_gutter, bg = transparent_bg }, -- 显示诊断符号、断点等的边距列
    SpecialKey = { fg = colors.accent_2 }, -- 特殊键及 'listchars' 字符
    SpellBad = { sp = colors.error, undercurl = true }, -- 拼写错误的单词
    SpellCap = { sp = colors.info, undercurl = true }, -- 首字母未大写的单词
    SpellLocal = { sp = colors.hint, undercurl = true }, -- 局部拼写错误的单词
    SpellRare = { sp = colors.purple, undercurl = true }, -- 罕见单词
    StatusLine = { fg = colors.fg_dark, bg = colors.bg_dark }, -- 当前窗口状态栏
    StatusLineNC = { fg = colors.fg_gutter, bg = colors.bg_dark }, -- 非当前窗口状态栏
    Substitute = { fg = colors.black, bg = colors.orange }, -- ':substitute' 替换预览
    TabLine = { fg = colors.fg_dark, bg = colors.bg_dark }, -- 标签页栏
    TabLineFill = { bg = colors.bg_dark }, -- 标签页栏空白填充
    TabLineSel = { fg = colors.accent, bg = colors.bg, bold = true }, -- 当前选中的标签页
    Title = { fg = colors.accent, bold = true }, -- 标题
    VertSplit = { fg = colors.border }, -- 垂直分割窗口的分隔符
    Visual = { bg = colors.selection }, -- 视觉模式选中的区域
    WarningMsg = { fg = colors.warning }, -- 警告消息
    Whitespace = { fg = colors.fg_gutter }, -- 空白字符
    WildMenu = { fg = colors.black, bg = colors.accent }, -- 命令行补全菜单
    WinBar = { fg = colors.fg_dark, bg = transparent_bg }, -- 窗口顶部栏
    WinBarNC = { fg = colors.fg_gutter, bg = transparent_bg }, -- 非当前窗口顶部栏
    WinSeparator = { fg = colors.border }, -- 窗口分隔符

    Comment = style({ fg = colors.fg_comment }, opts.styles.comments), -- 注释
    Constant = { fg = colors.red }, -- 常量
    String = style({ fg = colors.green }, opts.styles.strings), -- 字符串
    Character = { fg = colors.green }, -- 字符
    Number = { fg = colors.red }, -- 数字
    Boolean = { fg = colors.red }, -- 布尔值
    Float = { fg = colors.red }, -- 浮点数
    Identifier = style({ fg = colors.fg }, opts.styles.variables), -- 标识符
    Function = style({ fg = colors.blue_dark }, opts.styles.functions), -- 函数
    Statement = style({ fg = colors.red }, opts.styles.keywords), -- 语句 (如 if, while)
    Conditional = style({ fg = colors.red }, opts.styles.keywords), -- 条件语句
    Repeat = style({ fg = colors.red }, opts.styles.keywords), -- 循环语句
    Label = { fg = colors.orange }, -- 标签
    Operator = { fg = colors.accent_2 }, -- 运算符
    Keyword = style({ fg = colors.red }, opts.styles.keywords), -- 关键字
    Exception = style({ fg = colors.red }, opts.styles.keywords), -- 异常处理
    PreProc = { fg = colors.orange }, -- 预处理指令
    Include = { fg = colors.yellow }, -- 包含指令 (如 #include)
    Define = { fg = colors.accent_2 }, -- 定义指令 (如 #define)
    Macro = { fg = colors.blue_dark }, -- 宏
    PreCondit = { fg = colors.red }, -- 预处理条件
    Type = { fg = colors.yellow }, -- 类型 (如 int, long)
    StorageClass = { fg = colors.purple }, -- 存储类型 (如 static, extern)
    Structure = { fg = colors.yellow }, -- 结构体定义 (如 struct, enum)
    Typedef = { fg = colors.yellow }, -- 类型定义
    Special = { fg = colors.accent_2 }, -- 特殊符号
    SpecialChar = { fg = colors.accent_2 }, -- 特殊字符 (如 \n)
    Tag = { fg = colors.red }, -- 标签 (如 HTML 标签)
    Delimiter = { fg = colors.blue_bright }, -- 分隔符
    SpecialComment = style({ fg = colors.fg_comment_soft, italic = true }, opts.styles.comments), -- 特殊注释 (如 Doxygen)
    Debug = { fg = colors.red }, -- 调试语句
    Underlined = { underline = true }, -- 下划线文本
    Bold = { bold = true }, -- 粗体文本
    Italic = { italic = true }, -- 斜体文本
    Ignore = { fg = colors.fg_gutter }, -- 忽略的文本
    Error = { fg = colors.error }, -- 错误
    Todo = { fg = colors.black, bg = colors.yellow, bold = true }, -- 待办事项 (TODO)

    DiagnosticError = { fg = colors.error }, -- 诊断错误
    DiagnosticWarn = { fg = colors.warning }, -- 诊断警告
    DiagnosticInfo = { fg = colors.info }, -- 诊断信息
    DiagnosticHint = { fg = colors.hint }, -- 诊断提示
    DiagnosticOk = { fg = colors.green_bright }, -- 诊断正常
    DiagnosticUnderlineError = { undercurl = true, sp = colors.error }, -- 诊断错误下划线
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.warning }, -- 诊断警告下划线
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.info }, -- 诊断信息下划线
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.hint }, -- 诊断提示下划线
    DiagnosticVirtualTextError = { fg = colors.error, bg = "#3b252a" }, -- 诊断错误虚拟文本
    DiagnosticVirtualTextWarn = { fg = colors.warning, bg = "#3c3526" }, -- 诊断警告虚拟文本
    DiagnosticVirtualTextInfo = { fg = colors.info, bg = "#233842" }, -- 诊断信息虚拟文本
    DiagnosticVirtualTextHint = { fg = colors.hint, bg = "#243534" }, -- 诊断提示虚拟文本
    DiagnosticFloatingError = { fg = colors.error }, -- 浮动窗口诊断错误
    DiagnosticFloatingWarn = { fg = colors.warning }, -- 浮动窗口诊断警告
    DiagnosticFloatingInfo = { fg = colors.info }, -- 浮动窗口诊断信息
    DiagnosticFloatingHint = { fg = colors.hint }, -- 浮动窗口诊断提示
    DiagnosticSignError = { fg = colors.error }, -- 侧边栏诊断错误图标
    DiagnosticSignWarn = { fg = colors.warning }, -- 侧边栏诊断警告图标
    DiagnosticSignInfo = { fg = colors.info }, -- 侧边栏诊断信息图标
    DiagnosticSignHint = { fg = colors.hint }, -- 侧边栏诊断提示图标

    LspInlayHint = { fg = colors.hint, italic = true }, -- LSP 内联提示
    LspReferenceText = { bg = colors.bg_highlight }, -- LSP 文本引用
    LspReferenceRead = { bg = colors.bg_highlight }, -- LSP 读取引用
    LspReferenceWrite = { bg = colors.bg_highlight }, -- LSP 写入引用
    LspSignatureHelpActiveParameter = { fg = colors.yellow, bold = true }, -- 参数签名帮助中的当前参数
    LspCodeLens = { fg = colors.fg_comment }, -- 代码透镜 (CodeLens) 虚拟文本
    LspCodeLensSeparator = { fg = colors.fg_gutter }, -- 代码透镜分隔符

    GitSignsAdd = { fg = colors.green_bright }, -- GitSigns 新增行
    GitSignsChange = { fg = colors.accent_2 }, -- GitSigns 修改行
    GitSignsDelete = { fg = colors.red }, -- GitSigns 删除行

    DiffAdded = { fg = colors.green_bright }, -- Diff 新增
    DiffRemoved = { fg = colors.red }, -- Diff 删除
    DiffChanged = { fg = colors.accent_2 }, -- Diff 修改
    diffAdded = { fg = colors.green_bright }, -- diff (内置) 新增
    diffRemoved = { fg = colors.red }, -- diff (内置) 删除
    diffChanged = { fg = colors.accent_2 }, -- diff (内置) 修改
    diffFile = { fg = colors.blue_dark }, -- diff 文件名
    diffNewFile = { fg = colors.green_bright }, -- diff 新文件
    diffOldFile = { fg = colors.yellow }, -- diff 旧文件
    diffLine = { fg = colors.fg_dark }, -- diff 行号
    diffIndexLine = { fg = colors.purple }, -- diff 索引行

    ["@annotation"] = { fg = colors.yellow }, -- 注解
    ["@attribute"] = { fg = colors.purple }, -- 属性 (如 Rust 的 #[test])
    ["@boolean"] = { fg = colors.red }, -- 布尔值
    ["@character"] = { fg = colors.green }, -- 字符
    ["@character.special"] = { fg = colors.accent_2 }, -- 特殊字符
    ["@comment"] = style({ fg = colors.fg_comment }, opts.styles.comments), -- 注释
    ["@comment.documentation"] = style({ fg = colors.fg_comment_soft, italic = true }, opts.styles.comments), -- 文档注释
    ["@comment.todo"] = { fg = colors.black, bg = colors.yellow, bold = true }, -- TODO
    ["@comment.note"] = { fg = colors.black, bg = colors.info, bold = true }, -- NOTE
    ["@comment.warning"] = { fg = colors.black, bg = colors.warning, bold = true }, -- WARNING
    ["@comment.error"] = { fg = colors.white, bg = colors.error, bold = true }, -- ERROR
    ["@conditional"] = style({ fg = colors.red }, opts.styles.keywords), -- 条件语句
    ["@constant"] = { fg = colors.white }, -- 常量
    ["@constant.builtin"] = { fg = colors.yellow, italic = true }, -- 内置常量
    ["@constant.macro"] = { fg = colors.blue_dark }, -- 宏定义的常量
    ["@constructor"] = { fg = colors.yellow }, -- 构造函数
    ["@diff.delta"] = { fg = colors.accent_2 }, -- Diff 变化
    ["@diff.minus"] = { fg = colors.red }, -- Diff 删除
    ["@diff.plus"] = { fg = colors.green_bright }, -- Diff 新增
    ["@exception"] = style({ fg = colors.red }, opts.styles.keywords), -- 异常
    ["@field"] = { fg = colors.red }, -- 结构体/对象字段
    ["@float"] = { fg = colors.red }, -- 浮点数
    ["@function"] = style({ fg = colors.blue_dark }, opts.styles.functions), -- 函数
    ["@function.builtin"] = { fg = colors.purple }, -- 内置函数
    ["@function.call"] = { fg = colors.blue_dark }, -- 函数调用
    ["@function.macro"] = { fg = colors.blue_dark }, -- 宏函数
    ["@include"] = { fg = colors.yellow }, -- 包含/导入
    ["@keyword"] = style({ fg = colors.red }, opts.styles.keywords), -- 关键字
    ["@keyword.function"] = style({ fg = colors.red }, opts.styles.keywords), -- 函数关键字 (如 fn, def)
    ["@keyword.operator"] = { fg = colors.red }, -- 运算符关键字 (如 and, or)
    ["@keyword.return"] = style({ fg = colors.red }, opts.styles.keywords), -- 返回关键字
    ["@label"] = { fg = colors.orange }, -- 标签
    ["@markup.heading"] = { fg = colors.accent_2, bold = true }, -- 标题
    ["@markup.italic"] = { fg = colors.red, italic = true }, -- 斜体
    ["@markup.link"] = { fg = colors.red, underline = true }, -- 链接
    ["@markup.link.label"] = { fg = colors.accent_2 }, -- 链接标签
    ["@markup.link.url"] = { fg = colors.green, underline = true }, -- 链接 URL
    ["@markup.list"] = { fg = colors.accent_2 }, -- 列表标记
    ["@markup.quote"] = { fg = colors.accent_2, italic = true }, -- 引用块
    ["@markup.raw"] = { fg = colors.green }, -- 原始文本/代码块
    ["@markup.strong"] = { fg = colors.red, bold = true }, -- 粗体
    ["@method"] = { fg = colors.red }, -- 方法
    ["@method.call"] = { fg = colors.red }, -- 方法调用
    ["@module"] = { fg = colors.yellow }, -- 模块
    ["@namespace"] = { fg = colors.yellow }, -- 命名空间
    ["@number"] = { fg = colors.orange }, -- 数字
    ["@operator"] = { fg = colors.accent_2 }, -- 运算符
    ["@parameter"] = style({ fg = colors.fg, italic = true }, opts.styles.variables), -- 参数
    ["@parameter.reference"] = { fg = colors.red, italic = true }, -- 参数引用
    ["@property"] = { fg = colors.red }, -- 属性
    ["@punctuation.bracket"] = { fg = colors.blue_dark }, -- 括号
    ["@punctuation.delimiter"] = { fg = colors.blue_bright }, -- 分隔符
    ["@punctuation.special"] = { fg = colors.blue_bright }, -- 特殊标点
    ["@repeat"] = style({ fg = colors.red }, opts.styles.keywords), -- 循环
    ["@storageclass"] = { fg = colors.purple }, -- 存储类
    ["@string"] = style({ fg = colors.green }, opts.styles.strings), -- 字符串
    ["@string.escape"] = { fg = colors.fg }, -- 转义字符
    ["@string.regex"] = { fg = colors.cyan }, -- 正则表达式
    ["@string.special"] = { fg = colors.orange }, -- 特殊字符串
    ["@tag"] = { fg = colors.red }, -- 标签
    ["@tag.attribute"] = { fg = colors.purple }, -- 标签属性
    ["@tag.delimiter"] = { fg = colors.accent_2 }, -- 标签分隔符
    ["@text"] = { fg = colors.fg }, -- 普通文本
    ["@text.literal"] = { fg = colors.green }, -- 字面量文本
    ["@text.reference"] = { fg = colors.red }, -- 文本引用
    ["@title"] = { fg = colors.accent_2, bold = true }, -- 标题 (Tree-sitter)
    ["@type"] = { fg = colors.yellow }, -- 类型
    ["@type.builtin"] = { fg = colors.accent_2 }, -- 内置类型
    ["@variable"] = style({ fg = colors.fg }, opts.styles.variables), -- 变量
    ["@variable.builtin"] = { fg = colors.accent_2 }, -- 内置变量 (如 self, this)
    ["@variable.member"] = { fg = colors.red }, -- 成员变量

    ["@lsp.type.class"] = { link = "@type" }, -- LSP 类
    ["@lsp.type.comment"] = { link = "@comment" }, -- LSP 注释
    ["@lsp.type.decorator"] = { link = "@attribute" }, -- LSP 装饰器
    ["@lsp.type.enum"] = { link = "@type" }, -- LSP 枚举
    ["@lsp.type.enumMember"] = { link = "@property" }, -- LSP 枚举成员
    ["@lsp.type.function"] = { link = "@function" }, -- LSP 函数
    ["@lsp.type.interface"] = { link = "@type" }, -- LSP 接口
    ["@lsp.type.macro"] = { link = "@function.macro" }, -- LSP 宏
    ["@lsp.type.method"] = { link = "@method" }, -- LSP 方法
    ["@lsp.type.namespace"] = { link = "@namespace" }, -- LSP 命名空间
    ["@lsp.type.parameter"] = { link = "@parameter" }, -- LSP 参数
    ["@lsp.type.property"] = { link = "@property" }, -- LSP 属性
    ["@lsp.type.struct"] = { link = "@type" }, -- LSP 结构体
    ["@lsp.type.type"] = { link = "@type" }, -- LSP 类型
    ["@lsp.type.typeParameter"] = { link = "@type" }, -- LSP 类型参数
    ["@lsp.type.variable"] = { link = "@variable" }, -- LSP 变量
-- rust
    ["@lsp.type.method.rust"] = { link = "@function.call" }, -- LSP Rust 方法
    ["@lsp.type.namespace.rust"] = { link = "@module" }, -- LSP Rust 命名空间
    ["@lsp.type.mod.rust"] = { link = "@module" }, -- LSP Rust 模块
    ["@lsp.typemod.namespace.crateRoot.rust"] = { link = "@module" }, -- LSP Rust Crate 根
    ["@lsp.type.enumMember.rust"] = { link = "@type" }, -- LSP Rust 枚举成员


    TelescopeNormal = { fg = colors.fg, bg = transparent_bg_dark }, -- Telescope 普通文本
    TelescopeBorder = { fg = colors.border, bg = transparent_bg_dark }, -- Telescope 边框
    TelescopeTitle = { fg = colors.accent, bold = true }, -- Telescope 标题
    TelescopePromptTitle = { fg = colors.black, bg = colors.accent, bold = true }, -- Telescope 输入提示标题
    TelescopePreviewTitle = { fg = colors.black, bg = colors.blue_dark, bold = true }, -- Telescope 预览标题
    TelescopeResultsTitle = { fg = colors.black, bg = colors.yellow, bold = true }, -- Telescope 结果标题
    TelescopePromptNormal = { fg = colors.accent, bg = transparent_bg }, -- Telescope 输入框普通文本
    TelescopePromptBorder = { fg = colors.accent, bg = transparent_bg }, -- Telescope 输入框边框
    TelescopeSelection = { fg = colors.accent, bg = colors.bg_highlight }, -- Telescope 选中项
    TelescopeMatching = { fg = colors.yellow, bold = true }, -- Telescope 匹配项

    NeoTreeNormal = { fg = colors.fg, bg = transparent_bg_dark }, -- NeoTree 普通文本
    NeoTreeNormalNC = { fg = colors.fg, bg = transparent_bg_dark }, -- NeoTree 非当前窗口文本
    NeoTreeFloatBorder = { fg = colors.border, bg = transparent_bg_dark }, -- NeoTree 浮动窗口边框
    NeoTreeTitleBar = { fg = colors.black, bg = colors.accent, bold = true }, -- NeoTree 标题栏
    NeoTreeDirectoryName = { fg = colors.fg }, -- NeoTree 目录名
    NeoTreeDirectoryIcon = { fg = colors.accent_2 }, -- NeoTree 目录图标
    NeoTreeRootName = { fg = colors.accent, bold = true }, -- NeoTree 根目录名
    NeoTreeFileNameOpened = { fg = colors.accent }, -- NeoTree 已打开的文件名
    NeoTreeIndentMarker = { fg = colors.fg_gutter }, -- NeoTree 缩进标记
    NeoTreeGitAdded = { fg = colors.green_bright }, -- NeoTree Git 新增
    NeoTreeGitModified = { fg = colors.warning }, -- NeoTree Git 修改
    NeoTreeGitDeleted = { fg = colors.red }, -- NeoTree Git 删除

    CmpDocumentation = { fg = colors.fg, bg = transparent_bg_dark }, -- Cmp 文档窗口
    CmpDocumentationBorder = { fg = colors.border, bg = transparent_bg_dark }, -- Cmp 文档窗口边框
    CmpItemAbbr = { fg = colors.fg }, -- Cmp 项目缩写
    CmpItemAbbrDeprecated = { fg = colors.fg_dark, strikethrough = true }, -- Cmp 弃用项目
    CmpItemAbbrMatch = { fg = colors.accent, bold = true }, -- Cmp 匹配项
    CmpItemAbbrMatchFuzzy = { fg = colors.accent_2, bold = true }, -- Cmp 模糊匹配项
    CmpItemKind = { fg = colors.blue_dark }, -- Cmp 项目类型图标
    CmpItemMenu = { fg = colors.fg_dark, italic = true }, -- Cmp 项目菜单文本
    CmpItemKindFunction = { fg = colors.blue_dark }, -- Cmp 函数类型
    CmpItemKindMethod = { fg = colors.red }, -- Cmp 方法类型
    CmpItemKindVariable = { fg = colors.fg }, -- Cmp 变量类型
    CmpItemKindField = { fg = colors.red }, -- Cmp 字段类型
    CmpItemKindProperty = { fg = colors.red }, -- Cmp 属性类型
    CmpItemKindClass = { fg = colors.yellow }, -- Cmp 类类型
    CmpItemKindInterface = { fg = colors.yellow }, -- Cmp 接口类型
    CmpItemKindModule = { fg = colors.purple }, -- Cmp 模块类型
    CmpItemKindKeyword = { fg = colors.accent_2 }, -- Cmp 关键字类型
    CmpItemKindSnippet = { fg = colors.green }, -- Cmp 代码片段类型
    CmpItemKindText = { fg = colors.fg_dark }, -- Cmp 文本类型

    GitSignsAddLn = { bg = "#263426" }, -- GitSigns 新增行背景
    GitSignsChangeLn = { bg = "#21343d" }, -- GitSigns 修改行背景
    GitSignsDeleteLn = { bg = "#39252a" }, -- GitSigns 删除行背景
    GitSignsCurrentLineBlame = { fg = colors.fg_comment, italic = true }, -- GitSigns 当前行 Git Blame

    TroubleNormal = { fg = colors.fg, bg = transparent_bg_dark }, -- Trouble 普通文本
    TroubleNormalNC = { fg = colors.fg, bg = transparent_bg_dark }, -- Trouble 非当前窗口文本
    TroubleText = { fg = colors.fg }, -- Trouble 文本
    TroubleCount = { fg = colors.black, bg = colors.accent, bold = true }, -- Trouble 计数
    TroubleIconDirectory = { fg = colors.accent_2 }, -- Trouble 目录图标
    TroubleIconFile = { fg = colors.fg }, -- Trouble 文件图标
    TroublePreview = { fg = colors.accent, bold = true }, -- Trouble 预览

    FlashBackdrop = { fg = colors.fg_gutter }, -- Flash 背景遮罩
    FlashLabel = { fg = colors.black, bg = colors.accent, bold = true }, -- Flash 标签
    FlashMatch = { fg = colors.yellow, bg = colors.bg_highlight, bold = true }, -- Flash 匹配项
    FlashCurrent = { fg = colors.black, bg = colors.orange, bold = true }, -- Flash 当前匹配
    FlashCursor = { fg = colors.black, bg = colors.red_bright, bold = true }, -- Flash 光标
    FlashPrompt = { fg = colors.accent }, -- Flash 提示

    OilDir = { fg = colors.accent_2 }, -- Oil 目录
    OilFile = { fg = colors.fg }, -- Oil 文件
    OilLink = { fg = colors.purple }, -- Oil 符号链接
    OilSocket = { fg = colors.red }, -- Oil 套接字
    OilOrphanLink = { fg = colors.warning }, -- Oil 孤立链接
    OilChange = { fg = colors.accent_2 }, -- Oil 修改
    OilCreate = { fg = colors.green_bright }, -- Oil 创建
    OilDelete = { fg = colors.red }, -- Oil 删除
    OilMove = { fg = colors.yellow }, -- Oil 移动
    OilCopy = { fg = colors.blue_dark }, -- Oil 复制
    OilPermissionRead = { fg = colors.green }, -- Oil 读取权限
    OilPermissionWrite = { fg = colors.yellow }, -- Oil 写入权限
    OilPermissionExecute = { fg = colors.red }, -- Oil 执行权限

    WhichKey = { fg = colors.accent }, -- WhichKey 按键
    WhichKeyGroup = { fg = colors.yellow }, -- WhichKey 组名
    WhichKeyDesc = { fg = colors.blue_dark }, -- WhichKey 描述
    WhichKeyIcon = { fg = colors.accent_2 }, -- WhichKey 图标
    WhichKeyTitle = { fg = colors.accent, bold = true }, -- WhichKey 标题
    WhichKeyValue = { fg = colors.fg_dark }, -- WhichKey 值
    WhichKeySeparator = { fg = colors.fg_dark }, -- WhichKey 分隔符
    WhichKeyFloat = { bg = transparent_bg_dark }, -- WhichKey 浮动窗口背景

    LazyNormal = { fg = colors.fg, bg = transparent_bg_dark }, -- Lazy 普通文本
    LazyButton = { fg = colors.fg, bg = colors.bg_highlight }, -- Lazy 按钮
    LazyButtonActive = { fg = colors.black, bg = colors.accent, bold = true }, -- Lazy 激活按钮
    LazyComment = { fg = colors.fg_comment, italic = true }, -- Lazy 注释
    LazyCommit = { fg = colors.blue_dark }, -- Lazy 提交哈希
    LazyCommitIssue = { fg = colors.purple, underline = true }, -- Lazy 议题编号
    LazyDir = { fg = colors.accent_2 }, -- Lazy 目录
    LazyH1 = { fg = colors.black, bg = colors.accent, bold = true }, -- Lazy 一级标题
    LazyH2 = { fg = colors.yellow, bold = true }, -- Lazy 二级标题
    LazyProp = { fg = colors.fg_dark }, -- Lazy 属性
    LazyReasonPlugin = { fg = colors.purple }, -- Lazy 插件加载原因
    LazySpecial = { fg = colors.blue_bright }, -- Lazy 特殊文本
    LazyValue = { fg = colors.orange }, -- Lazy 值

    MasonNormal = { fg = colors.fg, bg = transparent_bg_dark }, -- Mason 普通文本
    NotifyBackground = { bg = transparent_bg_dark }, -- Notify 背景
    NotifyERRORBorder = { fg = colors.error, bg = transparent_bg_dark }, -- Notify 错误边框
    NotifyWARNBorder = { fg = colors.warning, bg = transparent_bg_dark }, -- Notify 警告边框
    NotifyINFOBorder = { fg = colors.info, bg = transparent_bg_dark }, -- Notify 信息边框
    NotifyDEBUGBorder = { fg = colors.purple, bg = transparent_bg_dark }, -- Notify 调试边框
    NotifyTRACEBorder = { fg = colors.accent_2, bg = transparent_bg_dark }, -- Notify 追踪边框
    NotifyERRORTitle = { fg = colors.error, bold = true }, -- Notify 错误标题
    NotifyWARNTitle = { fg = colors.warning, bold = true }, -- Notify 警告标题
    NotifyINFOTitle = { fg = colors.info, bold = true }, -- Notify 信息标题
    NotifyDEBUGTitle = { fg = colors.purple, bold = true }, -- Notify 调试标题
    NotifyTRACETitle = { fg = colors.accent_2, bold = true }, -- Notify 追踪标题
    NotifyERRORIcon = { fg = colors.error }, -- Notify 错误图标
    NotifyWARNIcon = { fg = colors.warning }, -- Notify 警告图标
    NotifyINFOIcon = { fg = colors.info }, -- Notify 信息图标
    NotifyDEBUGIcon = { fg = colors.purple }, -- Notify 调试图标
    NotifyTRACEIcon = { fg = colors.accent_2 }, -- Notify 追踪图标

    NoiceCmdline = { fg = colors.fg, bg = transparent_bg_dark }, -- Noice 命令行
    NoiceCmdlineIcon = { fg = colors.accent }, -- Noice 命令行图标
    NoiceCmdlinePopup = { fg = colors.fg, bg = transparent_bg_dark }, -- Noice 命令行弹窗
    NoiceCmdlinePopupBorder = { fg = colors.border, bg = transparent_bg_dark }, -- Noice 命令行弹窗边框
    NoiceConfirmBorder = { fg = colors.yellow, bg = transparent_bg_dark }, -- Noice 确认弹窗边框
    NoiceMini = { fg = colors.fg_dark, bg = transparent_bg_dark }, -- Noice 迷你弹窗
    NoicePopup = { fg = colors.fg, bg = transparent_bg_dark }, -- Noice 弹窗
    NoicePopupBorder = { fg = colors.border, bg = transparent_bg_dark }, -- Noice 弹窗边框
    NoiceSplit = { fg = colors.fg, bg = transparent_bg_dark }, -- Noice 分割窗口
    NoiceVirtualText = { fg = colors.fg_comment, italic = true }, -- Noice 虚拟文本
    NoiceLspProgressTitle = { fg = colors.accent, bold = true }, -- Noice LSP 进度标题
    NoiceLspProgressSpinner = { fg = colors.accent_2 }, -- Noice LSP 进度加载动画
    NoiceLspProgressClient = { fg = colors.fg_dark }, -- Noice LSP 客户端名

    MiniAnimateCursor = { reverse = true }, -- Mini.Animate 光标
    MiniClueBorder = { fg = colors.border, bg = transparent_bg_dark }, -- Mini.Clue 边框
    MiniClueDescGroup = { fg = colors.yellow }, -- Mini.Clue 组描述
    MiniClueDescSingle = { fg = colors.blue_dark }, -- Mini.Clue 单键描述
    MiniClueNextKey = { fg = colors.accent }, -- Mini.Clue 下一按键
    MiniClueNextKeyWithPostkeys = { fg = colors.accent_2 }, -- Mini.Clue 带后续键的按键
    MiniClueSeparator = { fg = colors.fg_dark }, -- Mini.Clue 分隔符
    MiniCursorword = { bg = colors.bg_highlight }, -- Mini.Cursorword 单词高亮
    MiniCursorwordCurrent = { bg = colors.bg_highlight }, -- Mini.Cursorword 当前单词高亮
    MiniFilesBorder = { fg = colors.border, bg = transparent_bg_dark }, -- Mini.Files 边框
    MiniFilesCursorLine = { bg = colors.bg_highlight }, -- Mini.Files 当前行
    MiniFilesDirectory = { fg = colors.accent_2 }, -- Mini.Files 目录
    MiniFilesFile = { fg = colors.fg }, -- Mini.Files 文件
    MiniHipatternsFixme = { fg = colors.white, bg = colors.error, bold = true }, -- Mini.Hipatterns FIXME
    MiniHipatternsHack = { fg = colors.black, bg = colors.warning, bold = true }, -- Mini.Hipatterns HACK
    MiniHipatternsNote = { fg = colors.black, bg = colors.info, bold = true }, -- Mini.Hipatterns NOTE
    MiniHipatternsTodo = { fg = colors.black, bg = colors.accent, bold = true }, -- Mini.Hipatterns TODO
    MiniIconsAzure = { fg = colors.blue_bright }, -- Mini.Icons 天蓝色
    MiniIconsBlue = { fg = colors.blue_dark }, -- Mini.Icons 蓝色
    MiniIconsCyan = { fg = colors.cyan }, -- Mini.Icons 青色
    MiniIconsGreen = { fg = colors.green_bright }, -- Mini.Icons 绿色
    MiniIconsGrey = { fg = colors.fg_dark }, -- Mini.Icons 灰色
    MiniIconsOrange = { fg = colors.orange }, -- Mini.Icons 橙色
    MiniIconsPurple = { fg = colors.purple }, -- Mini.Icons 紫色
    MiniIconsRed = { fg = colors.red }, -- Mini.Icons 红色
    MiniIconsYellow = { fg = colors.yellow }, -- Mini.Icons 黄色
    MiniIndentscopeSymbol = { fg = colors.fg_gutter }, -- Mini.Indentscope 缩进符号
    MiniIndentscopePrefix = { nocombine = true }, -- Mini.Indentscope 前缀
    MiniJump = { fg = colors.black, bg = colors.accent, bold = true }, -- Mini.Jump 跳转点
    MiniJump2dSpot = { fg = colors.black, bg = colors.yellow, bold = true }, -- Mini.Jump2d 跳转点
    MiniNotifyBorder = { fg = colors.border, bg = transparent_bg_dark }, -- Mini.Notify 边框
    MiniNotifyNormal = { fg = colors.fg, bg = transparent_bg_dark }, -- Mini.Notify 普通文本
    MiniPickBorder = { fg = colors.border, bg = transparent_bg_dark }, -- Mini.Pick 边框
    MiniPickBorderBusy = { fg = colors.warning, bg = transparent_bg_dark }, -- Mini.Pick 忙碌状态边框
    MiniPickBorderText = { fg = colors.accent, bg = transparent_bg_dark }, -- Mini.Pick 边框文本
    MiniPickHeader = { fg = colors.black, bg = colors.accent, bold = true }, -- Mini.Pick 头部
    MiniPickIconDirectory = { fg = colors.accent_2 }, -- Mini.Pick 目录图标
    MiniPickIconFile = { fg = colors.fg }, -- Mini.Pick 文件图标
    MiniPickMatchCurrent = { bg = colors.bg_highlight }, -- Mini.Pick 当前匹配
    MiniPickMatchMarked = { fg = colors.yellow, bold = true }, -- Mini.Pick 标记匹配
    MiniPickMatchRanges = { fg = colors.accent, bold = true }, -- Mini.Pick 匹配范围
    MiniStatuslineDevinfo = { fg = colors.fg_dark, bg = colors.bg_dark }, -- Mini.Statusline 设备信息
    MiniStatuslineFileinfo = { fg = colors.fg_dark, bg = colors.bg_dark }, -- Mini.Statusline 文件信息
    MiniStatuslineFilename = { fg = colors.fg, bg = colors.bg_dark }, -- Mini.Statusline 文件名
    MiniStatuslineInactive = { fg = colors.fg_gutter, bg = colors.bg_dark }, -- Mini.Statusline 非活动窗口
    MiniStatuslineModeCommand = { fg = colors.black, bg = colors.yellow, bold = true }, -- Mini.Statusline 命令模式
    MiniStatuslineModeInsert = { fg = colors.black, bg = colors.accent, bold = true }, -- Mini.Statusline 插入模式
    MiniStatuslineModeNormal = { fg = colors.black, bg = colors.blue_dark, bold = true }, -- Mini.Statusline 普通模式
    MiniStatuslineModeOther = { fg = colors.black, bg = colors.purple, bold = true }, -- Mini.Statusline 其他模式
    MiniStatuslineModeReplace = { fg = colors.black, bg = colors.red, bold = true }, -- Mini.Statusline 替换模式
    MiniStatuslineModeVisual = { fg = colors.black, bg = colors.orange, bold = true }, -- Mini.Statusline 视觉模式
    MiniTablineCurrent = { fg = colors.accent, bg = colors.bg, bold = true }, -- Mini.Tabline 当前标签
    MiniTablineFill = { bg = colors.bg_dark }, -- Mini.Tabline 填充
    MiniTablineHidden = { fg = colors.fg_dark, bg = colors.bg_dark }, -- Mini.Tabline 隐藏标签
    MiniTablineModifiedCurrent = { fg = colors.yellow, bg = colors.bg, bold = true }, -- Mini.Tabline 已修改当前标签
    MiniTablineModifiedHidden = { fg = colors.yellow, bg = colors.bg_dark }, -- Mini.Tabline 已修改隐藏标签
    MiniTablineModifiedVisible = { fg = colors.yellow, bg = colors.bg_dark }, -- Mini.Tabline 已修改可见标签
    MiniTablineTabpagesection = { fg = colors.black, bg = colors.accent }, -- Mini.Tabline 标签页部分
    MiniTablineVisible = { fg = colors.fg, bg = colors.bg_dark }, -- Mini.Tabline 可见标签

    RainbowDelimiterRed = { fg = colors.magenta }, -- 彩虹括号 - 红色
    RainbowDelimiterYellow = { fg = colors.yellow_bright }, -- 彩虹括号 - 黄色
    RainbowDelimiterBlue = { fg = colors.blue }, -- 彩虹括号 - 蓝色
    RainbowDelimiterOrange = { fg = colors.orange }, -- 彩虹括号 - 橙色
    RainbowDelimiterGreen = { fg = colors.green }, -- 彩虹括号 - 绿色
    RainbowDelimiterViolet = { fg = colors.purple }, -- 彩虹括号 - 紫色
    RainbowDelimiterCyan = { fg = colors.cyan }, -- 彩虹括号 - 青色

    IblIndent = { fg = colors.fg_gutter }, -- Indent-Blankline 缩进线
    IblWhitespace = { fg = colors.fg_gutter }, -- Indent-Blankline 空白符
    IblScope = { fg = colors.accent_2 }, -- Indent-Blankline 作用域
    IndentBlanklineChar = { fg = colors.fg_gutter }, -- Indent-Blankline 字符 (旧版)
    IndentBlanklineContextChar = { fg = colors.accent_2 }, -- Indent-Blankline 上下文点 (旧版)
    IndentBlanklineContextStart = { sp = colors.accent_2, underline = true }, -- Indent-Blankline 上下文开始 (旧版)

    DashboardHeader = { fg = colors.accent_2 }, -- Dashboard 头部
    DashboardCenter = { fg = colors.blue_dark }, -- Dashboard 中间部分
    DashboardShortCut = { fg = colors.orange }, -- Dashboard 快捷键
    DashboardFooter = { fg = colors.fg_comment, italic = true }, -- Dashboard 底部
    DashboardKey = { fg = colors.yellow }, -- Dashboard 按键
    DashboardDesc = { fg = colors.fg }, -- Dashboard 描述
    DashboardIcon = { fg = colors.accent }, -- Dashboard 图标

    AlphaHeader = { fg = colors.accent_2 }, -- Alpha 头部
    AlphaButtons = { fg = colors.blue_dark }, -- Alpha 按钮
    AlphaShortcut = { fg = colors.orange }, -- Alpha 快捷键
    AlphaFooter = { fg = colors.fg_comment, italic = true }, -- Alpha 底部

    SnacksNormal = { fg = colors.fg, bg = transparent_bg_dark }, -- Snacks 普通文本
    SnacksBackdrop = { bg = colors.black, blend = 60 }, -- Snacks 背景遮罩
    SnacksBorder = { fg = colors.border, bg = transparent_bg_dark }, -- Snacks 边框
    SnacksTitle = { fg = colors.accent, bold = true }, -- Snacks 标题
    SnacksPicker = { fg = colors.fg, bg = transparent_bg_dark }, -- Snacks Picker 普通文本
    SnacksPickerBorder = { fg = colors.border, bg = transparent_bg_dark }, -- Snacks Picker 边框
    SnacksPickerTitle = { fg = colors.black, bg = colors.accent, bold = true }, -- Snacks Picker 标题
    SnacksPickerDir = { fg = colors.fg_dark }, -- Snacks Picker 目录
    SnacksPickerFile = { fg = colors.fg }, -- Snacks Picker 文件
    SnacksPickerMatch = { fg = colors.yellow, bold = true }, -- Snacks Picker 匹配项
    SnacksPickerPrompt = { fg = colors.accent }, -- Snacks Picker 提示符
    SnacksNotifierBorderError = { fg = colors.error, bg = transparent_bg_dark }, -- Snacks 通知错误边框
    SnacksNotifierBorderWarn = { fg = colors.warning, bg = transparent_bg_dark }, -- Snacks 通知警告边框
    SnacksNotifierBorderInfo = { fg = colors.info, bg = transparent_bg_dark }, -- Snacks 通知信息边框
    SnacksNotifierBorderDebug = { fg = colors.purple, bg = transparent_bg_dark }, -- Snacks 通知调试边框
    SnacksNotifierBorderTrace = { fg = colors.accent_2, bg = transparent_bg_dark }, -- Snacks 通知追踪边框
    SnacksNotifierTitleError = { fg = colors.error, bold = true }, -- Snacks 通知错误标题
    SnacksNotifierTitleWarn = { fg = colors.warning, bold = true }, -- Snacks 通知警告标题
    SnacksNotifierTitleInfo = { fg = colors.info, bold = true }, -- Snacks 通知信息标题
    SnacksNotifierTitleDebug = { fg = colors.purple, bold = true }, -- Snacks 通知调试标题
    SnacksNotifierTitleTrace = { fg = colors.accent_2, bold = true }, -- Snacks 通知追踪标题
    SnacksDashboardHeader = { fg = colors.accent_2 }, -- Snacks Dashboard 头部
    SnacksDashboardDesc = { fg = colors.fg }, -- Snacks Dashboard 描述
    SnacksDashboardFooter = { fg = colors.fg_comment, italic = true }, -- Snacks Dashboard 底部
    SnacksDashboardIcon = { fg = colors.accent }, -- Snacks Dashboard 图标
    SnacksDashboardKey = { fg = colors.yellow }, -- Snacks Dashboard 按键
    SnacksIndent = { fg = colors.fg_gutter }, -- Snacks 缩进线
    SnacksIndentScope = { fg = colors.accent_2 }, -- Snacks 缩进作用域
  }

  highlights.FloatShadow = { bg = colors.black, blend = 60 } -- 浮动窗口阴影
  highlights.FloatShadowThrough = { bg = colors.black, blend = 80 } -- 穿透式浮动窗口阴影

  if type(opts.on_highlights) == "function" then
    opts.on_highlights(highlights, colors)
  end

  return vim.tbl_deep_extend("force", highlights, opts.highlights or {})
end

return M
