set nocompatible
set backspace=indent,start
set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set hls
set incsearch
set showmatch
set autowrite
set wrap
set expandtab
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set tabstop=4
set shiftwidth=4
set viminfo=%,<800,'10,/50,:100,h,f0
syntax on
set background=dark
set termguicolors
colorscheme gruvbox
autocmd! bufread

filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" make Home and End keys work
map OH <HOME>
map OF <END>
imap OH <HOME>
imap OF <END>

" turn on spell checking
set spell spelllang=en_us
set spellfile=$HOME/.vimspell.en.utf-8.add

