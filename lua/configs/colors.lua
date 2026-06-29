vim.opt.termguicolors = true
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end
vim.g.colors_name = "ghostty"

local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- Ghostty palette
local c = {
    bg       = "#141413",
    fg       = "#dcd7ba",
    cursor   = "#d97757",
    sel_bg   = "#2d2d2b",
    sel_fg   = "#faf9f5",
    black    = "#1e1e1c",
    red      = "#c25848",
    green    = "#788c5d",
    yellow   = "#c89b40",
    blue     = "#6a9bcc",
    magenta  = "#a07caa",
    cyan     = "#5a9e96",
    white    = "#b0aea5",
    bblack   = "#3a3936",
    bred     = "#d97757",
    bgreen   = "#8fa873",
    byellow  = "#dab36a",
    bblue    = "#85b3da",
    bmagenta = "#b890be",
    bcyan    = "#70b8ae",
    bwhite   = "#faf9f5",
}

-- Derived UI shades
local bg1     = "#1a1917"  -- cursor line
local bg2     = "#1e1e1c"  -- panels / floats (= c.black)
local comment = "#6b6965"  -- subdued fg

-- ── UI ───────────────────────────────────────────────────────────────────────
hi("Normal",          { fg = c.fg,      bg = c.bg })
hi("NormalFloat",     { fg = c.fg,      bg = bg2 })
hi("NormalNC",        { fg = c.white,   bg = c.bg })
hi("ColorColumn",     { bg = bg1 })
hi("CursorLine",      { bg = bg1 })
hi("CursorColumn",    { bg = bg1 })
hi("CursorLineNr",    { fg = c.byellow, bold = true })
hi("LineNr",          { fg = c.bblack })
hi("SignColumn",      { fg = c.bblack,  bg = c.bg })
hi("FoldColumn",      { fg = c.bblack,  bg = c.bg })
hi("Folded",          { fg = c.white,   bg = bg1 })
hi("WinSeparator",    { fg = c.bblack,  bg = c.bg })
hi("VertSplit",       { fg = c.bblack,  bg = c.bg })
hi("StatusLine",      { fg = c.white,   bg = bg2 })
hi("StatusLineNC",    { fg = c.bblack,  bg = bg2 })
hi("TabLine",         { fg = c.white,   bg = bg2 })
hi("TabLineFill",     { bg = c.bg })
hi("TabLineSel",      { fg = c.fg,      bg = c.bg,     bold = true })
hi("Pmenu",           { fg = c.fg,      bg = bg2 })
hi("PmenuSel",        { fg = c.bwhite,  bg = c.sel_bg })
hi("PmenuSbar",       { bg = bg2 })
hi("PmenuThumb",      { bg = c.bblack })
hi("Visual",          { fg = c.sel_fg,  bg = c.sel_bg })
hi("VisualNOS",       { fg = c.sel_fg,  bg = c.sel_bg })
hi("Search",          { fg = c.bg,      bg = c.yellow })
hi("IncSearch",       { fg = c.bg,      bg = c.cursor })
hi("CurSearch",       { fg = c.bg,      bg = c.cursor })
hi("MatchParen",      { fg = c.cursor,  bold = true,   underline = true })
hi("Cursor",          { fg = c.bg,      bg = c.cursor })
hi("CursorIM",        { fg = c.bg,      bg = c.cursor })
hi("NonText",         { fg = c.bblack })
hi("SpecialKey",      { fg = c.bblack })
hi("Whitespace",      { fg = c.bblack })
hi("EndOfBuffer",     { fg = c.bblack })
hi("WildMenu",        { fg = c.fg,      bg = c.sel_bg })
hi("FloatBorder",     { fg = c.bblack,  bg = bg2 })
hi("Question",        { fg = c.bgreen })
hi("Title",           { fg = c.byellow, bold = true })
hi("Directory",       { fg = c.bblue })
hi("ModeMsg",         { fg = c.bgreen })
hi("MoreMsg",         { fg = c.bgreen })
hi("WarningMsg",      { fg = c.yellow })
hi("ErrorMsg",        { fg = c.red,     bg = c.bg })

-- ── Diff ─────────────────────────────────────────────────────────────────────
hi("DiffAdd",         { fg = c.bgreen,  bg = "#1e2a1a" })
hi("DiffChange",      { fg = c.byellow, bg = "#2a2512" })
hi("DiffDelete",      { fg = c.red,     bg = "#2a1414" })
hi("DiffText",        { fg = c.byellow, bg = "#3a3015", bold = true })
hi("Added",           { fg = c.bgreen })
hi("Changed",         { fg = c.byellow })
hi("Removed",         { fg = c.red })

