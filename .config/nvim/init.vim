syntax on

let mapleader = " "

set number relativenumber

" Set list to show special characters
set lcs=space:·,trail:×,tab:❘⠀
set tabstop=4
set shiftwidth=4

set smartcase
set incsearch

map <Leader>o o<Esc>k
map <Leader>O O<Esc>j
map <Leader>0 $
map <Leader><Space> i<Space><Esc>
map <c-j> <c-f>
map <c-k> <c-b>

" To work with native clipboard
map <Leader>y "*y
map <Leader>p "*p

map <expr> <Leader><Tab> &list == 0 ? ':set list<CR>' : ':set list!<CR>'
map <Leader>/ :set hlsearch!<CR>
map <Leader>n :set number! relativenumber!<CR>

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz "it may not work if langmap was not added during vim installation (:version)
nmap о j
nmap л k
nmap р h
nmap д l
nmap ш i
nmap ф a
nmap в d
"set keymap=russian-jcukenmac
"set iminsert=0
"set imsearch=0
