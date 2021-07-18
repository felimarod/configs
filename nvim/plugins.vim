" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


call plug#begin('~/.config/vimplugs')

" Language
"Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'

" Code Display
Plug 'lilydjwg/colorizer'

" Integrations
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'benmills/vimux' " tmux
" git
Plug 'tpope/vim-fugitive'

" Interface
Plug 'joshdick/onedark.vim' 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" Commands
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

call plug#end()
