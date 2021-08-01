" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


call plug#begin('$HOME/.config/vimplugs')

" Language
Plug 'scrooloose/nerdcommenter'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" HTML
"Plug 'alvan/vim-closetag'
"Plug 'mattn/emmet-vim'
Plug 'reconquest/vim-pythonx'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Code Display
Plug 'lilydjwg/colorizer'
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
" Integrations
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'benmills/vimux'  
"Plug 'editorconfig/editorconfig-vim'
"Plug 'joonty/vdebug'
" git
"Plug 'tpope/vim-fugitive'
" test
"Plug 'julienr/vim-cellmode'

" Interface
Plug 'joshdick/onedark.vim' 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-buffer-ops'
"Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'godlygeek/tabular'
"Plug 'yggdroot/indentline'
Plug 'nathanaelkane/vim-indent-guides'

" Commands
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

call plug#end()
