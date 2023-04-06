""" atmosx vim configuration file

""" vim plugins
call plug#begin()
" Make sure you use single quotes
Plug 'chrisbra/csv.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clang-completer --go-completer --ts-completer' }

" Initialize plugin system
call plug#end()