-- ── Diagnostics ──────────────────────────────────────────────────────────────
hi("DiagnosticError",                { fg = c.red })
hi("DiagnosticWarn",                 { fg = c.yellow })
hi("DiagnosticInfo",                 { fg = c.bblue })
hi("DiagnosticHint",                 { fg = c.bcyan })
hi("DiagnosticOk",                   { fg = c.bgreen })
hi("DiagnosticUnderlineError",       { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn",        { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineInfo",        { undercurl = true, sp = c.bblue })
hi("DiagnosticUnderlineHint",        { undercurl = true, sp = c.bcyan })
hi("DiagnosticVirtualTextError",     { fg = c.red })
hi("DiagnosticVirtualTextWarn",      { fg = c.yellow })
hi("DiagnosticVirtualTextInfo",      { fg = c.bblue })
hi("DiagnosticVirtualTextHint",      { fg = c.bcyan })

-- ── Syntax ───────────────────────────────────────────────────────────────────
hi("Comment",         { fg = comment,   italic = true })
hi("Constant",        { fg = c.bred })
hi("String",          { fg = c.bgreen })
hi("Character",       { fg = c.bgreen })
hi("Number",          { fg = c.magenta })
hi("Boolean",         { fg = c.bred })
hi("Float",           { fg = c.magenta })
hi("Identifier",      { fg = c.fg })
hi("Function",        { fg = c.byellow })
hi("Statement",       { fg = c.blue })
hi("Conditional",     { fg = c.blue })
hi("Repeat",          { fg = c.blue })
hi("Label",           { fg = c.blue })
hi("Operator",        { fg = c.cyan })
hi("Keyword",         { fg = c.blue,    bold = true })
hi("Exception",       { fg = c.red })
hi("PreProc",         { fg = c.bmagenta })
hi("Include",         { fg = c.bmagenta })
hi("Define",          { fg = c.bmagenta })
hi("Macro",           { fg = c.bmagenta })
hi("PreCondit",       { fg = c.bmagenta })
hi("Type",            { fg = c.bcyan })
hi("StorageClass",    { fg = c.blue })
hi("Structure",       { fg = c.bcyan })
hi("Typedef",         { fg = c.bcyan })
hi("Special",         { fg = c.bblue })
hi("SpecialChar",     { fg = c.bblue })
hi("Tag",             { fg = c.bblue })
hi("Delimiter",       { fg = c.white })
hi("SpecialComment",  { fg = comment,   bold = true })
hi("Debug",           { fg = c.red })
hi("Underlined",      { underline = true })
hi("Error",           { fg = c.red })
hi("Todo",            { fg = c.bg,      bg = c.yellow, bold = true })

-- ── Treesitter ────────────────────────────────────────────────────────────────
hi("@variable",                { fg = c.fg })
hi("@variable.builtin",        { fg = c.bred })
hi("@variable.parameter",      { fg = c.white })
hi("@constant",                { fg = c.bred })
hi("@constant.builtin",        { fg = c.bred })
hi("@string",                  { fg = c.bgreen })
hi("@string.escape",           { fg = c.bcyan })
hi("@character",               { fg = c.bgreen })
hi("@number",                  { fg = c.magenta })
hi("@float",                   { fg = c.magenta })
hi("@boolean",                 { fg = c.bred })
hi("@function",                { fg = c.byellow })
hi("@function.builtin",        { fg = c.bred })
hi("@function.call",           { fg = c.byellow })
hi("@function.method",         { fg = c.byellow })
hi("@function.method.call",    { fg = c.byellow })
hi("@constructor",             { fg = c.bcyan })
hi("@keyword",                 { fg = c.blue,    bold = true })
hi("@keyword.function",        { fg = c.blue })
hi("@keyword.return",          { fg = c.blue })
hi("@keyword.operator",        { fg = c.cyan })
hi("@keyword.import",          { fg = c.bmagenta })
hi("@operator",                { fg = c.cyan })
hi("@punctuation",             { fg = c.white })
hi("@punctuation.bracket",     { fg = c.white })
hi("@punctuation.delimiter",   { fg = c.white })
hi("@type",                    { fg = c.bcyan })
hi("@type.builtin",            { fg = c.bcyan })
hi("@type.qualifier",          { fg = c.blue })
hi("@attribute",               { fg = c.bmagenta })
hi("@namespace",               { fg = c.bblue })
hi("@module",                  { fg = c.bblue })
hi("@comment",                 { fg = comment,   italic = true })
hi("@tag",                     { fg = c.red })
hi("@tag.attribute",           { fg = c.byellow })
hi("@tag.delimiter",           { fg = c.white })
hi("@markup.heading",          { fg = c.byellow, bold = true })
hi("@markup.link",             { fg = c.bblue,   underline = true })
hi("@markup.raw",              { fg = c.bgreen })
hi("@markup.italic",           { italic = true })
hi("@markup.strong",           { bold = true })

-- ── LSP ──────────────────────────────────────────────────────────────────────
hi("LspReferenceText",               { bg = bg1 })
hi("LspReferenceRead",               { bg = bg1 })
hi("LspReferenceWrite",              { bg = bg1,    underline = true })
hi("LspSignatureActiveParameter",    { fg = c.byellow, underline = true })

-- ── Terminal colors ───────────────────────────────────────────────────────────
vim.g.terminal_color_0  = c.black
vim.g.terminal_color_1  = c.red
vim.g.terminal_color_2  = c.green
vim.g.terminal_color_3  = c.yellow
vim.g.terminal_color_4  = c.blue
vim.g.terminal_color_5  = c.magenta
vim.g.terminal_color_6  = c.cyan
vim.g.terminal_color_7  = c.white
vim.g.terminal_color_8  = c.bblack
vim.g.terminal_color_9  = c.bred
vim.g.terminal_color_10 = c.bgreen
vim.g.terminal_color_11 = c.byellow
vim.g.terminal_color_12 = c.bblue
vim.g.terminal_color_13 = c.bmagenta
vim.g.terminal_color_14 = c.bcyan
vim.g.terminal_color_15 = c.bwhite
