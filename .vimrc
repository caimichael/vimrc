colorscheme molokai

syntax enable

" Set to read when a file is changed
set autoread

set t_Co=256
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete

" Set the number toggle
set relativenumber
set number

"============="
" INDENTATION "
"============="

" Render tabs as 4 spaces
set tabstop=4                   " Tabs are four spaces
set softtabstop=4               " Tabs counts as four spaces
set shiftwidth=4                " << >> gives you four spaces

" For those who have the sanity to use 4 spaces
set smarttab
set expandtab

set autoindent                  " Auto indent
set smartindent                 " Smart indent

" Displays tabs with :set list
" Displays when a line runs off-screen
set nowrap                      " Dont wrap lines
set so=10                        " set 10 lines to the cursor

"================"
" REMAPPING KEYS "
"================"

"Ctrl-P Fuzzy Find
set runtimepath^=~/.vim/bundle/ctrlp.vim


" Smart way to move between windows
map  wj <C-W>j
map  wk <C-W>k
map  wh <C-W>h
map  wl <C-W>l

" << >> gives me tabs
nmap <S-Tab> <<

"Remapping semi-colon to colon
nnoremap ; :

"A more convenient way of dragging/duping Visual Blocks
"Damian Conway -> Oscon 2013 - More Instantly Better Vim
runtime plugin/dragvisuals.vim

vmap <expr> h   DVB_Drag('left')
vmap <expr> l   DVB_Drag('right')
vmap <expr> j   DVB_Drag('down')
vmap <expr> k   DVB_Drag('up')
vmap <expr> D   DVB_Duplicate()
"Remove any introduced trailing whitespace after moving...
"let g: DVB_TrimWS = 1


"==========="
" INTERFACE "
"==========="

set ruler                       " Show current position
set showmatch                   " Show matching parens
set number                      " Display line numbers
set wildmenu                    " Menu completion in command mode on <Tab>
set wildmode=full               " <Tab> cycles between all matching choices.
set showcmd                     " Show last command
set encoding=utf8
set hid
set ignorecase
set smartcase
set hlsearch
set incsearch 
set lazyredraw 
set magic
set showmatch 
set mat=2

"=================="
" UNDO AND BACKUPS "
"=================="

" Fuck backup files
set nobackup
set nowb
set noswapfile

" Undo
set undofile                " Save undo's after file closes
set undodir=~/.vim/undo     " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set autocomplete form
set completeopt=menuone,longest,preview

" Python reindents 
autocmd BufRead python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,
autocmd BufRead python set colorcolumn=80

" Markdown
autocmd FileType markdown set spell
autocmd FileType markdown set nonumber

" HTML (tab width 2 chr, no wrapping)
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2

" CSS (tab width 2 chr, wrap at 79th char)
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()

" Automatically start up NERDTree & start cursor in main window & close upon
" opening a new file
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
" let NERDTreeQuitOnOpen=1

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc

"===================="
" STOP, Vundle time~ "
"===================="

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle "gmarik/vundle"

" Utilities
Bundle "Raimondi/delimitMate"
Bundle "honza/vim-snippets"
Bundle "tpope/vim-fugitive"
Bundle "Lokaltog/vim-easymotion"
Bundle "scrooloose/nerdcommenter"
Bundle "bling/vim-airline"
    let g:airline#extensions#tabline#enabled = 1
    set laststatus=2
    set ttimeoutlen=50

" Racket
Bundle "wlangstroth/vim-racket"

" Haskell
Bundle "raichoo/haskell-vim"

" Python
Bundle "vim-scripts/indentpython.vim"
Bundle "klen/python-mode"
let python_highlight_all=1 " Enable all plugin"s highlighting.
let python_slow_sync=1 " For fast machines.
let python_print_as_function=1 " Color "print" function.
let g:syntastic_python_checkers=['pyflakes']

" Html
Bundle "mattn/emmet-vim"

" Universal Syntax Checker + Completion
Bundle "scrooloose/syntastic"

" Files manager
Bundle "L9"
Bundle "vim-scripts/mru.vim"
Bundle "fholgado/minibufexpl.vim"
Bundle "FuzzyFinder"
    " \f and \m lets you search for files
    map <leader>f :FufFileWithCurrentBufferDir<CR>
    map <leader>m :FufFileWithFullCwd<CR>

" Directories and tables
Bundle "jistr/vim-nerdtree-tabs"
Bundle "scrooloose/nerdtree"
    nnoremap <Leader>d :NERDTree<CR>
    " \d shows you the directory tree

"Nerd Tree Toggle
map <Leader>t :NERDTreeToggle<cr>

" Magical Gundo
Bundle "sjl/gundo.vim"
    nnoremap <Leader>u :GundoToggle<CR>
    " \u shows you the undo history

" LaTeX
Bundle "jcf/vim-latex"

" Markdown
Bundle "plasticboy/vim-markdown"

filetype plugin on
filetype indent on
