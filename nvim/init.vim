set encoding=utf-8
set mouse=a  
set clipboard=unnamedplus

" Tabs
set sw=4 " tabs in # spaces
set expandtab
set smartindent " indent like the last line

" Cursorline and a column
set cursorline
set colorcolumn=120
highlight ColoColumn ctermbg=0 guibg=lightgrey

" Nubers
set number
set relativenumber
set numberwidth=1

set showcmd " Show commands
set ruler " Current cursor position 
"set showmatch

so $HOME/.config/nvim/plugins.vim
so $HOME/.config/nvim/plugin-config.vim
so $HOME/.config/nvim/maps.vim

" Themes
syntax on
set termguicolors
colorscheme onedark
let g:airline_theme='onedark'

"" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
