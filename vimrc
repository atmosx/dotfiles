" .vimrc
"
" author: atmosx
" date: 2024/10/03
" rev: 7
let g:polyglot_disabled = ['markdown']

""" vim plugins start - NOTE: use single quotes
call plug#begin()
Plug 'chrisbra/csv.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'github/copilot.vim'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-journal'
Plug 'liuchengxu/graphviz.vim'
Plug 'madox2/vim-ai'
Plug 'nvie/vim-flake8'
Plug 'pgporada/vim-mtail'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'preservim/vim-lexical'
Plug 'preservim/vim-markdown'
Plug 'preservim/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'wakatime/vim-wakatime'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clang-completer --go-completer --ts-completer' }
call plug#end()
""" vim plugins end

" theme: jellybeans | vividchalk
colorscheme vividchalk

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
set textwidth=160
set rtp+=/opt/local/share/fzf/vim " install fzf (cli utility) bat ripgrep the_silver_searcher perl universal-ctags
set shiftwidth=2
set smartcase " ignore case if search pattern is all lowercase
set tabstop=2 " Programming no tab, just 2 spaces identing
set completeopt+=popup " Allow keyboard based (YCM) popup scrolling
syntax on
filetype plugin on
filetype indent on

" Screen pop-up window
"
"
function! ScrollPopup(down)
    let winid = popup_findinfo()
    if winid == 0
        return 0
    endif

    " if the popup window is hidden, bypass the keystrokes
    let pp = popup_getpos(winid)
    if pp.visible != 1
        return 0
    endif

    let firstline = pp.firstline + a:down
    let buf_lastline = str2nr(trim(win_execute(winid, "echo line('$')")))
    if firstline < 1
        let firstline = 1
    elseif pp.lastline + a:down > buf_lastline
        let firstline = firstline - a:down + buf_lastline - pp.lastline
    endif

    " The appear of scrollbar will change the layout of the content which will cause inconsistent height.
    call popup_setoptions( winid,
                \ {'scrollbar': 0, 'firstline' : firstline } )

    return 1
endfunction

inoremap <expr> <C-e> ScrollPopup(3) ? '' : '<C-e>'
inoremap <expr> <C-y> ScrollPopup(-3) ? '' : '<C-y>'

" warp to 80 when editing git commits
au FileType gitcommit set tw=160

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
" vim fixup
" https://blog.mikecordell.com/2014/07/20/quick-fixup-in-vim-with-fugitive.html
map <space>l :Git! log<CR>gg
nnoremap <C-F> yiw <ESC>:Git commit --fixup=<C-r>"<CR>

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

" Lightline config
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
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
let g:syntastic_python_checkers = ['flake8']

" Fzf search
nnoremap <C-p> :GFiles<Cr>

" copilot keybindings
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" -----------------
" Markdown settings
" -----------------
let g:polyglot_disabled = ['markdown']

" Enable folding.
let g:vim_markdown_folding_disabled = 0

" Fold heading in with the contents.
let g:vim_markdown_folding_style_pythonic = 1

" Don't use the shipped key bindings.
let g:vim_markdown_no_default_key_mappings = 1

" Autoshrink TOCs.
let g:vim_markdown_toc_autofit = 1

" Indentation for new lists. We don't insert bullets as it doesn't play
" nicely with `gq` formatting. It relies on a hack of treating bullets
" as comment characters.
" See https://github.com/plasticboy/vim-markdown/issues/232
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0

" Filetype names and aliases for fenced code blocks.
let g:vim_markdown_fenced_languages = ['php', 'py=python', 'js=javascript', 'bash=sh', 'viml=vim']

" Highlight front matter (useful for Hugo posts).
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_frontmatter = 1

" Format strike-through text (wrapped in `~~`).
let g:vim_markdown_strikethrough = 1

" -------------
" pencil config
" -------------
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init({'wrap': 'hard'})
augroup END
