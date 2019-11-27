" --------------------------------------------------
" ----    General
" --------------------------------------------------
set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
syntax on                             "Enable syntax hl
set noerrorbells                      "No sound on errors.
set novisualbell
set updatetime=400
set confirm
set autoindent                        "indent automatically
set cindent
set smartindent                       "automatic indent
set number                            "Show line number
set history=1000                      "Sets lines of history VIM har to remember
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

set tabstop=2                         "tab width
set softtabstop=2
set expandtab                         "Expand tab with space
set smarttab
set shiftwidth=2

filetype on                           "detect file type
filetype plugin on                    "Enable filetype plugin
filetype indent on                    " load special indent format for file types
autocmd BufRead,BufNewFile *.adoc set filetype=asciidoc
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=0 expandtab smarttab
autocmd FileType py set textwidth=79

set viminfo='10,\"100,:20,%,n~/.viminfo   "Restore cursor to file position in previous editing session
set iskeyword+=_,$,@,%,#,-            "don't return with words containing these characters
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
"set so=999                            "keep current line in the middle of screen

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
nnoremap <leader>w :w<cr>
autocmd! BufWritePost .vimrc source ~/.vimrc    "When .vimrc is edited, reload it
autocmd! BufWritePost ~/.vim/themes.vim source ~/.vimrc    "When .vimrc is edited, reload it
autocmd! BufWritePost ~/.vim/plugins.vim source ~/.vim/plugins.vim "When plugins.vim is edited, reload it

autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen
map <C-j> <ESC>:cn<CR>
map <C-k> <ESC>:cp<CR>

autocmd BufEnter * :syntax sync fromstart
set lazyredraw                        "Do not redraw, when running macros.. lazyredraw
set hidden                            "Change buffer - without saving
set magic                             "Set magic on
autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"map <F11> ggVGg?                      " Buffer - reverse everything ... :)

" Configuration for vimdiff
set diffopt=filler,context:10
set previewheight=15

