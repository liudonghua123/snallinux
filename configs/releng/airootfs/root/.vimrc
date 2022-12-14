set nocompatible
set backspace=indent,start
set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set hls
set incsearch
set showmatch
set autowrite
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set expandtab
set tabstop=4
set shiftwidth=4
set viminfo=%,<800,'10,/50,:100,h,f0
syntax on
set background=dark
colorscheme desert
"colorscheme solarized
autocmd! bufread

filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" ctrl-/ clears search
noremap <silent> <c-_> :let @/ = ""<CR>

" make Home and End keys work
map OH <HOME>
map OF <END>
imap OH <HOME>
imap OF <END>

" this allows ctrl-j and ctrl-k to be used to switch between windows
" ctrl-h and ctrl-l maximize windows and make windows same size
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>_
map <C-L> <C-W>=

" turn on spell checking
set spell spelllang=en_us
set spellfile=$HOME/.vimspell.en.utf-8.add

" perl auto-folding
"let perl_fold = 1
