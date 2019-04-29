
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
set smartindent                       "automatic indent

" _________________________________________________
" tab setting
set tabstop=2                         "tab width
set softtabstop=2
set shiftwidth=2
set expandtab                         "Expand tab with space
set smarttab
" for js file, 4 spaces
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab smarttab

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
set iskeyword+=_,$,@,%,#,-            "don't return with words containing these characters
set linespace=1
set wildmenu                          "Turn on Wild menu
set backspace=indent,eol,start        "Set backspace
set whichwrap+=<,>,h,l                "Bbackspace and cursor keys wrap to
"set autochdir                         "Automatically switch current dir as current file dir.
                                      ""don't need. Use vim rooter plugin instead.
set mouse=a                           "Have the mouse enabled all the time:
set selection=exclusive
set selectmode=mouse,key
set report=0                          "tell which line is modified by :commands
set shortmess=atI                     "no message with startup GUI
set cmdheight=1                       "The commandbar is 2 high
set fillchars=vert:\ ,stl:\ ,stlnc:\  "show space at split line
set showmatch                         "show matching bracets
set matchtime=5                       "How many tenths of a second to blink

au FileType py set textwidth=79

" Install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
source ~/.vim/plugins.vim

nnoremap <leader>w :w<cr>

set guitablabel=%t
set fileformat=unix
set fileformats=unix,dos,mac          "Favorite filetypes
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>
set autoread                          "Set to auto read when a file is changed from the outside
let mapleader = ","                   "Set mapleader
let g:mapleader = ","
"map <leader>s :source ~/.vimrc<cr>    "Fast reloading of the .vimrc
map <leader>e :e! ~/.vimrc<cr>
autocmd! BufWritePost .vimrc source ~/.vimrc    "When .vimrc is edited, reload it
autocmd! BufWritePost plugins.vim source ~/.vim/plugins.vim "When plugins.vim is edited, reload it

""Some nice mapping to switch syntax (useful if one mixes different languages in one file)
"map <leader>1 :set syntax=c<cr>
"map <leader>2 :set syntax=vhdl<cr>
"map <leader>3 :set syntax=tcl<cr>
"map <leader>4 :set syntax=python<cr>

au BufRead,BufNewFile *.adoc set filetype=asciidoc
au QuickfixCmdPost make,grep,grepadd,vimgrep copen
map <C-j> <ESC>:cn<CR>
map <C-k> <ESC>:cp<CR>

autocmd BufEnter * :syntax sync fromstart
set lazyredraw                        "Do not redraw, when running macros.. lazyredraw
set hidden                            "Change buffer - without saving
set magic                             "Set magic on
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"map <F11> ggVGg?                      " Buffer - reverse everything ... :)

" Configuration for vimdiff
set diffopt=filler,context:10

set previewheight=15

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""" STATUS LINE CONFIGURATION EXAMPLE """""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2                      "always show status line

" A plain & simple example
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}  " format the status line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""     plugin setting                                                      """
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Configures for ShowMarks plugin
let showmarks_include =  "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
nnoremap <F10> :ShowMarksToggle<CR>

" __________________________________________________
" Tweak vim-mark
" switch to a richer palette of up to 18 colors
let g:mwDefaultHighlightingPalette = 'extended'
"let g:mwDefaultHighlightingNum = 9    " Reduce color group number
let g:mwHistAdd = '' " By default the marked word is also added to search (/) and input (@) but I don't want to do so   

" these two lines remove the default overridding of * and # operation
nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext 
nmap <Plug>IgnoreMarkSearchPrev <Plug>MarkSearchPrev

nmap <Leader>M <Plug>MarkToggle 
nmap <Leader>N <Plug>MarkAllClear

" NerdTree
nnoremap <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let g:NERDTreeShowBookmarks=1

" Narrow Regin Configuration
"let g:nrrw_rgn_vert = 1      " open narrow region vertically
"let g:nrrw_rgn_wdth = 30     " vertically, width
let g:nrrw_rgn_protect = 'n' " don't protect the original buffer. Useful for diff
vmap <F11> <Leader>nr<CR>

" BufExplorer Configuration
let g:bufExplorerSplitRight=1        " Split right.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerShowDirectories=0   " Don't show directories.

" Session Man
let g:sessionman_save_on_exit=0 
nnoremap <F3> :SessionSave<CR>

" snipMate Configuration
let g:snips_author = 'Lin Yang'

let g:cpp_class_scope_highlight=1

"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=2
"let g:indent_guides_guide_size=2
"let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" ___________________________________________________________
" vim-indentLine
" highlight conceal color with colorscheme
let g:indentLine_setColors = 0


" Support to javascript
let javascript_enable_domhtmlcss = 1
" support for Flow and its types
let g:javascript_plugin_flow = 1
" recognize jsx syntax in a js file
let g:jsx_ext_required = 0
" ale combine eslint
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_open_list = 0

" ____________________________________________________
" tweak search and replace
" Add fzf into vim runtime path

nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" ____________________________________________________
" tweak markdown

"" disable folding
"let g:vim_markdown_folding_disabled = 1

"" fold in a style like python-mode
"" g:vim_markdown_folding_level setting is not active with this fold style
"let g:vim_markdown_folding_style_pythonic = 1

" folding level is a number between 1 and 6
let g:vim_markdown_folding_level = 6

"" disable default key mapping
"let g:vim_markdown_no_default_key_mappings = 1

" allow for the TOC window to auto-fit
let g:vim_markdown_toc_autofit = 1

" text emphasis restriction to single-lines
let g:vim_markdown_emphasis_multiline = 0

" enable conceal use Vim's standard conceal configuration
set conceallevel=2
" disable math conceal with LaTeX math syntax enabled
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" fenced code block languages
let g:vim_markdown_fenced_languages = ['csharp=cs', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']

" hightlight JSON front matter as used by Hugo 
let g:vim_markdown_json_frontmatter = 1

" use strikethrough
let g:vim_markdown_strikethrough = 1

" adjust the number of spaces of indent of new list item
let g:vim_markdown_new_list_item_indent = 2

" do NOT require .md extensions for Markdown links
let g:vim_markdown_no_extensions_in_markdown = 1

" __________________________________________________
" set UltiSnips
"let g:UltiSnipsExpandTrigger="<S-tab>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-h>"

" __________________________________________________
" Change to file's directory (similar to autochdir).
let g:rooter_change_directory_for_non_project_files = 'current'
" To change directory for the current window only (:lcd)
let g:rooter_use_lcd = 1
"To stop vim-rooter echoing the project directory
let g:rooter_silent_chdir = 1

source ~/.vim/plugins.vim
source ~/.vim/tags.vim
source ~/.vim/themes.vim
