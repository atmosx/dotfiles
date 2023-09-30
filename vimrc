" author: atmosx
" date: 2023/04/08
" rev: 3

""" vim plugins start - NOTE: use single quotes
call plug#begin()
Plug 'chrisbra/csv.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'junegunn/vim-journal'
Plug 'ledger/vim-ledger'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'preservim/vim-lexical'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --go-completer --rust-completer --ts-completer' }
call plug#end()
""" vim plugins end

" theme
colorscheme jellybeans

" my vim settings
set autoindent
set clipboard=unnamed " copy from tmux
set copyindent " copy the previous indentation on autoindenting
set encoding=utf8
set expandtab
set foldmethod=manual " folding method http://vim.wikia.com/wiki/Folding
set incsearch " show search matches as you type
set laststatus=2
set list
set listchars=tab:▸\ ,eol:¬ " Use the same symbols as TextMate for tabstops and EOLs
set modelines=0
set nocompatible " break away from old vi compatibility
set noeb vb t_vb= " disable visual bell and flash
set nomodeline
set nowrap " Turn off word wrapping
set number
set relativenumber
set textwidth=80
set rtp+=/opt/local/share/fzf/vim " requires fzf cli utility
set shiftwidth=2
set smartcase " ignore case if search pattern is all lowercase
set tabstop=2 " Programming no tab, just 2 spaces identing
syntax on
filetype plugin on
filetype indent on

" warp to 80 when editing git commits
au FileType gitcommit set tw=80

" Spelling opts
:hi SpellBad cterm=underline,bold ctermfg=white ctermbg=black
:map <F7> :setlocal spell! spelllang=engr<CR>

" Personal Journal Options
let g:journal_encrypted = 1
let g:journal_directory = "$HOME/.MyJournal"
let g:GPGDefaultRecipients = '${MY_EMAIL}'

" NERDTree leave ansible retry files out
let NERDTreeIgnore = ['\.retry$']

" VIM Lexical - modern spell check for vim
let g:lexical#spell = 1 " 0=disabled, 1=enabled
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

" spell settings
" set spell spelllang=engr
let g:lexical#spell      = 1
let g:lexical#thesaurus  = ['~/.vim/lexical/thesaurus/mthesaur.txt',]
let g:lexical#dictionary = ['~/.vim/lexical/dict/connectives','~/.vim/lexical/dict/propernames','~/.vim/lexical/dict/web2','~/.vim/lexical/dict/web2a','~/.vim/lexical/dict/words']
"let g:lexical#spellfile  = ['~/.vim/spell/engr.utf-8.spl']

"Ctrl+P
let g:ctrlp_working_path_mode = 0 " search only files in local dir

" vim fixup
" https://blog.mikecordell.com/2014/07/20/quick-fixup-in-vim-with-fugitive.html
map <space>l :Git! log<CR>gg
nnoremap <C-F> yiw <ESC>:Git commit --fixup=<C-r>"<CR>

" Airline display branch
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1

" when working with cron files
autocmd filetype crontab setlocal nobackup nowritebackup

" ---------------
" Golang settings
" ---------------
let g:go_auto_type_info = 1
let g:go_def_mode='gopls'
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports""
let g:go_info_mode='gopls'
let g:go_auto_sameids = 1
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Use 4 space tabs with golang files to match gofmt
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" run commands
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>f <Plug>(go-fmt)

" ---------------
" Python settings
" ---------------
au BufNewFile,BufRead *.py setlocal ts=4 softtabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix
" Python checker
let g:syntastic_python_checkers = ['flake8']

" Run flake8 on every python file for PEP8 compatibility
" autocmd BufWritePost *.py call Flake8()
