function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'

"Plug 'cscope.vim'
"Plug 'ctags.vim'
"Plug 'taglist.vim'
"Plug 'sessionman.vim'
Plug 'vim-scripts/showmarks'
Plug 'vim-scripts/FencView.vim'
Plug 'vim-scripts/Rainbow-Parenthsis-Bundle'
Plug 'tmhedberg/matchit'
Plug 'chrisbra/SudoEdit.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'jlanzarotta/bufexplorer'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
Plug 'w0rp/ale'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'vim-scripts/STL-Syntax'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Yggdroot/indentLine'
Plug 'tomlion/vim-solidity'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx' 
Plug 'elzr/vim-json'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'BurntSushi/ripgrep'
Plug 'wincent/ferret'
Plug 'airblade/vim-rooter'
Plug 'gregsexton/Atom'
Plug 'gregsexton/Gravity'
Plug 'gregsexton/Muon'
Plug 'cormacrelf/vim-colors-github'
Plug 'ajh17/Spacegray.vim'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'

Plug 'benekastah/neomake', Cond(has('nvim'))

call plug#end()
