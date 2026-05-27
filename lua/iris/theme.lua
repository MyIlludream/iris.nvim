local M = {}

local function style(spec, extra)
  return vim.tbl_extend("force", spec or {}, extra or {})
end

function M.get(colors, opts)
  local transparent_bg = opts.transparent and colors.none or colors.surface_editor
  local transparent_bg_dark = opts.transparent and colors.none or colors.surface_float

  local highlights = {
    ColorColumn = { bg = colors.surface_current }, -- 用于 'colorcolumn' 设置的列高亮
    Conceal = { fg = colors.text_dim }, -- 被隐藏文本的替代占位符高亮
    CurSearch = { fg = colors.text_inverse, bg = colors.primary_light }, -- 当前搜索命中的匹配高亮
    Cursor = { fg = colors.surface_editor, bg = colors.cursor }, -- 光标下的字符高亮
    lCursor = { fg = colors.surface_editor, bg = colors.cursor }, -- 语言映射下的光标高亮
    CursorColumn = { bg = colors.surface_current }, -- 光标所在的列高亮
    CursorIM = { fg = colors.surface_editor, bg = colors.cursor }, -- 输入法激活时的光标高亮
    CursorLine = { bg = colors.surface_cursorline }, -- 光标所在的行高亮
    CursorLineNr = { fg = colors.ui_cursorline_number, bold = true }, -- 光标所在行的行号高亮
    Directory = { fg = colors.ui_directory }, -- 目录名称及列表中的特殊名称高亮
    DiffAdd = { bg = colors.diff_add_surface, fg = colors.green_400 }, -- diff 模式下新增的内容
    DiffChange = { bg = colors.diff_change_surface, fg = colors.secondary }, -- diff 模式下改变的内容
    DiffDelete = { bg = colors.diff_delete_surface, fg = colors.red_600 }, -- diff 模式下删除的内容
    DiffText = { bg = colors.diff_text_surface, fg = colors.blue_400 }, -- diff 模式下改变内容的具体差异
    EndOfBuffer = { fg = colors.surface_editor }, -- 文件末尾之后的填充符 (~)
    ErrorMsg = { fg = colors.error }, -- 错误消息高亮
    FloatBorder = { fg = colors.stroke_soft, bg = transparent_bg_dark }, -- 浮动窗口边框
    FloatTitle = { fg = colors.ui_title, bg = transparent_bg_dark, bold = true }, -- 浮动窗口标题
    FoldColumn = { fg = colors.text_gutter, bg = transparent_bg }, -- 用于显示折叠状态的列
    Folded = { fg = colors.text_dim, bg = colors.surface_panel }, -- 被折叠的行
    IncSearch = { fg = colors.text_inverse, bg = colors.yellow_400 }, -- 增量搜索时的匹配预览
    LineNr = { fg = colors.text_gutter }, -- 普通行号
    MatchParen = { fg = colors.ui_match, bold = true }, -- 匹配的括号对
    ModeMsg = { fg = colors.ui_prompt, bold = true }, -- 'showmode' 消息 (如 "-- INSERT --")
    MoreMsg = { fg = colors.ui_prompt }, -- 'more-prompt' 消息 (如 "-- More --")
    NonText = { fg = colors.text_gutter }, -- 窗口中的非文本字符
    Normal = { fg = colors.text, bg = transparent_bg }, -- 普通文本及背景
    NormalFloat = { fg = colors.text, bg = transparent_bg_dark }, -- 浮动窗口中的普通文本
    NormalNC = { fg = colors.text, bg = transparent_bg }, -- 非当前窗口中的普通文本
    Pmenu = { fg = colors.text, bg = transparent_bg_dark }, -- 弹出菜单 (如补全列表)
    PmenuSbar = { bg = colors.surface_panel }, -- 弹出菜单滚动条背景
    PmenuSel = { fg = colors.text_bright, bg = colors.surface_interactive }, -- 弹出菜单选中项
    PmenuThumb = { bg = colors.ui_prompt }, -- 弹出菜单滚动条滑块
    Question = { fg = colors.ui_prompt }, -- 询问用户的提示语
    QuickFixLine = { bg = colors.surface_current, bold = true }, -- Quickfix 窗口中的当前选中行
    Search = { fg = colors.text_bright, bg = colors.surface_search }, -- 搜索匹配的高亮
    SignColumn = { fg = colors.text_gutter, bg = transparent_bg }, -- 显示诊断符号、断点等的边距列
    SpecialKey = { fg = colors.secondary }, -- 特殊键及 'listchars' 字符
    SpellBad = { sp = colors.error, undercurl = true }, -- 拼写错误的单词
    SpellCap = { sp = colors.info, undercurl = true }, -- 首字母未大写的单词
    SpellLocal = { sp = colors.hint, undercurl = true }, -- 局部拼写错误的单词
    SpellRare = { sp = colors.purple_600, undercurl = true }, -- 罕见单词
    StatusLine = { fg = colors.text_secondary, bg = colors.surface_statusline }, -- 当前窗口状态栏
    StatusLineNC = { fg = colors.text_muted, bg = colors.surface_chrome }, -- 非当前窗口状态栏
    Substitute = { fg = colors.text_inverse, bg = colors.orange_600 }, -- ':substitute' 替换预览
    TabLine = { fg = colors.text_dim, bg = colors.surface_chrome }, -- 标签页栏
    TabLineFill = { bg = colors.surface_chrome }, -- 标签页栏空白填充
    TabLineSel = { fg = colors.text_inverse, bg = colors.ui_tab_active, bold = true }, -- 当前选中的标签页
    Title = { fg = colors.ui_title, bold = true }, -- 标题
    VertSplit = { fg = colors.stroke_strong }, -- 垂直分割窗口的分隔符
    Visual = { bg = colors.surface_selection }, -- 视觉模式选中的区域
    WarningMsg = { fg = colors.warning }, -- 警告消息
    Whitespace = { fg = colors.text_gutter }, -- 空白字符
    WildMenu = { fg = colors.text_inverse, bg = colors.ui_prompt }, -- 命令行补全菜单
    WinBar = { fg = colors.text_dim, bg = transparent_bg }, -- 窗口顶部栏
    WinBarNC = { fg = colors.text_gutter, bg = transparent_bg }, -- 非当前窗口顶部栏
    WinSeparator = { fg = colors.stroke_strong }, -- 窗口分隔符

    Comment = style({ fg = colors.syntax_comment }, opts.styles.comments), -- 注释
    Constant = { fg = colors.syntax_constant }, -- 常量
    String = style({ fg = colors.syntax_string }, opts.styles.strings), -- 字符串
    Character = { fg = colors.syntax_character }, -- 字符
    Number = { fg = colors.syntax_number }, -- 数字
    Boolean = { fg = colors.syntax_boolean }, -- 布尔值
    Float = { fg = colors.syntax_number }, -- 浮点数
    Identifier = style({ fg = colors.text }, opts.styles.variables), -- 标识符
    Function = style({ fg = colors.syntax_function }, opts.styles.functions), -- 函数
    Statement = style({ fg = colors.syntax_keyword }, opts.styles.keywords), -- 语句 (如 if, while)
    Conditional = style({ fg = colors.syntax_keyword }, opts.styles.keywords), -- 条件语句
    Repeat = style({ fg = colors.syntax_keyword }, opts.styles.keywords), -- 循环语句
    Label = { fg = colors.syntax_preproc }, -- 标签
    Operator = { fg = colors.syntax_operator }, -- 运算符
    Keyword = style({ fg = colors.syntax_keyword }, opts.styles.keywords), -- 关键字
    Exception = style({ fg = colors.syntax_keyword }, opts.styles.keywords), -- 异常处理
    PreProc = { fg = colors.syntax_preproc }, -- 预处理指令
    Include = { fg = colors.syntax_include }, -- 包含指令 (如 #include)
    Define = { fg = colors.syntax_operator }, -- 定义指令 (如 #define)
    Macro = { fg = colors.syntax_macro }, -- 宏
    PreCondit = { fg = colors.syntax_keyword }, -- 预处理条件
    Type = { fg = colors.syntax_type }, -- 类型 (如 int, long)
    StorageClass = { fg = colors.syntax_attribute }, -- 存储类型 (如 static, extern)
    Structure = { fg = colors.syntax_type }, -- 结构体定义 (如 struct, enum)
    Typedef = { fg = colors.syntax_type }, -- 类型定义
    Special = { fg = colors.ui_special }, -- 特殊符号
    SpecialChar = { fg = colors.ui_special }, -- 特殊字符 (如 \n)
    Tag = { fg = colors.syntax_tag }, -- 标签 (如 HTML 标签)
    Delimiter = { fg = colors.syntax_punctuation }, -- 分隔符
    SpecialComment = style({ fg = colors.syntax_comment_doc, italic = true }, opts.styles.comments), -- 特殊注释 (如 Doxygen)
    Debug = { fg = colors.syntax_keyword }, -- 调试语句
    Underlined = { underline = true }, -- 下划线文本
    Bold = { bold = true }, -- 粗体文本
    Italic = { italic = true }, -- 斜体文本
    Ignore = { fg = colors.text_gutter }, -- 忽略的文本
    Error = { fg = colors.error }, -- 错误
    Todo = { fg = colors.black, bg = colors.yellow_600, bold = true }, -- 待办事项 (TODO)

    DiagnosticError = { fg = colors.error }, -- 诊断错误
    DiagnosticWarn = { fg = colors.warning }, -- 诊断警告
    DiagnosticInfo = { fg = colors.info }, -- 诊断信息
    DiagnosticHint = { fg = colors.hint }, -- 诊断提示
    DiagnosticOk = { fg = colors.green_400 }, -- 诊断正常
    DiagnosticUnderlineError = { undercurl = true, sp = colors.error }, -- 诊断错误下划线
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.warning }, -- 诊断警告下划线
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.info }, -- 诊断信息下划线
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.hint }, -- 诊断提示下划线
    DiagnosticVirtualTextError = { fg = colors.error, bg = colors.error_surface }, -- 诊断错误虚拟文本
    DiagnosticVirtualTextWarn = { fg = colors.warning, bg = colors.warning_surface }, -- 诊断警告虚拟文本
    DiagnosticVirtualTextInfo = { fg = colors.info, bg = colors.info_surface }, -- 诊断信息虚拟文本
    DiagnosticVirtualTextHint = { fg = colors.hint, bg = colors.hint_surface }, -- 诊断提示虚拟文本
    DiagnosticFloatingError = { fg = colors.error }, -- 浮动窗口诊断错误
    DiagnosticFloatingWarn = { fg = colors.warning }, -- 浮动窗口诊断警告
    DiagnosticFloatingInfo = { fg = colors.info }, -- 浮动窗口诊断信息
    DiagnosticFloatingHint = { fg = colors.hint }, -- 浮动窗口诊断提示
    DiagnosticSignError = { fg = colors.error }, -- 侧边栏诊断错误图标
    DiagnosticSignWarn = { fg = colors.warning }, -- 侧边栏诊断警告图标
    DiagnosticSignInfo = { fg = colors.info }, -- 侧边栏诊断信息图标
    DiagnosticSignHint = { fg = colors.hint }, -- 侧边栏诊断提示图标

    LspInlayHint = { fg = colors.hint, italic = true }, -- LSP 内联提示
    LspReferenceText = { bg = colors.surface_highlight }, -- LSP 文本引用
    LspReferenceRead = { bg = colors.surface_highlight }, -- LSP 读取引用
    LspReferenceWrite = { bg = colors.surface_highlight }, -- LSP 写入引用
    LspSignatureHelpActiveParameter = { fg = colors.yellow_600, bold = true }, -- 参数签名帮助中的当前参数
    LspCodeLens = { fg = colors.text_comment }, -- 代码透镜 (CodeLens) 虚拟文本
    LspCodeLensSeparator = { fg = colors.text_gutter }, -- 代码透镜分隔符

    GitSignsAdd = { fg = colors.green_400 }, -- GitSigns 新增行
    GitSignsChange = { fg = colors.secondary }, -- GitSigns 修改行
    GitSignsDelete = { fg = colors.red_600 }, -- GitSigns 删除行

    DiffAdded = { fg = colors.green_400 }, -- Diff 新增
    DiffRemoved = { fg = colors.red_600 }, -- Diff 删除
    DiffChanged = { fg = colors.secondary }, -- Diff 修改
    diffAdded = { fg = colors.green_400 }, -- diff (内置) 新增
    diffRemoved = { fg = colors.red_600 }, -- diff (内置) 删除
    diffChanged = { fg = colors.secondary }, -- diff (内置) 修改
    diffFile = { fg = colors.blue_700 }, -- diff 文件名
    diffNewFile = { fg = colors.green_400 }, -- diff 新文件
    diffOldFile = { fg = colors.yellow_600 }, -- diff 旧文件
    diffLine = { fg = colors.text_dim }, -- diff 行号
    diffIndexLine = { fg = colors.purple_600 }, -- diff 索引行

    ["@annotation"] = { fg = colors.syntax_type }, -- 注解
    ["@attribute"] = { fg = colors.syntax_attribute }, -- 属性 (如 Rust 的 #[test])
    ["@boolean"] = { fg = colors.syntax_boolean }, -- 布尔值
    ["@character"] = { fg = colors.syntax_character }, -- 字符
    ["@character.special"] = { fg = colors.ui_special }, -- 特殊字符
    ["@comment"] = style({ fg = colors.syntax_comment }, opts.styles.comments), -- 注释
    ["@comment.documentation"] = style({ fg = colors.syntax_comment_doc, italic = true }, opts.styles.comments), -- 文档注释
    ["@comment.todo"] = { fg = colors.black, bg = colors.yellow_600, bold = true }, -- TODO
    ["@comment.note"] = { fg = colors.black, bg = colors.info, bold = true }, -- NOTE
    ["@comment.warning"] = { fg = colors.black, bg = colors.warning, bold = true }, -- WARNING
    ["@comment.error"] = { fg = colors.paper, bg = colors.error, bold = true }, -- ERROR
    ["@conditional"] = style({ fg = colors.syntax_keyword }, opts.styles.keywords), -- 条件语句
    ["@constant"] = { fg = colors.paper }, -- 常量
    ["@constant.builtin"] = { fg = colors.syntax_type, italic = true }, -- 内置常量
    ["@constant.macro"] = { fg = colors.syntax_macro }, -- 宏定义的常量
    ["@constructor"] = { fg = colors.syntax_type }, -- 构造函数
    ["@diff.delta"] = { fg = colors.primary }, -- Diff 变化
    ["@diff.minus"] = { fg = colors.red_600 }, -- Diff 删除
    ["@diff.plus"] = { fg = colors.green_400 }, -- Diff 新增
    ["@exception"] = style({ fg = colors.syntax_keyword }, opts.styles.keywords), -- 异常
    ["@field"] = { fg = colors.syntax_field }, -- 结构体/对象字段
    ["@float"] = { fg = colors.syntax_number }, -- 浮点数
    ["@function"] = style({ fg = colors.syntax_function }, opts.styles.functions), -- 函数
    ["@function.builtin"] = { fg = colors.syntax_attribute }, -- 内置函数
    ["@function.call"] = { fg = colors.syntax_function }, -- 函数调用
    ["@function.macro"] = { fg = colors.syntax_macro }, -- 宏函数
    ["@include"] = { fg = colors.syntax_include }, -- 包含/导入
    ["@keyword"] = style({ fg = colors.syntax_keyword }, opts.styles.keywords), -- 关键字
    ["@keyword.function"] = style({ fg = colors.syntax_keyword }, opts.styles.keywords), -- 函数关键字 (如 fn, def)
    ["@keyword.operator"] = { fg = colors.syntax_keyword }, -- 运算符关键字 (如 and, or)
    ["@keyword.return"] = style({ fg = colors.syntax_keyword }, opts.styles.keywords), -- 返回关键字
    ["@label"] = { fg = colors.syntax_preproc }, -- 标签
    ["@markup.heading"] = { fg = colors.ui_title_alt, bold = true }, -- 标题
    ["@markup.italic"] = { fg = colors.syntax_keyword, italic = true }, -- 斜体
    ["@markup.link"] = { fg = colors.syntax_keyword, underline = true }, -- 链接
    ["@markup.link.label"] = { fg = colors.ui_special }, -- 链接标签
    ["@markup.link.url"] = { fg = colors.syntax_string, underline = true }, -- 链接 URL
    ["@markup.list"] = { fg = colors.ui_special }, -- 列表标记
    ["@markup.quote"] = { fg = colors.ui_special, italic = true }, -- 引用块
    ["@markup.raw"] = { fg = colors.syntax_string }, -- 原始文本/代码块
    ["@markup.strong"] = { fg = colors.syntax_keyword, bold = true }, -- 粗体
    ["@method"] = { fg = colors.syntax_method }, -- 方法
    ["@method.call"] = { fg = colors.syntax_method }, -- 方法调用
    ["@module"] = { fg = colors.syntax_namespace }, -- 模块
    ["@namespace"] = { fg = colors.syntax_namespace }, -- 命名空间
    ["@number"] = { fg = colors.syntax_number }, -- 数字
    ["@operator"] = { fg = colors.syntax_operator }, -- 运算符
    ["@parameter"] = style({ fg = colors.text, italic = true }, opts.styles.variables), -- 参数
    ["@parameter.reference"] = { fg = colors.syntax_field, italic = true }, -- 参数引用
    ["@property"] = { fg = colors.syntax_property }, -- 属性
    ["@punctuation.bracket"] = { fg = colors.syntax_punctuation }, -- 括号
    ["@punctuation.delimiter"] = { fg = colors.syntax_punctuation }, -- 分隔符
    ["@punctuation.special"] = { fg = colors.syntax_punctuation }, -- 特殊标点
    ["@repeat"] = style({ fg = colors.syntax_keyword }, opts.styles.keywords), -- 循环
    ["@storageclass"] = { fg = colors.syntax_attribute }, -- 存储类
    ["@string"] = style({ fg = colors.syntax_string }, opts.styles.strings), -- 字符串
    ["@string.escape"] = { fg = colors.text }, -- 转义字符
    ["@string.regex"] = { fg = colors.syntax_regex }, -- 正则表达式
    ["@string.special"] = { fg = colors.syntax_preproc }, -- 特殊字符串
    ["@tag"] = { fg = colors.syntax_tag }, -- 标签
    ["@tag.attribute"] = { fg = colors.syntax_attribute }, -- 标签属性
    ["@tag.delimiter"] = { fg = colors.ui_special }, -- 标签分隔符
    ["@text"] = { fg = colors.text }, -- 普通文本
    ["@text.literal"] = { fg = colors.syntax_string }, -- 字面量文本
    ["@text.reference"] = { fg = colors.syntax_field }, -- 文本引用
    ["@title"] = { fg = colors.ui_title_alt, bold = true }, -- 标题 (Tree-sitter)
    ["@type"] = { fg = colors.syntax_type }, -- 类型
    ["@type.builtin"] = { fg = colors.ui_special }, -- 内置类型
    ["@variable"] = style({ fg = colors.text }, opts.styles.variables), -- 变量
    ["@variable.builtin"] = { fg = colors.ui_special }, -- 内置变量 (如 self, this)
    ["@variable.member"] = { fg = colors.syntax_field }, -- 成员变量

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


    TelescopeNormal = { fg = colors.text, bg = transparent_bg_dark }, -- Telescope 普通文本
    TelescopeBorder = { fg = colors.stroke, bg = transparent_bg_dark }, -- Telescope 边框
    TelescopeTitle = { fg = colors.primary, bold = true }, -- Telescope 标题
    TelescopePromptTitle = { fg = colors.black, bg = colors.primary, bold = true }, -- Telescope 输入提示标题
    TelescopePreviewTitle = { fg = colors.black, bg = colors.blue_700, bold = true }, -- Telescope 预览标题
    TelescopeResultsTitle = { fg = colors.black, bg = colors.yellow_600, bold = true }, -- Telescope 结果标题
    TelescopePromptNormal = { fg = colors.primary, bg = transparent_bg }, -- Telescope 输入框普通文本
    TelescopePromptBorder = { fg = colors.primary, bg = transparent_bg }, -- Telescope 输入框边框
    TelescopeSelection = { fg = colors.primary, bg = colors.surface_highlight }, -- Telescope 选中项
    TelescopeMatching = { fg = colors.yellow_600, bold = true }, -- Telescope 匹配项

    NeoTreeNormal = { fg = colors.text, bg = colors.surface_sidebar }, -- NeoTree 普通文本
    NeoTreeNormalNC = { fg = colors.text_dim, bg = colors.surface_sidebar }, -- NeoTree 非当前窗口文本
    NeoTreeFloatBorder = { fg = colors.stroke, bg = colors.surface_sidebar }, -- NeoTree 浮动窗口边框
    NeoTreeTitleBar = { fg = colors.black, bg = colors.primary, bold = true }, -- NeoTree 标题栏
    NeoTreeDirectoryName = { fg = colors.text }, -- NeoTree 目录名
    NeoTreeDirectoryIcon = { fg = colors.secondary }, -- NeoTree 目录图标
    NeoTreeRootName = { fg = colors.primary, bold = true }, -- NeoTree 根目录名
    NeoTreeFileNameOpened = { fg = colors.primary }, -- NeoTree 已打开的文件名
    NeoTreeIndentMarker = { fg = colors.text_gutter }, -- NeoTree 缩进标记
    NeoTreeGitAdded = { fg = colors.green_400 }, -- NeoTree Git 新增
    NeoTreeGitModified = { fg = colors.warning }, -- NeoTree Git 修改
    NeoTreeGitDeleted = { fg = colors.red_600 }, -- NeoTree Git 删除

    CmpDocumentation = { fg = colors.text, bg = transparent_bg_dark }, -- Cmp 文档窗口
    CmpDocumentationBorder = { fg = colors.stroke, bg = transparent_bg_dark }, -- Cmp 文档窗口边框
    CmpItemAbbr = { fg = colors.text }, -- Cmp 项目缩写
    CmpItemAbbrDeprecated = { fg = colors.text_dim, strikethrough = true }, -- Cmp 弃用项目
    CmpItemAbbrMatch = { fg = colors.primary, bold = true }, -- Cmp 匹配项
    CmpItemAbbrMatchFuzzy = { fg = colors.secondary, bold = true }, -- Cmp 模糊匹配项
    CmpItemKind = { fg = colors.blue_700 }, -- Cmp 项目类型图标
    CmpItemMenu = { fg = colors.text_dim, italic = true }, -- Cmp 项目菜单文本
    CmpItemKindFunction = { fg = colors.blue_700 }, -- Cmp 函数类型
    CmpItemKindMethod = { fg = colors.red_600 }, -- Cmp 方法类型
    CmpItemKindVariable = { fg = colors.text }, -- Cmp 变量类型
    CmpItemKindField = { fg = colors.red_600 }, -- Cmp 字段类型
    CmpItemKindProperty = { fg = colors.red_600 }, -- Cmp 属性类型
    CmpItemKindClass = { fg = colors.yellow_600 }, -- Cmp 类类型
    CmpItemKindInterface = { fg = colors.yellow_600 }, -- Cmp 接口类型
    CmpItemKindModule = { fg = colors.purple_600 }, -- Cmp 模块类型
    CmpItemKindKeyword = { fg = colors.secondary }, -- Cmp 关键字类型
    CmpItemKindSnippet = { fg = colors.green_500 }, -- Cmp 代码片段类型
    CmpItemKindText = { fg = colors.text_dim }, -- Cmp 文本类型

    GitSignsAddLn = { bg = colors.diff_add_surface }, -- GitSigns 新增行背景
    GitSignsChangeLn = { bg = colors.diff_change_surface }, -- GitSigns 修改行背景
    GitSignsDeleteLn = { bg = colors.diff_delete_surface }, -- GitSigns 删除行背景
    GitSignsCurrentLineBlame = { fg = colors.text_comment, italic = true }, -- GitSigns 当前行 Git Blame

    TroubleNormal = { fg = colors.text, bg = colors.surface_float }, -- Trouble 普通文本
    TroubleNormalNC = { fg = colors.text_dim, bg = colors.surface_float }, -- Trouble 非当前窗口文本
    TroubleText = { fg = colors.text }, -- Trouble 文本
    TroubleCount = { fg = colors.black, bg = colors.primary, bold = true }, -- Trouble 计数
    TroubleIconDirectory = { fg = colors.secondary }, -- Trouble 目录图标
    TroubleIconFile = { fg = colors.text }, -- Trouble 文件图标
    TroublePreview = { fg = colors.primary, bold = true }, -- Trouble 预览

    FlashBackdrop = { fg = colors.text_gutter }, -- Flash 背景遮罩
    FlashLabel = { fg = colors.black, bg = colors.primary, bold = true }, -- Flash 标签
    FlashMatch = { fg = colors.yellow_600, bg = colors.surface_highlight, bold = true }, -- Flash 匹配项
    FlashCurrent = { fg = colors.black, bg = colors.orange_600, bold = true }, -- Flash 当前匹配
    FlashCursor = { fg = colors.black, bg = colors.red_400, bold = true }, -- Flash 光标
    FlashPrompt = { fg = colors.primary }, -- Flash 提示

    OilDir = { fg = colors.secondary }, -- Oil 目录
    OilFile = { fg = colors.text }, -- Oil 文件
    OilLink = { fg = colors.purple_600 }, -- Oil 符号链接
    OilSocket = { fg = colors.red_600 }, -- Oil 套接字
    OilOrphanLink = { fg = colors.warning }, -- Oil 孤立链接
    OilChange = { fg = colors.secondary }, -- Oil 修改
    OilCreate = { fg = colors.green_400 }, -- Oil 创建
    OilDelete = { fg = colors.red_600 }, -- Oil 删除
    OilMove = { fg = colors.yellow_600 }, -- Oil 移动
    OilCopy = { fg = colors.blue_700 }, -- Oil 复制
    OilPermissionRead = { fg = colors.green_500 }, -- Oil 读取权限
    OilPermissionWrite = { fg = colors.yellow_600 }, -- Oil 写入权限
    OilPermissionExecute = { fg = colors.red_600 }, -- Oil 执行权限

    WhichKey = { fg = colors.primary }, -- WhichKey 按键
    WhichKeyGroup = { fg = colors.yellow_600 }, -- WhichKey 组名
    WhichKeyDesc = { fg = colors.blue_700 }, -- WhichKey 描述
    WhichKeyIcon = { fg = colors.secondary }, -- WhichKey 图标
    WhichKeyTitle = { fg = colors.tertiary, bold = true }, -- WhichKey 标题
    WhichKeyValue = { fg = colors.text_dim }, -- WhichKey 值
    WhichKeySeparator = { fg = colors.text_dim }, -- WhichKey 分隔符
    WhichKeyFloat = { bg = transparent_bg_dark }, -- WhichKey 浮动窗口背景

    LazyNormal = { fg = colors.text, bg = transparent_bg_dark }, -- Lazy 普通文本
    LazyButton = { fg = colors.text, bg = colors.surface_highlight }, -- Lazy 按钮
    LazyButtonActive = { fg = colors.black, bg = colors.primary, bold = true }, -- Lazy 激活按钮
    LazyComment = { fg = colors.text_comment, italic = true }, -- Lazy 注释
    LazyCommit = { fg = colors.blue_700 }, -- Lazy 提交哈希
    LazyCommitIssue = { fg = colors.purple_600, underline = true }, -- Lazy 议题编号
    LazyDir = { fg = colors.secondary }, -- Lazy 目录
    LazyH1 = { fg = colors.black, bg = colors.primary, bold = true }, -- Lazy 一级标题
    LazyH2 = { fg = colors.yellow_600, bold = true }, -- Lazy 二级标题
    LazyProp = { fg = colors.text_dim }, -- Lazy 属性
    LazyReasonPlugin = { fg = colors.purple_600 }, -- Lazy 插件加载原因
    LazySpecial = { fg = colors.blue_400 }, -- Lazy 特殊文本
    LazyValue = { fg = colors.orange_600 }, -- Lazy 值

    MasonNormal = { fg = colors.text, bg = colors.surface_float }, -- Mason 普通文本
    NotifyBackground = { bg = transparent_bg_dark }, -- Notify 背景
    NotifyERRORBorder = { fg = colors.error, bg = transparent_bg_dark }, -- Notify 错误边框
    NotifyWARNBorder = { fg = colors.warning, bg = transparent_bg_dark }, -- Notify 警告边框
    NotifyINFOBorder = { fg = colors.info, bg = transparent_bg_dark }, -- Notify 信息边框
    NotifyDEBUGBorder = { fg = colors.purple_600, bg = transparent_bg_dark }, -- Notify 调试边框
    NotifyTRACEBorder = { fg = colors.secondary, bg = transparent_bg_dark }, -- Notify 追踪边框
    NotifyERRORTitle = { fg = colors.error, bold = true }, -- Notify 错误标题
    NotifyWARNTitle = { fg = colors.warning, bold = true }, -- Notify 警告标题
    NotifyINFOTitle = { fg = colors.info, bold = true }, -- Notify 信息标题
    NotifyDEBUGTitle = { fg = colors.purple_600, bold = true }, -- Notify 调试标题
    NotifyTRACETitle = { fg = colors.secondary, bold = true }, -- Notify 追踪标题
    NotifyERRORIcon = { fg = colors.error }, -- Notify 错误图标
    NotifyWARNIcon = { fg = colors.warning }, -- Notify 警告图标
    NotifyINFOIcon = { fg = colors.info }, -- Notify 信息图标
    NotifyDEBUGIcon = { fg = colors.purple_600 }, -- Notify 调试图标
    NotifyTRACEIcon = { fg = colors.secondary }, -- Notify 追踪图标

    NoiceCmdline = { fg = colors.text, bg = transparent_bg_dark }, -- Noice 命令行
    NoiceCmdlineIcon = { fg = colors.primary }, -- Noice 命令行图标
    NoiceCmdlinePopup = { fg = colors.text, bg = transparent_bg_dark }, -- Noice 命令行弹窗
    NoiceCmdlinePopupBorder = { fg = colors.stroke, bg = transparent_bg_dark }, -- Noice 命令行弹窗边框
    NoiceConfirmBorder = { fg = colors.yellow_600, bg = transparent_bg_dark }, -- Noice 确认弹窗边框
    NoiceMini = { fg = colors.text_dim, bg = transparent_bg_dark }, -- Noice 迷你弹窗
    NoicePopup = { fg = colors.text, bg = transparent_bg_dark }, -- Noice 弹窗
    NoicePopupBorder = { fg = colors.stroke, bg = transparent_bg_dark }, -- Noice 弹窗边框
    NoiceSplit = { fg = colors.text, bg = transparent_bg_dark }, -- Noice 分割窗口
    NoiceVirtualText = { fg = colors.text_comment, italic = true }, -- Noice 虚拟文本
    NoiceLspProgressTitle = { fg = colors.primary, bold = true }, -- Noice LSP 进度标题
    NoiceLspProgressSpinner = { fg = colors.secondary }, -- Noice LSP 进度加载动画
    NoiceLspProgressClient = { fg = colors.text_dim }, -- Noice LSP 客户端名

    MiniAnimateCursor = { reverse = true }, -- Mini.Animate 光标
    MiniClueBorder = { fg = colors.stroke, bg = transparent_bg_dark }, -- Mini.Clue 边框
    MiniClueDescGroup = { fg = colors.yellow_600 }, -- Mini.Clue 组描述
    MiniClueDescSingle = { fg = colors.blue_700 }, -- Mini.Clue 单键描述
    MiniClueNextKey = { fg = colors.primary }, -- Mini.Clue 下一按键
    MiniClueNextKeyWithPostkeys = { fg = colors.secondary }, -- Mini.Clue 带后续键的按键
    MiniClueSeparator = { fg = colors.text_dim }, -- Mini.Clue 分隔符
    MiniCursorword = { bg = colors.surface_highlight }, -- Mini.Cursorword 单词高亮
    MiniCursorwordCurrent = { bg = colors.surface_highlight }, -- Mini.Cursorword 当前单词高亮
    MiniFilesBorder = { fg = colors.stroke, bg = transparent_bg_dark }, -- Mini.Files 边框
    MiniFilesCursorLine = { bg = colors.surface_highlight }, -- Mini.Files 当前行
    MiniFilesDirectory = { fg = colors.secondary }, -- Mini.Files 目录
    MiniFilesFile = { fg = colors.text }, -- Mini.Files 文件
    MiniHipatternsFixme = { fg = colors.paper, bg = colors.error, bold = true }, -- Mini.Hipatterns FIXME
    MiniHipatternsHack = { fg = colors.black, bg = colors.warning, bold = true }, -- Mini.Hipatterns HACK
    MiniHipatternsNote = { fg = colors.black, bg = colors.info, bold = true }, -- Mini.Hipatterns NOTE
    MiniHipatternsTodo = { fg = colors.black, bg = colors.primary, bold = true }, -- Mini.Hipatterns TODO
    MiniIconsAzure = { fg = colors.blue_400 }, -- Mini.Icons 天蓝色
    MiniIconsBlue = { fg = colors.blue_700 }, -- Mini.Icons 蓝色
    MiniIconsCyan = { fg = colors.cyan_600 }, -- Mini.Icons 青色
    MiniIconsGreen = { fg = colors.green_400 }, -- Mini.Icons 绿色
    MiniIconsGrey = { fg = colors.text_dim }, -- Mini.Icons 灰色
    MiniIconsOrange = { fg = colors.orange_600 }, -- Mini.Icons 橙色
    MiniIconsPurple = { fg = colors.purple_600 }, -- Mini.Icons 紫色
    MiniIconsRed = { fg = colors.red_600 }, -- Mini.Icons 红色
    MiniIconsYellow = { fg = colors.yellow_600 }, -- Mini.Icons 黄色
    MiniIndentscopeSymbol = { fg = colors.text_gutter }, -- Mini.Indentscope 缩进符号
    MiniIndentscopePrefix = { nocombine = true }, -- Mini.Indentscope 前缀
    MiniJump = { fg = colors.black, bg = colors.primary, bold = true }, -- Mini.Jump 跳转点
    MiniJump2dSpot = { fg = colors.black, bg = colors.yellow_600, bold = true }, -- Mini.Jump2d 跳转点
    MiniNotifyBorder = { fg = colors.stroke, bg = transparent_bg_dark }, -- Mini.Notify 边框
    MiniNotifyNormal = { fg = colors.text, bg = transparent_bg_dark }, -- Mini.Notify 普通文本
    MiniPickBorder = { fg = colors.stroke, bg = transparent_bg_dark }, -- Mini.Pick 边框
    MiniPickBorderBusy = { fg = colors.warning, bg = transparent_bg_dark }, -- Mini.Pick 忙碌状态边框
    MiniPickBorderText = { fg = colors.primary, bg = transparent_bg_dark }, -- Mini.Pick 边框文本
    MiniPickHeader = { fg = colors.black, bg = colors.primary, bold = true }, -- Mini.Pick 头部
    MiniPickIconDirectory = { fg = colors.secondary }, -- Mini.Pick 目录图标
    MiniPickIconFile = { fg = colors.text }, -- Mini.Pick 文件图标
    MiniPickMatchCurrent = { bg = colors.surface_highlight }, -- Mini.Pick 当前匹配
    MiniPickMatchMarked = { fg = colors.yellow_600, bold = true }, -- Mini.Pick 标记匹配
    MiniPickMatchRanges = { fg = colors.primary, bold = true }, -- Mini.Pick 匹配范围
    MiniStatuslineDevinfo = { fg = colors.text_dim, bg = colors.surface_dim }, -- Mini.Statusline 设备信息
    MiniStatuslineFileinfo = { fg = colors.text_dim, bg = colors.surface_dim }, -- Mini.Statusline 文件信息
    MiniStatuslineFilename = { fg = colors.text, bg = colors.surface_dim }, -- Mini.Statusline 文件名
    MiniStatuslineInactive = { fg = colors.text_gutter, bg = colors.surface_dim }, -- Mini.Statusline 非活动窗口
    MiniStatuslineModeCommand = { fg = colors.black, bg = colors.yellow_600, bold = true }, -- Mini.Statusline 命令模式
    MiniStatuslineModeInsert = { fg = colors.black, bg = colors.primary, bold = true }, -- Mini.Statusline 插入模式
    MiniStatuslineModeNormal = { fg = colors.black, bg = colors.blue_700, bold = true }, -- Mini.Statusline 普通模式
    MiniStatuslineModeOther = { fg = colors.black, bg = colors.purple_600, bold = true }, -- Mini.Statusline 其他模式
    MiniStatuslineModeReplace = { fg = colors.black, bg = colors.red_600, bold = true }, -- Mini.Statusline 替换模式
    MiniStatuslineModeVisual = { fg = colors.black, bg = colors.orange_600, bold = true }, -- Mini.Statusline 视觉模式
    MiniTablineCurrent = { fg = colors.primary, bg = colors.surface, bold = true }, -- Mini.Tabline 当前标签
    MiniTablineFill = { bg = colors.surface_dim }, -- Mini.Tabline 填充
    MiniTablineHidden = { fg = colors.text_dim, bg = colors.surface_dim }, -- Mini.Tabline 隐藏标签
    MiniTablineModifiedCurrent = { fg = colors.yellow_600, bg = colors.surface, bold = true }, -- Mini.Tabline 已修改当前标签
    MiniTablineModifiedHidden = { fg = colors.yellow_600, bg = colors.surface_dim }, -- Mini.Tabline 已修改隐藏标签
    MiniTablineModifiedVisible = { fg = colors.yellow_600, bg = colors.surface_dim }, -- Mini.Tabline 已修改可见标签
    MiniTablineTabpagesection = { fg = colors.black, bg = colors.primary }, -- Mini.Tabline 标签页部分
    MiniTablineVisible = { fg = colors.text, bg = colors.surface_dim }, -- Mini.Tabline 可见标签

    BufferLineFill = { bg = colors.surface_bufferline }, -- BufferLine 填充背景
    BufferLineBackground = { fg = colors.text_muted, bg = colors.surface_bufferline }, -- BufferLine 默认 buffer
    BufferLineBufferVisible = { fg = colors.text_dim, bg = colors.surface_panel }, -- BufferLine 可见 buffer
    BufferLineBufferSelected = { fg = colors.text_bright, bg = colors.surface_editor, bold = true }, -- BufferLine 当前 buffer
    BufferLineNumbers = { fg = colors.text_muted, bg = colors.surface_bufferline }, -- BufferLine 编号
    BufferLineNumbersVisible = { fg = colors.text_dim, bg = colors.surface_panel }, -- BufferLine 可见编号
    BufferLineNumbersSelected = { fg = colors.primary_light, bg = colors.surface_editor, bold = true }, -- BufferLine 当前编号
    BufferLineModified = { fg = colors.yellow_600, bg = colors.surface_bufferline }, -- BufferLine 修改标记
    BufferLineModifiedVisible = { fg = colors.yellow_600, bg = colors.surface_panel }, -- BufferLine 可见修改标记
    BufferLineModifiedSelected = { fg = colors.yellow_400, bg = colors.surface_editor }, -- BufferLine 当前修改标记
    BufferLineSeparator = { fg = colors.stroke_strong, bg = colors.surface_bufferline }, -- BufferLine 分隔符
    BufferLineSeparatorVisible = { fg = colors.stroke_strong, bg = colors.surface_panel }, -- BufferLine 可见分隔符
    BufferLineSeparatorSelected = { fg = colors.stroke_soft, bg = colors.surface_editor }, -- BufferLine 当前分隔符
    BufferLineIndicatorSelected = { fg = colors.ui_buffer_active, bg = colors.surface_editor }, -- BufferLine 当前指示器
    BufferLineIndicatorVisible = { fg = colors.ui_buffer_active, bg = colors.surface_panel }, -- BufferLine 可见指示器
    BufferLineIndicator = { fg = colors.ui_buffer_active, bg = colors.surface_bufferline }, -- BufferLine 默认指示器
    BufferLineCloseButton = { fg = colors.text_muted, bg = colors.surface_bufferline }, -- BufferLine 关闭按钮
    BufferLineCloseButtonVisible = { fg = colors.text_dim, bg = colors.surface_panel }, -- BufferLine 可见关闭按钮
    BufferLineCloseButtonSelected = { fg = colors.red_300, bg = colors.surface_editor }, -- BufferLine 当前关闭按钮

    FylerNormal = { fg = colors.text, bg = colors.surface_sidebar }, -- Fyler 普通文本
    FylerNormalNC = { fg = colors.text_dim, bg = colors.surface_sidebar }, -- Fyler 非当前文本
    FylerIndentMarker = { fg = colors.text_gutter }, -- Fyler 缩进标记
    FylerFSDirectoryIcon = { fg = colors.ui_directory }, -- Fyler 目录图标
    FylerFSDirectoryName = { fg = colors.ui_directory }, -- Fyler 目录名

    RainbowDelimiterRed = { fg = colors.magenta_500 }, -- 彩虹括号 - 红色
    RainbowDelimiterYellow = { fg = colors.yellow_500 }, -- 彩虹括号 - 黄色
    RainbowDelimiterBlue = { fg = colors.blue_500 }, -- 彩虹括号 - 蓝色
    RainbowDelimiterOrange = { fg = colors.orange_600 }, -- 彩虹括号 - 橙色
    RainbowDelimiterGreen = { fg = colors.green_500 }, -- 彩虹括号 - 绿色
    RainbowDelimiterViolet = { fg = colors.purple_600 }, -- 彩虹括号 - 紫色
    RainbowDelimiterCyan = { fg = colors.cyan_600 }, -- 彩虹括号 - 青色

    IblIndent = { fg = colors.text_gutter }, -- Indent-Blankline 缩进线
    IblWhitespace = { fg = colors.text_gutter }, -- Indent-Blankline 空白符
    IblScope = { fg = colors.secondary }, -- Indent-Blankline 作用域
    IndentBlanklineChar = { fg = colors.text_gutter }, -- Indent-Blankline 字符 (旧版)
    IndentBlanklineContextChar = { fg = colors.secondary }, -- Indent-Blankline 上下文点 (旧版)
    IndentBlanklineContextStart = { sp = colors.secondary, underline = true }, -- Indent-Blankline 上下文开始 (旧版)

    DashboardHeader = { fg = colors.secondary }, -- Dashboard 头部
    DashboardCenter = { fg = colors.blue_700 }, -- Dashboard 中间部分
    DashboardShortCut = { fg = colors.orange_600 }, -- Dashboard 快捷键
    DashboardFooter = { fg = colors.text_comment, italic = true }, -- Dashboard 底部
    DashboardKey = { fg = colors.yellow_600 }, -- Dashboard 按键
    DashboardDesc = { fg = colors.text }, -- Dashboard 描述
    DashboardIcon = { fg = colors.primary }, -- Dashboard 图标

    AlphaHeader = { fg = colors.secondary }, -- Alpha 头部
    AlphaButtons = { fg = colors.blue_700 }, -- Alpha 按钮
    AlphaShortcut = { fg = colors.orange_600 }, -- Alpha 快捷键
    AlphaFooter = { fg = colors.text_comment, italic = true }, -- Alpha 底部

    SnacksNormal = { fg = colors.text, bg = transparent_bg_dark }, -- Snacks 普通文本
    SnacksBackdrop = { bg = colors.black, blend = 60 }, -- Snacks 背景遮罩
    SnacksBorder = { fg = colors.stroke, bg = transparent_bg_dark }, -- Snacks 边框
    SnacksTitle = { fg = colors.primary, bold = true }, -- Snacks 标题
    SnacksPicker = { fg = colors.text, bg = transparent_bg_dark }, -- Snacks Picker 普通文本
    SnacksPickerBorder = { fg = colors.stroke, bg = transparent_bg_dark }, -- Snacks Picker 边框
    SnacksPickerTitle = { fg = colors.black, bg = colors.secondary, bold = true }, -- Snacks Picker 标题
    SnacksPickerDir = { fg = colors.text_dim }, -- Snacks Picker 目录
    SnacksPickerFile = { fg = colors.text }, -- Snacks Picker 文件
    SnacksPickerMatch = { fg = colors.tertiary_light, bold = true }, -- Snacks Picker 匹配项
    SnacksPickerPrompt = { fg = colors.primary }, -- Snacks Picker 提示符
    SnacksNotifierBorderError = { fg = colors.error, bg = transparent_bg_dark }, -- Snacks 通知错误边框
    SnacksNotifierBorderWarn = { fg = colors.warning, bg = transparent_bg_dark }, -- Snacks 通知警告边框
    SnacksNotifierBorderInfo = { fg = colors.info, bg = transparent_bg_dark }, -- Snacks 通知信息边框
    SnacksNotifierBorderDebug = { fg = colors.purple_600, bg = transparent_bg_dark }, -- Snacks 通知调试边框
    SnacksNotifierBorderTrace = { fg = colors.secondary, bg = transparent_bg_dark }, -- Snacks 通知追踪边框
    SnacksNotifierTitleError = { fg = colors.error, bold = true }, -- Snacks 通知错误标题
    SnacksNotifierTitleWarn = { fg = colors.warning, bold = true }, -- Snacks 通知警告标题
    SnacksNotifierTitleInfo = { fg = colors.info, bold = true }, -- Snacks 通知信息标题
    SnacksNotifierTitleDebug = { fg = colors.purple_600, bold = true }, -- Snacks 通知调试标题
    SnacksNotifierTitleTrace = { fg = colors.secondary, bold = true }, -- Snacks 通知追踪标题
    SnacksDashboardHeader = { fg = colors.secondary }, -- Snacks Dashboard 头部
    SnacksDashboardDesc = { fg = colors.text }, -- Snacks Dashboard 描述
    SnacksDashboardFooter = { fg = colors.text_comment, italic = true }, -- Snacks Dashboard 底部
    SnacksDashboardIcon = { fg = colors.primary }, -- Snacks Dashboard 图标
    SnacksDashboardKey = { fg = colors.yellow_600 }, -- Snacks Dashboard 按键
    SnacksIndent = { fg = colors.text_gutter }, -- Snacks 缩进线
    SnacksIndentScope = { fg = colors.secondary }, -- Snacks 缩进作用域
  }

  highlights.FloatShadow = { bg = colors.black, blend = 60 } -- 浮动窗口阴影
  highlights.FloatShadowThrough = { bg = colors.black, blend = 80 } -- 穿透式浮动窗口阴影

  if type(opts.on_highlights) == "function" then
    opts.on_highlights(highlights, colors)
  end

  return vim.tbl_deep_extend("force", highlights, opts.highlights or {})
end

return M
