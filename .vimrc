"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
syntax on                             "Enable syntax hl
set noerrorbells                      "No sound on errors.
set novisualbell
set confirm
set autoindent                        "indent automatically
set cindent
set smartindent                       "automatic indent for C file
set tabstop=2                         "tab width
set softtabstop=2
set shiftwidth=2
set expandtab                         "Expand tab with space
set smarttab
set number                            "Show line number
set history=1000                      "Sets how many lines of history VIM har to remember
set nobackup                          "Turn backup off
set nowritebackup
set noswapfile
set backupcopy=yes
set ignorecase                        "Ignore case when searching
set smartcase
set incsearch
set hlsearch                          "Highlight search things
set linebreak
set textwidth=500
set ambiwidth=double
set wrap                              "wrap lines
set ruler
filetype on                           "detect file type
filetype plugin on                    "Enable filetype plugin
filetype indent on                    " load special indent format for file types
set viminfo='10,\"100,:20,%,n~/.viminfo   "Restore cursor to file position in previous editing session
"set iskeyword+=_,$,@,%,#,-            "don't return with words containing these characters
set linespace=1
set wildmenu                          "Turn on Wild menu
set backspace=indent,eol,start        "Set backspace
set whichwrap+=<,>,h,l                "Bbackspace and cursor keys wrap to
set autochdir                         "Automatically switch current dir as current file dir
set mouse=a                           "Have the mouse enabled all the time:
set selection=exclusive
set selectmode=mouse,key
set report=0                          "tell which line is modified by :commands
set shortmess=atI                     "no message with startup GUI
set cmdheight=1                       "The commandbar is 2 high
set fillchars=vert:\ ,stl:\ ,stlnc:\  "show space at split line
set showmatch                         "show matching bracets
set matchtime=5                       "How many tenths of a second to blink
"set cursorline                        "highlight current line
"hi CursorLine term=bold cterm=bold guibg=Grey40
set guioptions=

if has("gui_running")
 ""let g:molokai_original=1
 ""colorscheme molokai
 ""colorscheme newspaper

 """""""""""""""""""""""""""""""""""""""""""""
 """ Configuration for color scheme Mayansmoke
 """""""""""""""""""""""""""""""""""""""""""""
 "hi MayanSmokeCursorLine     guifg=NONE   guibg=yellow  gui=NONE 
 "hi MayanSmokeSearch         guifg=white  guibg=blue    gui=NONE 
 "hi MayanSmokeSpecialKey     guifg=NONE   guibg=green   gui=NONE

 "let g:mayansmoke_cursor_line_visibility = 0  " lower visibility 
 ""let g:mayansmoke_cursor_line_visibility = 1  " medium visibility 
 ""let g:mayansmoke_cursor_line_visibility = 2  " higher visibility 

 "let g:mayansmoke_search_visibility = 0 " low visibility 
 ""let g:mayansmoke_search_visibility = 1 " medium visibility (default) 
 ""let g:mayansmoke_search_visibility = 2 " high visibility 
 ""let g:mayansmoke_search_visibility = 3 " very high visibility 
 ""let g:mayansmoke_search_visibility = 4 " highest visibility 

 ""let g:mayansmoke_special_key_visibility = 0  " lower visibility 
 ""let g:mayansmoke_special_key_visibility = 1  " medium visibility 
 ""let g:mayansmoke_special_key_visibility = 2  " higher visibility 
 ""colorscheme mayansmoke
 
 ""colorscheme two2tango 
 ""colorscheme muonly
else
 ""set background=dark
 ""colorscheme blue_sky
 ""colorscheme mayansmoke
 ""colorscheme solarized
 ""colorscheme desert
endif
"set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"colorscheme mac_classic_alt
colorscheme cascadia
let g:pencil_higher_contrast_ui = 1   " 0=low (def), 1=high
let g:pencil_neutral_headings = 1   " 0=blue (def), 1=normal
let g:pencil_terminal_italics = 1
let g:pencil#conceallevel = 3     " 0=disable, 1=onechar, 2=hidechar, 3=hideall (def)
let g:pencil#concealcursor = 'c'  " n=normal, v=visual, i=insert, c=command (def)


"set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
set guifont=Consolas\ 13
set guitablabel=%t
set fileformat=unix
set fileformats=unix,dos,mac          "Favorite filetypes
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>
set autoread                          "Set to auto read when a file is changed from the outside
let mapleader = ","                   "Set mapleader
let g:mapleader = ","
map <leader>s :source ~/.vimrc<cr>    "Fast reloading of the .vimrc
map <leader>e :e! ~/.vimrc<cr>        "Fast editing of .vimrc
autocmd! BufWritePost .vimrc source ~/.vimrc    "When .vimrc is edited, reload it

"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
map <leader>1 :set syntax=c<cr>
map <leader>2 :set syntax=vhdl<cr>
map <leader>3 :set syntax=tcl<cr>
map <leader>4 :set syntax=python<cr>

au BufRead,BufNewFile *.adoc set filetype=asciidoc
au QuickfixCmdPost make,grep,grepadd,vimgrep copen
map <C-j> <ESC>:cn<CR>
map <C-k> <ESC>:cp<CR>

autocmd BufEnter * :syntax sync fromstart
set lazyredraw                        "Do not redraw, when running macros.. lazyredraw
set hidden                            "Change buffer - without saving
set magic                             "Set magic on
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"map <F9> ggVGg?                      " Buffer - reverse everything ... :)

" Configuration for vimdiff
set diffopt=filler,context:10

set previewheight=15
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""     plugin setting                                                      """
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" miniBufferExplorer
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

