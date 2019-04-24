""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""     CSCOPE + CTAGS + Taglist              """"""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax for multiple tag files are
" set tags=/my/dir1/tags, /my/dir2/tags
set tags=tags;$HOME/.vim/tags/
if has("mac")
  let Tlist_Ctags_Cmd='/opt/local/bin/ctags'  " Specifies the path to the ctags utility.
else
  let Tlist_Ctags_Cmd='/usr/bin/ctags'  " Specifies the path to the ctags utility.
endif
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

nnoremap  <F11>        :TlistToggle<CR>
nnoremap  <leader>tp  <ESC>:exe "ptjump " . expand("<cword>")<ESC>
nnoremap  <leader>tj  <ESC>:exe "tjump  " . expand("<cword>")<ESC>
map       <M-j>       <ESC>:ptnext<CR>
map       <M-k>       <ESC>:ptprevious<CR>
map       <leader>tg  :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

if has("cscope")
  if has("win32")
    set cscopeprg=/usr/bin/cscope.exe
  endif
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


" __________________________________________________
" set gtags 
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '$HOME/.globalrc'

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
