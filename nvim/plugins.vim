" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


call plug#begin('~/.config/nvim/plugged')

" Language
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'

" Code Display
Plug 'lilydjwg/colorizer'

" Integrations
Plug 'scrooloose/nerdtree'
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'benmills/vimux' " tmux

" Interface
Plug 'joshdick/onedark.vim' 
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf.vim'

" Commands
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

" git

call plug#end()