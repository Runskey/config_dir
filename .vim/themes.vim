"set cursorline                        "highlight current line
"hi CursorLine term=bold cterm=bold guibg=Grey40
set guioptions=
set linespace=0

"" tweak spacegray color scheme
"let g:spacegray_underline_search = 0
"let g:spacegray_use_italics = 1
"let g:spacegray_low_contrast = 1
"colorscheme spacegray

"" tweak github color scheme
"let g:github_colors_soft = 1
"colorscheme github 

"" tweak gruvbox color scheme
" Possible values are soft, medium and hard
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_vert_split = 'bg1'
let g:gruvbox_invert_signs = '1'
let g:gruvbox_improved_strings = '1'
let g:gruvbox_improved_warnings = '1'
"colorscheme gruvbox

" tweak one color scheme
let g:one_allow_italics = 1

if has("gui_running")
  if (has("termguicolors"))
    set termguicolors
  endif

  if has("mac")
    "set guifont=InputMonoNarrow-Light:h14
    set guifont=FiraCode-Regular:h14
  else
    set guifont=Consolas\ 10
  endif

  " set theme according to system time
  if strftime("%H") < 7
    set background=dark
    colorscheme one
  elseif strftime("%H") < 14
    set background=light
    colorscheme github
  elseif strftime("%H") < 18
    set background=light
    colorscheme one
  else
    set background=dark
    colorscheme gruvbox
  endif

  nmap <C-F7> :let &guifont = substitute(&guifont, '\ \(\d\+\)', '\="\ " . (submatch(1) - 1)', '')<CR>
  nmap <C-F8> :let &guifont = substitute(&guifont, '\ \(\d\+\)', '\="\ " . (submatch(1) + 1)', '')<CR>
else
  colorscheme gruvbox
  set background=dark " for the dark version
endif
