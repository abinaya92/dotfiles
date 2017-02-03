" Started here: http://nvie.com/posts/how-i-boosted-my-vim/

set nocompatible " This must be first, because it changes other options as side effect

source $HOME/.config/nvim/plugins.vim

let mapleader = "\<Space>"

nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>ov :so $MYVIMRC<cr>

source $HOME/.config/nvim/tmuxnavigator.vim
source $HOME/.config/nvim/initfzf.vim
source $HOME/.config/nvim/style.vim
nnoremap <silent> <leader>tb :TagbarToggle<cr>

source $HOME/.config/nvim/gitgutter.vim

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

map <leader>s <Plug>(easymotion-overwin-f2)
map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)

let g:eighties_enabled = 1
let g:eighties_minimum_width = 100
let g:eighties_extra_width = 0 " Increase this if you want some extra room
let g:eighties_compute = 1 " Disable this if you just want the minimum + extra
let g:eighties_bufname_additional_patterns = ['fugitiveblame'] " Defaults to [], 'fugitiveblame' is only an example. Takes a comma delimited list of bufnames as strings.:

map <leader><Tab>  :A<cr>
" a.vim has some really dumb mappings that we need to remove, but we need
" to wait until vim has loaded to unmap them
autocmd VimEnter * :iunmap <Space>ihn
autocmd VimEnter * :iunmap <Space>is
autocmd VimEnter * :iunmap <Space>ih

autocmd VimEnter * :nunmap <Space>ihn
autocmd VimEnter * :nunmap <Space>is
autocmd VimEnter * :nunmap <Space>ih

command! E Explore

" Highlight cursorline only in active window
aug CursorLine
    autocmd!
    autocmd VimEnter * setl cursorline
    autocmd WinEnter * setl cursorline
    autocmd BufWinEnter * setl cursorline
    autocmd WinLeave * setl nocursorline
aug END

let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
nnoremap <leader>u :UndotreeToggle<cr>:UndotreeFocus <cr>

let g:ack_default_options = " -i -H --nocolor --nogroup --column"

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
"let g:auto_save_postsave_hook = 'TagsGenerate'  " this will run :TagsGenerate after each save

" These are the basic settings to get the font to work (required):
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
let g:airline_powerline_fonts=1

set hidden              " Hide buffers instead of closing
set autoread
set nowrap              " don't wrap lines
set binary noeol        " Allow binary editing
set backspace=indent,eol,start " Allow backspace in all situations
set visualbell          " Use the visual bell instead of beep
set noerrorbells        " Don't beep
set lazyredraw          " Speed up
set ttyfast             " Make screen changes smoother
set ff=unix             " Use unix filetype first then dos
filetype plugin indent on " Detect filetypes
set history=99          " Allow 99 entries in the history
set mouse=             " Enable mouse mode
"if &term =~ '^screen'
    "" tmux knows the extended mouse mode
    "set ttymouse=xterm2
"endif

set ttimeout
set ttimeoutlen=100

set t_Co=256
syntax on               " Enable syntax highlighting
set showcmd             " Display incomplete commands
set ruler               " Show cursor position
set cursorline          " Highlight line
set number              " Show line numbers
set sm                  " Show matching braces
set laststatus=2        " Display status bar
set notitle             " Don't display the title bar
set showtabline=2       " Always show the tab line
set scrolloff=3         " 3 lines below and above of cursor
set sidescrolloff=3     " 3 lines left and right of cursor
set list                " Enable Show characters
set listchars=tab:▸-,trail:⊡ " Show trailing spaces/tabs

set splitright
set splitbelow

set magic
set hlsearch            " Highlight words on search
set showmatch           " Show matching brackets/paranthesis
set incsearch           " Incremental searching
set ignorecase smartcase " Ignore Case for search unless upper case


set tabstop=4 shiftwidth=4 expandtab "use tabs correctly

set colorcolumn=80      " Highlight the 80th column
set nowrap              " By default no word wrapping
set nolinebreak         " Don't use linebreaks along with wrapping

set autoindent
set smartindent

set nobackup
set noswapfile

set wildmenu

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

nnoremap <leader>n :bnext<cr>
nnoremap <leader>p :bprevious<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>wa :wa<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <Leader>q :Bdelete<CR>
nnoremap <leader>tw :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>rt :retab<cr>
nnoremap <leader>d yyPIstd::cout << "##### <ESC>A" << std::endl;<ESC>
nnoremap <leader>qd yyPIqDebug("##### <ESC>A");<ESC>
nnoremap <leader>wj :cnext<cr>
nnoremap <leader>wk :cprevious<cr>
nnoremap <leader>ej :cnfile<cr>
nnoremap <leader>ek :cpfile<cr>
nmap <CR> o<Esc>k

nmap <silent> <leader>/ :nohlsearch<cr>

source $HOME/.config/nvim/cscope.vim