" Configures for ShowMarks plugin
let showmarks_include =  "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
nnoremap <F10> :ShowMarksToggle<CR>

"" VimCommander
"noremap <silent> <F11> :cal VimCommanderToggle()<CR>

" NerdTree
"nnoremap <F12> :NERDTreeToggle<CR>

" Maps Alt-j and Alt-k to move other window
fun! ScrollOtherWindow(dir)
   "if a:dir == "down"
       "let move = "\<C-E>"
   "elseif a:dir == "up"
       "let move = "\<C-Y>"
   "endif
   "exec "normal \<C-W>p" . move . "\<C-W>p"
endfun
"nmap <silent> <M-j> :call ScrollOtherWindow("down")<CR>
"nmap <silent> <M-k> :call ScrollOtherWindow("up")<CR>


" Narrow Regin Configuration
"let g:nrrw_rgn_vert = 1      " open narrow region vertically
"let g:nrrw_rgn_wdth = 30     " vertically, width
let g:nrrw_rgn_protect = 'n' " don't protect the original buffer. Useful for diff
vmap <F9> <Leader>nr<CR>

"Configuration for Mark
let g:mwDefaultHighlightingPalette = 'extended' " extend the color group to 18
let g:mwDefaultHighlightingNum = 9  " Reduce color group number
let g:mwHistAdd = '' " By default the marked word is also added to search (/) and input (@) but I don't want to do so   

" these two lines remove the default overridding of * and # operation
nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext 
nmap <Plug>IgnoreMarkSearchPrev <Plug>MarkSearchPrev

nmap <Leader>M <Plug>MarkToggle 
nmap <Leader>N <Plug>MarkAllClear

" snipMate Configuration
let g:snips_author = 'Lin Yang'

" BufExplorer Configuration
let g:bufExplorerSplitRight=1        " Split right.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerShowDirectories=0   " Don't show directories.

" Session Man
let g:sessionman_save_on_exit=0 
nnoremap <F3> :SessionSave<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""" STATUS LINE CONFIGURATION EXAMPLE """""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2                      "always show status line

" A plain & simple example
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}  " format the status line

let g:yankring_history_dir = '$VIM'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""     CSCOPE + CTAGS + Taglist              """"""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=tags;
let Tlist_Ctags_Cmd='/usr/bin/ctags'  " Specifies the path to the ctags utility.
let Tlist_Show_One_File=1           " Display the tags for only the current active buffer
let Tlist_Use_Right_Window=1        " Split taglist window on the rightmost side
let Tlist_Inc_Winwidth=0            " Prevent window size change when taglist window is closed
let Tlist_Compact_Format=1          " Reduce the number of empty lines in taglist window
let Tlist_Auto_Highlight_Tag=1      " Automatically highlight the current tag in the taglist
let Tlist_Auto_Update=1             " Automatically update taglist to include newly edited files
let Tlist_Exit_OnlyWindow=1         " Close Vim if the taglist is the only window
let Tlist_File_Fold_Auto_Close=1    " Close tag folds for inactive buffers
let Tlist_Sort_Type='name'          " Sort method used for arrranging the tags
let Tlist_Process_File_Always=1     " Process files even when taglist window is closed

set title titlestring=%<%f\ %([%{Tlist_Get_Tagname_By_Line()}]%)
highlight MyTagListTagName guifg=blue ctermfg=blue

nnoremap  <F9>        :TlistToggle<CR>
nnoremap  <leader>tp  <ESC>:exe "ptjump " . expand("<cword>")<ESC>
nnoremap  <leader>tj  <ESC>:exe "tjump  " . expand("<cword>")<ESC>
map       <M-j>       <ESC>:ptnext<CR>
map       <M-k>       <ESC>:ptprevious<CR>
map       <leader>tg  :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

if has("cscope")
 set cscopeprg=/usr/bin/cscope.exe
 set cscopequickfix=s-,c-,d-,i-,t-,e-
 set csto=0    " cscope databases are searched first, followed by tag files.
 set cscopetag " Search cscope databases instead of the default tag behavior
 set nocsverb  " messages will not be printed indicating success or failure when adding database
 set cspc=6    " display the last 6 components of the file's path

 " add any database in current directory
 if filereadable("cscope.out")
     cs add cscope.out
 " else add database pointed to by environment
 elseif $CSCOPE_DB != ""
     cs add $CSCOPE_DB
 endif
 set csverb
endif

"0 or s: Find this C symbol
"1 or g: Find this definition
"2 or d: Find functions called by this function
"3 or c: Find functions calling this function
"4 or t: Find this text string
"6 or e: Find this egrep pattern
"7 or f: Find this file
"8 or i: Find files #including this file
nmap <leader>is :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ig :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ic :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>it :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ie :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>if :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>ii :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>id :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <leader><leader>is :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader><leader>ig :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader><leader>ic :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader><leader>it :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader><leader>ie :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader><leader>if :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader><leader>ii :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader><leader>id :scs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-F7> :let &guifont = substitute(&guifont, '\ \(\d\+\)', '\="\ " . (submatch(1) - 1)', '')<CR>
nmap <C-F8> :let &guifont = substitute(&guifont, '\ \(\d\+\)', '\="\ " . (submatch(1) + 1)', '')<CR>


"Vim-Markdown support
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
