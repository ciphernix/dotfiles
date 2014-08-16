syntax on
filetype indent plugin on
set modeline
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
set background=dark
let python_highlight_all=1
filetype indent on
set autoindent

"line numbers
set nu

"My shorcuts
nmap \l :setlocal number!<CR>
nmap \p :set paste!<CR>
nmap \c :nohlsearch<CR>
nmap \q :quit<CR>
nmap \s :w<CR>

"stand out 81st column
highlight ColorColumn ctermbg=magenta guibg=Magenta
call matchadd('ColorColumn', '\%81v', 100)
