let mapleader=" "

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
inoremap <silent>ii <Esc>

" faster move
nmap <Leader>s <Plug>(easymotion-s2)
" Problems with tmux plug, put: 
" let g:tmux_navigaro_no_mappings = 1
nnoremap <c-j> 10<c-e>
nnoremap <c-k> 10<c-y>

" execute code
nmap <Leader>rj :!javac  *.java ; java Launcher<CR>
nmap <Leader>rp :!python3 %<CR>
nmap <Leader>bp :!black %<CR>

" split resize
nnoremap <Leader>+ 10<C-w>>
nnoremap <Leader>- 10<C-w><

" quick semi
nnoremap <Leader>; $a;<Esc>

" shorter commands
cnoreabbrev tree NERDTreeToggle
cnoreabbrev find NERDTreeFind

" plugs
map <Leader>nt :NERDTreeToggle<CR>
map <Leader>p :Files<CR>
map <Leader>ag :Ag<CR>

" tmux navigator
nnoremap <silent> <Leader><C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <Leader><C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <Leader><C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <Leader><C-l> :TmuxNavigateRight<cr>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
 
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" diagnostics
nmap <silent> gb :CocDiagnostics<CR>

" tabs navigation
map <Leader>h :tabprevious<cr>
map <Leader>l :tabnext<cr>

" buffers
map <Leader>ob :Buffers<cr>

" git
nnoremap <Leader>G :G<cr>
nnoremap <Leader>gp :Gpush<cr>
nnoremap <Leader>gl :Gpull<cr>

set splitright
function! OpenTerminal()
  " move to right most buffer
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else
    " open terminal
    execute "vsp term://zsh"

    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>
