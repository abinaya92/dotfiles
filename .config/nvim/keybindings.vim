nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

command! E Explore
nnoremap <leader>f :E<cr>

nnoremap <leader>n :cnext<cr>
nnoremap <leader>p :cprevious<cr>
nnoremap <leader>j :cnfile<cr>
nnoremap <leader>k :cpfile<cr>

nnoremap <Leader>q :q<CR>

nnoremap <leader>tw :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>rt :retab<cr>

nnoremap <leader>pc yyPIstd::cout << "##### <ESC>A" << std::endl;<ESC>
nnoremap <leader>pqt yyPIqDebug("##### <ESC>A");<ESC>

nmap <CR> o<Esc>k

nmap <silent> <leader>/ :nohlsearch<cr>

nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>