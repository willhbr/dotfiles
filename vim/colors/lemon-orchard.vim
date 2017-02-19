" -----------------------------------------------------------
" lemon-orchard.vim -- A zesty Vim theme
" Design: Sarang Leehan
" Maintainer: Will Richardson (github.com/javanut13)
" License: MIT
" Modifed: 2017-02-19
" Based on deep-space.vim by Brandon Siders
" <tyrannicaltoucan@gmail.com>
" -----------------------------------------------------------

highlight clear

if exists("syntax_on")
    syntax reset
endif

set background=dark

let t_Co = 256
let colors_name = "lemon-orchard"

" Color Definitions
let s:black         = ["#191F1F", 234]
let s:visual_gray   = ["#2a3341", 236]
let s:dark_gray     = ["#323c4d", 237]
let s:mid_gray      = ["#384C4C", 243]
let s:light_gray    = ["#9aa7bd", 248]
let s:white         = ["#c9d0dc", 252]

let s:light_blue    = ["#5fd7ff", 75]
let s:green         = ["#5faf5f", 71]
let s:yellow        = ["#ffffaf", 229]
let s:blue          = ["#afaf5f", 143]
let s:turquoise     = ["#008787", 30]
let s:cyan          = ["#56adb7", 73]
let s:pink          = ["#ae413b", 175]
let s:khaki         = ["#afaf5f", 143]
let s:cursor_blue   = ["#599dff", 75]

let s:none          = ["NONE", "NONE"]

function! s:HL(group, fg, bg, ...)
    execute 'hi!' a:group 'ctermfg='.a:fg[1] 'ctermbg='.a:bg[1]
                \ 'cterm='.(a:0 > 0 ? get(a:1,'cterm','NONE'):'NONE')
                \ 'guifg='.a:fg[0] 'guibg='a:bg[0]
                \ 'gui='.(a:0 > 0 ? get(a:1,'gui','NONE'):'NONE')
                \ 'guisp='.(a:0 > 0 ? get(a:1,'guisp','NONE'):'NONE')
endfun

" Text
call s:HL("Normal",         s:light_gray,   s:black)

" Base sytax styling
call s:HL("Comment",        s:mid_gray,     s:none,         {"gui": "italic"})
call s:HL("Constant",       s:light_blue,   s:none)
call s:HL("String",         s:green,        s:none)
call s:HL("Character",      s:light_blue,   s:none)
call s:HL("Number",         s:light_blue,   s:none)
call s:HL("Boolean",        s:light_blue,   s:none)
call s:HL("Float",          s:light_blue,   s:none)
call s:HL("Identifier",     s:turquoise,    s:none)
call s:HL("Function",       s:yellow,       s:none)
call s:HL("Statement",      s:blue,         s:none)
call s:HL("Conditional",    s:blue,         s:none)
call s:HL("Repeat",         s:blue,         s:none)
call s:HL("Label",          s:blue,         s:none)
call s:HL("Operator",       s:cyan,         s:none)
call s:HL("Keyword",        s:cyan,         s:none)
call s:HL("Exception",      s:blue,         s:none)
call s:HL("PreProc",        s:cyan,         s:none)
call s:HL("Include",        s:turquoise,    s:none)
call s:HL("Define",         s:blue,         s:none)
call s:HL("Macro",          s:turquoise,    s:none)
call s:HL("PreCondit",      s:turquoise,    s:none)
call s:HL("Type",           s:khaki,        s:none)
call s:HL("StorageClass",   s:khaki,        s:none)
call s:HL("Structure",      s:khaki,        s:none)
call s:HL("Typedef",        s:blue,         s:none)
call s:HL("Special",        s:light_blue,   s:none)
call s:HL("SpecialChar",    s:light_blue,   s:none)
call s:HL("Tag",            s:blue,         s:none)
call s:HL("Delimiter",      s:cyan,         s:none)
call s:HL("SpecialComment", s:light_gray,   s:none)
call s:HL("Underlined",     s:none,         s:none,         {'cterm': 'underline',     'gui': 'underline'})
call s:HL("Ignore",         s:light_gray,   s:none)
call s:HL("Error",          s:light_blue,   s:none,         {'cterm': 'bold',          'gui': 'bold'})
call s:HL("Todo",           s:pink,         s:none,         {'cterm': 'bold',          'gui': 'bolditalic'})

