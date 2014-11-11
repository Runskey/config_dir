"Maintainer:    Lin Yang <yang80107@gmail.com>
"Last Change:   2012-08-04
"Version:       1.0

set background=dark
if version > 580
    "no guarantees for version 5.8 and below, but this makes it stop complaining
    hi clear
    if exists("syntax_on")
    syntax reset
    endif
endif
let g:colors_name="muonly"

hi Normal       ctermfg=250 ctermbg=234                             gui=None        guifg=#bcbcbc       guibg=#2e3436
hi LineNr       ctermfg=239 ctermbg=234                             gui=None        guifg=#4e4e4e       guibg=#2e3436
hi NonText      ctermfg=234 ctermbg=234                             gui=None        guifg=#2e3436       guibg=#2e3436

hi VertSplit    ctermfg=237 ctermbg=235 cterm=none                  gui=None        guifg=#3a3a3a       guibg=#262626
hi StatusLine   ctermfg=249 ctermbg=235 cterm=underline             gui=underline   guifg=#b2b2b2       guibg=#262626
hi StatusLineNC ctermfg=243 ctermbg=235 cterm=none                  gui=None        guifg=#767676       guibg=#262626

"hi DiffDelete   ctermfg=234 ctermbg=233                             gui=None        guifg=#2e3436       guibg=#121212
"hi DiffAdd      ctermbg=236                                         gui=None        guibg=#303030
"hi DiffChange   ctermbg=235                                         gui=None        guibg=#262626
"hi DiffText     ctermfg=161 ctermbg=234 cterm=underline             gui=underline   guifg=#df005f       guibg=#2e3436

hi DiffDelete   ctermfg=234 ctermbg=233 guifg=#2e3436 guibg=#007f00
hi DiffAdd      ctermbg=236             guibg=#7f0000
hi DiffChange   ctermbg=235             guibg=#262626
hi DiffText     ctermfg=161 ctermbg=234 guifg=#df005f guibg=#00007f

hi Cursor       ctermfg=234 ctermbg=250                             gui=None        guifg=#2e3436       guibg=#bcbcbc

hi Visual       ctermfg=234 ctermbg=122                             gui=None        guifg=#2e3436       guibg=#87ffdf

hi Folded       ctermfg=244 ctermbg=235                             gui=None        guifg=#808080       guibg=#262626
hi FoldColumn   ctermfg=244 ctermbg=234                             gui=None        guifg=#808080       guibg=#2e3436

hi IncSearch    ctermfg=234 ctermbg=214 cterm=underline             gui=underline   guifg=#2e3436       guibg=#ffaf00
hi Search       ctermfg=234 ctermbg=214 cterm=none                  gui=None        guifg=#2e3436       guibg=#ffaf00

hi ModeMsg      ctermfg=117 ctermbg=234 cterm=bold                  gui=bold        guifg=#87dfff       guibg=#2e3436
hi MoreMsg      ctermfg=122 ctermbg=234 cterm=none                  gui=None        guifg=#87ffdf       guibg=#2e3436
hi Question     ctermfg=122 ctermbg=234 cterm=bold                  gui=bold        guifg=#87ffdf       guibg=#2e3436
hi WarningMsg   ctermfg=122 ctermbg=234 cterm=none                  gui=None        guifg=#87ffdf       guibg=#2e3436
hi ErrorMsg     ctermfg=255 ctermbg=160 cterm=none                  gui=None        guifg=#eeeeee       guibg=#df0000
hi Error        ctermfg=196 ctermbg=234 cterm=none                  gui=None        guifg=#ff0000       guibg=#2e3436

hi SpecialKey   ctermfg=214 ctermbg=234                             gui=None        guifg=#ffaf00       guibg=#2e3436
hi Title        ctermfg=075 ctermbg=234 cterm=bold                  gui=bold        guifg=#5fafff       guibg=#2e3436
hi Directory    ctermfg=117 ctermbg=234 cterm=bold                  gui=bold        guifg=#87dfff       guibg=#2e3436

hi SignColumn   ctermfg=214 ctermbg=235                             gui=None        guifg=#ffaf00       guibg=#262626

