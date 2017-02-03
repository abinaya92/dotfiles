nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

command! E Explore
nnoremap <leader>f :E<cr>

nnoremap <leader>n :bnext<cr>
nnoremap <leader>p :bprevious<cr>

nnoremap <leader>wj :cnext<cr>
nnoremap <leader>wk :cprevious<cr>
nnoremap <leader>ej :cnfile<cr>
nnoremap <leader>ek :cpfile<cr>

nnoremap <Leader>q :Bdelete<CR>

nnoremap <leader>tw :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>rt :retab<cr>

nnoremap <leader>d yyPIstd::cout << "##### <ESC>A" << std::endl;<ESC>
nnoremap <leader>qd yyPIqDebug("##### <ESC>A");<ESC>

nmap <CR> o<Esc>k

nmap <silent> <leader>/ :nohlsearch<cr>