" Editor styling
call s:HL("ColorColumn",    s:none,         s:visual_gray)
call s:HL("Cursor",         s:black,        s:cursor_blue)
call s:HL("CursorColumn",   s:light_gray,   s:visual_gray)
call s:HL("CursorLine",     s:none,         s:visual_gray)
call s:HL("CursorLineNr",   s:white,        s:visual_gray)
call s:HL("DiffAdd",        s:black,        s:green)
call s:HL("DiffChange",     s:black,        s:yellow)
call s:HL("DiffDelete",     s:black,        s:light_blue)
call s:HL("DiffText",       s:black,        s:blue)
call s:HL("Directory",      s:blue,         s:none)
call s:HL("Error",          s:light_blue,   s:none,         {'cterm': 'underline',     'gui': 'underline'})
call s:HL("ErrorMsg",       s:light_blue,   s:none,         {'cterm': 'bold',          'gui': 'bold'})
call s:HL("Folded",         s:mid_gray,     s:black)
call s:HL("FoldColumn",     s:light_gray,   s:none)
call s:HL("IncSearch",      s:black,        s:light_gray)
call s:HL("LineNr",         s:dark_gray,    s:none)
call s:HL("MatchParen",     s:black,        s:pink,         {'cterm': 'bold',          'gui': 'bold'})
call s:HL("ModeMsg",        s:green,        s:none)
call s:HL("MoreMsg",        s:green,        s:none)
call s:HL("NonText",        s:mid_gray,     s:none)
call s:HL("Pmenu",          s:light_gray,   s:dark_gray)
call s:HL("PmenuSbar",      s:mid_gray,     s:light_gray)
call s:HL("PmenuSel",       s:black,        s:cursor_blue)
call s:HL("PmenuThumb",     s:light_gray,   s:white)
call s:HL("Question",       s:yellow,       s:black)
call s:HL("Search",         s:black,        s:yellow)
call s:HL("SpecialKey",     s:mid_gray,     s:none)
call s:HL("SpellBad",       s:light_blue,   s:none,         {'cterm': 'underline',     'gui': 'boldundercurl'})
call s:HL("SpellCap",       s:blue,         s:none,         {'cterm': 'underline',     'gui': 'boldundercurl'})
call s:HL("SpellLocal",     s:cyan,         s:none,         {'cterm': 'underline',     'gui': 'boldundercurl'})
call s:HL("SpellRare",      s:turquoise,    s:none,         {'cterm': 'underline',     'gui': 'boldundercurl'})
call s:HL("StatusLine",     s:light_gray,   s:visual_gray)
call s:HL("StatusLineNC",   s:black,        s:dark_gray)
call s:HL("BuftabOther",    s:black,        s:light_gray)
call s:HL("BuftabVisible",  s:black,        s:khaki)
call s:HL("BuftabSelected", s:black,        s:yellow)
call s:HL("TabLine",        s:black,        s:light_gray)
call s:HL("TabLineSel",     s:black,        s:blue,         {'cterm': 'bold',          'gui': 'bold'})
call s:HL("Title",          s:green,        s:none,         {'cterm': 'bold',          'gui': 'bold'})
call s:HL("VertSplit",      s:mid_gray,     s:none)
call s:HL("Visual",         s:mid_gray,     s:dark_gray)
call s:HL("VisualNOS",      s:white,        s:none,         {'cterm': 'boldunderline', 'gui': 'boldunderline'})
call s:HL("WarningMsg",     s:light_blue,   s:none)
call s:HL("WildMenu",       s:black,        s:cursor_blue)

" Javascript styling
call s:HL("javaScriptBraces",       s:light_gray,   s:none)
call s:HL("javaScriptFunction",     s:blue,         s:none)
call s:HL("javaScriptIdentifier",   s:turquoise,    s:none)
call s:HL("javaScriptNull",         s:light_blue,   s:none)
call s:HL("javaScriptNumber",       s:light_blue,   s:none)
call s:HL("javaScriptRequire",      s:cyan,         s:none)
call s:HL("javaScriptReserved",     s:blue,         s:none)

" CSS Styling
call s:HL("cssAttrComma",           s:blue,        s:none)
call s:HL("cssAttributeSelector",   s:green,       s:none)
call s:HL("cssBraces",              s:light_gray,  s:none)
call s:HL("cssClassName",           s:yellow,      s:none)
call s:HL("cssClassNameDot",        s:yellow,      s:none)
call s:HL("cssDefinition",          s:blue,        s:none)
call s:HL("cssFontAttr",            s:light_blue,  s:none)
call s:HL("cssFontDescriptor",      s:blue,        s:none)
call s:HL("cssFunctionName",        s:blue,        s:none)
call s:HL("cssIdentifier",          s:khaki,       s:none)
call s:HL("cssImportant",           s:blue,        s:none)
call s:HL("cssInclude",             s:light_gray,  s:none)
call s:HL("cssIncludeKeyword",      s:turquoise,   s:none)
call s:HL("cssMediaType",           s:cyan,        s:none)
call s:HL("cssProp",                s:light_gray,  s:none)
call s:HL("cssPseudoClassId",       s:light_blue,  s:none)
call s:HL("cssSelectorOp",          s:blue,        s:none)
call s:HL("cssSelectorOp2",         s:blue,        s:none)
call s:HL("cssTagName",             s:blue,        s:none)

" HTML Styling
call s:HL("Title",                  s:light_gray,  s:none,        {'cterm': 'bold',        'gui': 'bold'})
call s:HL("htmlArg",                s:light_blue,  s:none)
call s:HL("htmlEndTag",             s:blue,        s:none)
call s:HL("htmlH1",                 s:light_gray,  s:none)
call s:HL("htmlLink",               s:cyan,        s:none)
call s:HL("htmlSpecialChar",        s:khaki,       s:none)
call s:HL("htmlSpecialTagName",     s:turquoise,   s:none)
call s:HL("htmlTag",                s:light_gray,  s:none)
call s:HL("htmlTagName",            s:turquoise,   s:none)

" Ruby styling
call s:HL("rubyBlockParameter",          s:turquoise,   s:none)
call s:HL("rubyBlockParameterList",      s:turquoise,   s:none)
call s:HL("rubyClass",                   s:blue,        s:none)
call s:HL("rubyConstant",                s:khaki,       s:none)
call s:HL("rubyControl",                 s:blue,        s:none)
call s:HL("rubyEscape",                  s:light_blue,  s:none)
call s:HL("rubyFunction",                s:yellow,      s:none)
call s:HL("rubyInterpolation",           s:green,       s:none)
call s:HL("rubyInterpolationDelimiter",  s:pink,        s:none)
call s:HL("rubyRegexpSpecial",           s:yellow,      s:none)
call s:HL("rubyRegexp",                  s:cyan,        s:none)
call s:HL("rubyRegexpDelimiter",         s:cyan,        s:none)
call s:HL("rubyStringDelimiter",         s:green,       s:none)
call s:HL("rubySymbol",                  s:light_blue,  s:none)