hi WildMenu     ctermfg=075 ctermbg=235 cterm=bold                  gui=bold        guifg=#5fafff       guibg=#262626

if version >= 700 " Vim 7.x specific colors
    hi CursorLine   ctermbg=235 cterm=none                          gui=None        guibg=#262626
    hi CursorColumn ctermbg=235 cterm=none                          gui=None        guibg=#262626

    hi MatchParen   ctermfg=196 ctermbg=234 cterm=bold,reverse      gui=bold,reverse    guifg=#ff0000       guibg=#2e3436

    hi Tabline      ctermfg=245 ctermbg=235 cterm=underline         gui=underline   guifg=#8a8a8a       guibg=#262626
    hi TablineSel   ctermfg=250 ctermbg=234 cterm=bold              gui=bold        guifg=#bcbcbc       guibg=#2e3436
    hi TablineFill  ctermfg=250 ctermbg=237 cterm=underline         gui=underline   guifg=#bcbcbc       guibg=#3a3a3a

    hi Pmenu        ctermfg=250 ctermbg=235 cterm=none              gui=None        guifg=#bcbcbc       guibg=#262626
    hi PmenuSel     ctermfg=117 ctermbg=234 cterm=underline         gui=underline   guifg=#87dfff       guibg=#2e3436
    hi PmenuSbar    ctermfg=116 ctermbg=234 cterm=none              gui=None        guifg=#87dfdf       guibg=#2e3436
    hi PmenuThumb   ctermfg=116 ctermbg=116 cterm=none              gui=None        guifg=#87dfdf       guibg=#87dfdf

    hi SpellBad     ctermfg=198 ctermbg=234 cterm=underline         gui=underline   guifg=#ff0087       guibg=#2e3436
    hi SpellCap     ctermfg=198 ctermbg=234 cterm=none              gui=None        guifg=#ff0087       guibg=#2e3436
    hi SpellRare    ctermfg=198 ctermbg=234 cterm=none              gui=None        guifg=#ff0087       guibg=#2e3436
    hi SpellLocal   ctermfg=198 ctermbg=234 cterm=none              gui=None        guifg=#ff0087       guibg=#2e3436
endif

if version >= 703 " Vim 7.3 specific colors
    hi ColorColumn ctermbg=235                                      gui=None        guibg=#262626
endif

" syntax highlighting groups
hi Comment    ctermfg=240 ctermbg=234                               gui=italic      guifg=#585858       guibg=#2e3436
hi Constant   ctermfg=086 ctermbg=234                               gui=None        guifg=#5fffdf       guibg=#2e3436
hi Identifier ctermfg=080 ctermbg=234 cterm=bold                    gui=bold        guifg=#5fdfdf       guibg=#2e3436
hi String     ctermfg=074 ctermbg=234                               gui=None        guifg=#5fafdf       guibg=#2e3436
hi Statement  ctermfg=159 ctermbg=234 cterm=none                    gui=None        guifg=#afffff       guibg=#2e3436
hi PreProc    ctermfg=122 ctermbg=234                               gui=None        guifg=#87ffdf       guibg=#2e3436
hi Function   ctermfg=121 ctermbg=234 cterm=bold                    gui=bold        guifg=#87ffaf       guibg=#2e3436
hi Type       ctermfg=117 ctermbg=234 cterm=bold                    gui=bold        guifg=#87dfff       guibg=#2e3436
hi Special    ctermfg=050 ctermbg=234                               gui=None        guifg=#00ffdf       guibg=#2e3436
hi Delimiter  ctermfg=153 ctermbg=234                               gui=None        guifg=#afdfff       guibg=#2e3436
hi Number     ctermfg=086 ctermbg=234                               gui=None        guifg=#5fffdf       guibg=#2e3436
hi Ignore     ctermfg=214 ctermbg=234                               gui=None        guifg=#ffaf00       guibg=#2e3436
hi Todo       ctermfg=196 ctermbg=234                               gui=None        guifg=#ff0000       guibg=#2e3436
hi Exception  ctermfg=080 ctermbg=234 cterm=bold                    gui=bold        guifg=#5fdfdf       guibg=#2e3436

"vim: sw=4