" --------------------------------------------------
" ----    Status line Configuration Example
" --------------------------------------------------
set laststatus=2                      "always show status line
set statusline=%F%m%r%h%w\ [%{&ff}][%Y]%=[%l,%v][%p%%]\ %{strftime(\"%d/%b/%y\ %H:%M\")}  " format the status line

" --------------------------------------------------
" ----    Status line Configuration Example
" --------------------------------------------------
let g:netrw_banner=0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
autocmd FileType netrw set nolist
"0:thin, 1:long, 2:wide, 3:tree
let g:netrw_liststyle = 3
""open the file in:
""1:horizontal split, 2:vertical split, 3:new tab, 4:previous window
"let g:netrw_browse_split = 4
""sets the width to 25% of the page
"let g:netrw_winsize = 25

" --------------------------------------------------
" ----    Plug 'junegunn/vim-plug'
" --------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
source ~/.vim/plugins.vim

" --------------------------------------------------
" ----    Plug 'vim-scripts/showmarks'
" --------------------------------------------------
let showmarks_include =  "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
nnoremap <F10> :ShowMarksToggle<CR>

" --------------------------------------------------
" ----    Plug 'inkarkat/vim-mark'
" --------------------------------------------------
" switch to a richer palette of up to 18 colors
let g:mwDefaultHighlightingPalette = 'extended'
"let g:mwDefaultHighlightingNum = 9    " Reduce color group number
let g:mwHistAdd = '' " By default the marked word is also added to search (/) and input (@) but I don't want to do so   

" these two lines remove the default overridding of * and # operation
nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext 
nmap <Plug>IgnoreMarkSearchPrev <Plug>MarkSearchPrev

nmap <Leader>M <Plug>MarkToggle 
nmap <Leader>N <Plug>MarkAllClear

" --------------------------------------------------
" ----    Plug 'scrooloose/nerdtree'
" --------------------------------------------------
nnoremap <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeWinSize=24

" --------------------------------------------------
" ----    Plug 'chrisbra/NrrwRgn'
" --------------------------------------------------
"let g:nrrw_rgn_vert = 1      " open narrow region vertically
"let g:nrrw_rgn_wdth = 30     " vertically, width
let g:nrrw_rgn_protect = 'n' " don't protect the original buffer. Useful for diff
vmap <F11> <Leader>nr<CR>

" --------------------------------------------------
" ----    Plug 'octol/vim-cpp-enhanced-highlight'
" --------------------------------------------------
let g:cpp_class_scope_highlight=1

" --------------------------------------------------
" ----    Plug 'Yggdroot/indentLine'
" --------------------------------------------------
" highlight conceal color with colorscheme
let g:indentLine_setColors = 0
" resolve the conflict with vim-markdown
let g:indentLine_concealcursor = ''

" --------------------------------------------------
" ----    Plug 'pangloss/vim-javascript'
" --------------------------------------------------
" Support to javascript
let javascript_enable_domhtmlcss = 1
" support for Flow and its types
let g:javascript_plugin_flow = 1
" recognize jsx syntax in a js file
let g:jsx_ext_required = 0

" --------------------------------------------------
" ----    Plug 'w0rp/ale'
" --------------------------------------------------
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_open_list = 0

" --------------------------------------------------
" ----    Plug 'junegunn/fzf.vim'
" --------------------------------------------------
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" --------------------------------------------------
" ----    Plug 'plasticboy/vim-markdown'
" --------------------------------------------------

" Cheatsheet of fold
" zc  折叠
" zC  对所在范围内所有嵌套的折叠点进行折叠
" zo  展开折叠
" zO  对所在范围内所有嵌套的折叠点展开
" [z  到当前打开的折叠的开始处。
" ]z  到当前打开的折叠的末尾处。
" zj  向下移动。到达下一个折叠的开始处。关闭的折叠也被计入。
" zk  向上移动到前一折叠的结束处。关闭的折叠也被计入。

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
let g:vim_markdown_toc_maxwidth = 24
nnoremap <leader>tb :Toc<CR>

" text emphasis restriction to single-lines
let g:vim_markdown_emphasis_multiline = 0

" enable conceal use Vim's standard conceal configuration
set concealcursor="nc"
set conceallevel=2
" disable conceal regardless of 'conceallevel' setting
"let g:vim_markdown_conceal = 0

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

" --------------------------------------------------
" ----    Plug 'SirVer/ultisnips'
" --------------------------------------------------
"let g:UltiSnipsExpandTrigger="<S-tab>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-h>"

" --------------------------------------------------
" ----    Plug 'airblade/vim-rooter'
" --------------------------------------------------
" Change to file's directory (similar to autochdir).
let g:rooter_change_directory_for_non_project_files = 'current'
" To change directory for the current window only (:lcd)
let g:rooter_use_lcd = 1
"To stop vim-rooter echoing the project directory
let g:rooter_silent_chdir = 1

" --------------------------------------------------
" ----    Plug 'easymotion/vim-easymotion'
" --------------------------------------------------
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)

" --------------------------------------------------
" ----    Plug 'mzlogin/vim-markdown-toc'
" --------------------------------------------------
let g:vmt_auto_update_on_save = 1
let g:vmt_list_item_char = '-'
let g:vmt_cycle_list_item_markers = 0
let g:vmt_include_headings_before = 0

" --------------------------------------------------
" ----    Plug 'liuchengxu/eleline.vim'
" --------------------------------------------------
"let g:eleline_slim = 1

source ~/.vim/tags.vim
source ~/.vim/themes.vim

" --------------------------------------------------
" ----    Plug 'liuchengxu/eleline.vim'
" --------------------------------------------------
let g:hardtime_default_on = 1
let g:hardtime_showmsg = 1
let g:hardtime_ignore_quickfix = 1
let g:hardtime_maxcount = 3
