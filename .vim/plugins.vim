function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'

"Plug 'taglist.vim'
Plug 'vim-scripts/showmarks'
Plug 'vim-scripts/FencView.vim'
Plug 'vim-scripts/Rainbow-Parenthsis-Bundle'
Plug 'tmhedberg/matchit'
Plug 'chrisbra/SudoEdit.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
Plug 'w0rp/ale'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'vim-scripts/STL-Syntax', { 'for': ['h', 'cpp', 'cc']}
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['h', 'cpp', 'cc']}
Plug 'Yggdroot/indentLine'
Plug 'tomlion/vim-solidity'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'md' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'pangloss/vim-javascript', { 'for': ['js', 'jsx', 'json'] }
Plug 'mxw/vim-jsx', { 'for': ['js', 'jsx', 'json'] } 
Plug 'elzr/vim-json', { 'for': ['js', 'jsx', 'json'] }
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
Plug 'skywind3000/gutentags_plus'
Plug 'rakr/vim-one'
Plug 'benekastah/neomake', Cond(has('nvim'))

call plug#end()
