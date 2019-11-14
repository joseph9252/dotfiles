color delek 
syntax on
set background=dark
set number
set noswapfile
set tabstop=4
set shiftwidth=4
set expandtab
set paste
set clipboard=unnamed
map <Tab> i<Tab><ESC>
map <CR> o<ESC>
map <S-CR> O<ESC>
:vmap <Tab> i<Tab><ESC>
filetype plugin on
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set pastetoggle=<F10>
let @c = 'oconsole.log("");hhi'
let @f = 'oexport const temp = () => {};O'
