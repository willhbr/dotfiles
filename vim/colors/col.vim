" -----------------------------------------------------------
" Design: Sarang Leehan (github.com/saranglove)
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
let colors_name = "col"

" Color Definitions
let s:black         = ["#191F1F", 234]
let s:visual_gray   = ["#2a3341", 236]
let s:dark_gray     = ["#4e4e4e", 239]
let s:mid_gray      = ["#384C4C", 243]
let s:light_gray    = ["#a8a8a8", 248]
let s:white         = ["#dadada", 253]

" Dark green
let s:spring_green  = ["#00875f", 29]
" Paler green/ blue
let s:cadet_blue    = ["#5faf87", 72]
" Bright orange
let s:orange_1      = ["#ffaf00", 214]
" Darker orange
let s:dark_orange   = ["#d75f00", 166]
" Browny brown
let s:brown         = ["#af5f00", 130]
" Tan
let s:tan           = ["#d7af87", 180]
" Light greenish
let s:pastel_lime   = ["#d7d787", 186]

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
call s:HL("Constant",       s:orange_1,   s:none)
call s:HL("String",         s:spring_green,        s:none)
call s:HL("Character",      s:spring_green,   s:none)
call s:HL("Number",         s:orange_1,   s:none)
call s:HL("Boolean",        s:orange_1,   s:none)
call s:HL("Float",          s:orange_1,   s:none)
call s:HL("Identifier",     s:tan,    s:none)
call s:HL("Function",       s:cadet_blue,       s:none)
call s:HL("Statement",      s:brown,         s:none)
call s:HL("Conditional",    s:brown,         s:none)
call s:HL("Repeat",         s:brown,         s:none)
call s:HL("Label",          s:brown,         s:none)
call s:HL("Operator",       s:pastel_lime,         s:none)
call s:HL("Keyword",        s:pastel_lime,         s:none)
call s:HL("Exception",      s:tan,         s:none)
call s:HL("PreProc",        s:tan,         s:none)
call s:HL("Include",        s:tan,    s:none)
call s:HL("Define",         s:tan,         s:none)
call s:HL("Macro",          s:tan,    s:none)
" call s:HL("PreCondit",      s:turquoise,    s:none)
" call s:HL("Type",           s:khaki,        s:none)
" call s:HL("StorageClass",   s:khaki,        s:none)
" call s:HL("Structure",      s:khaki,        s:none)
" call s:HL("Typedef",        s:blue,         s:none)
" call s:HL("Special",        s:light_blue,   s:none)
" call s:HL("SpecialChar",    s:light_blue,   s:none)
" call s:HL("Tag",            s:blue,         s:none)
" call s:HL("Delimiter",      s:cyan,         s:none)
" call s:HL("SpecialComment", s:light_gray,   s:none)
" call s:HL("Underlined",     s:none,         s:none,         {'cterm': 'underline',     'gui': 'underline'})
" call s:HL("Ignore",         s:light_gray,   s:none)
" call s:HL("Error",          s:light_blue,   s:none,         {'cterm': 'bold',          'gui': 'bold'})
" call s:HL("Todo",           s:pink,         s:none,         {'cterm': 'bold',          'gui': 'bolditalic'})
" 
" " Editor styling
call s:HL("ColorColumn",    s:none,         s:visual_gray)
" call s:HL("Cursor",         s:black,        s:cursor_blue)
call s:HL("CursorColumn",   s:light_gray,   s:visual_gray)
call s:HL("CursorLine",     s:none,         s:visual_gray)
call s:HL("CursorLineNr",   s:white,        s:visual_gray)
" call s:HL("DiffAdd",        s:black,        s:green)
" call s:HL("DiffChange",     s:black,        s:yellow)
" call s:HL("DiffDelete",     s:black,        s:light_blue)
" call s:HL("DiffText",       s:black,        s:blue)
call s:HL("Directory",      s:cadet_blue,         s:none)
call s:HL("Error",          s:orange_1,   s:none,         {'cterm': 'underline',     'gui': 'underline'})
call s:HL("ErrorMsg",       s:orange_1,   s:none,         {'cterm': 'bold',          'gui': 'bold'})
call s:HL("Folded",         s:mid_gray,     s:black)
call s:HL("FoldColumn",     s:light_gray,   s:none)
call s:HL("IncSearch",      s:black,        s:light_gray)
call s:HL("LineNr",         s:dark_gray,    s:none)
" call s:HL("MatchParen",     s:black,        s:cyan,         {'cterm': 'bold',          'gui': 'bold'})
call s:HL("ModeMsg",        s:cadet_blue,        s:none)
call s:HL("MoreMsg",        s:cadet_blue,        s:none)
call s:HL("NonText",        s:mid_gray,     s:none)
call s:HL("Pmenu",          s:light_gray,   s:dark_gray)
call s:HL("PmenuSbar",      s:mid_gray,     s:light_gray)
" call s:HL("PmenuSel",       s:black,        s:cursor_blue)
call s:HL("PmenuThumb",     s:light_gray,   s:white)
call s:HL("Question",       s:orange_1,       s:black)
call s:HL("Search",         s:black,        s:tan)
call s:HL("SpecialKey",     s:mid_gray,     s:none)
call s:HL("SpellBad",       s:orange_1,   s:none,         {'cterm': 'underline',     'gui': 'boldundercurl'})
call s:HL("StatusLine",     s:light_gray,   s:visual_gray)
call s:HL("StatusLineNC",   s:black,        s:dark_gray)
call s:HL("BuftabOther",    s:black,        s:light_gray)
call s:HL("BuftabVisible",  s:black,        s:mid_gray)
call s:HL("BuftabSelected", s:black,        s:pastel_lime)
call s:HL("TabLine",        s:black,        s:light_gray)
call s:HL("TabLineSel",     s:black,        s:pastel_lime,         {'cterm': 'bold',          'gui': 'bold'})
call s:HL("Title",          s:dark_orange,        s:none,         {'cterm': 'bold',          'gui': 'bold'})
call s:HL("VertSplit",      s:mid_gray,     s:none)
call s:HL("Visual",         s:mid_gray,     s:dark_gray)
call s:HL("VisualNOS",      s:white,        s:none,         {'cterm': 'boldunderline', 'gui': 'boldunderline'})
call s:HL("WarningMsg",     s:spring_green,   s:none)
call s:HL("WildMenu",       s:black,        s:orange_1)
