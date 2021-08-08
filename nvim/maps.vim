let mapleader=" "

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
inoremap <silent>ii <Esc>

" faster move
nmap <Leader>s <Plug>(easymotion-s2)
" Problems with tmux plug, put: 
" let g:tmux_navigaro_no_mappings = 1

" Reemplazado por control + u(UP)
" Reemplazado por control + d(DOWN)
"nnoremap <c-j> 10<c-e>
"nnoremap <c-k> 10<c-y>

nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

" execute code
nmap <Leader>rj :!compile-java<CR>
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
map <Leader>nt :tree<CR>
map <Leader>nf :find<CR>
map <Leader>p :Files<CR>
map <Leader>ag :Ag<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" diagnostics
nmap <silent> gb :CocDiagnostics<CR>
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" buffers
map <Leader>ob :Buffers<cr>
"nmap db :bdelete<cr>
map <Leader>d :bdelete<CR>
"nmap <leader>
" tabs navigation
map <Leader>h :bprevious<cr>
map <Leader>l :bnext<cr>


" git
nnoremap <Leader>G :G<cr>
nnoremap <Leader>gp :Gpush<cr>
nnoremap <Leader>gl :Gpull<cr>

set splitbelow
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
    execute "sp term://zsh"
    execute "resize -7"

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
