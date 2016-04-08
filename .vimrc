" Started here: http://nvie.com/posts/how-i-boosted-my-vim/

set nocompatible " This must be first, because it changes other options as side effect

" Automatically install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mbbill/undotree'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/a.vim'
Plug 'airblade/vim-gitgutter'
Plug 'djoshea/vim-autoread'
Plug 'tpope/vim-surround'
Plug 'justincampbell/vim-eighties'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug 'vim-scripts/vim-auto-save'
call plug#end()

let mapleader = "\<Space>"

nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

let g:airline#extensions#tabline#enabled = 1

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

set background=dark
colorscheme solarized

nnoremap <leader>o :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>r :CtrlPMRUFiles<cr>
nnoremap <leader>. :CtrlPTag<cr>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_max_files=80000
let g:ctrlp_custom_ignore = {
    \ 'dir': 'work/ecos2\|'
    \ . 'work/hst/targets\|'
    \ . 'work/epic\|'
    \ . 'mts\.\(\d\d\d\d\|module\)' ,
    \ 'file': '\.\(a\|so\|o\)$\|'
    \ . 'tar\.\(bz2\|gz\)$',
    \ }
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

nnoremap <silent> <leader>tb :TagbarToggle<cr>

let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)

let g:eighties_enabled = 1
let g:eighties_minimum_width = 80
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

let NERDTreeShowHidden=1
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
" Quit vim if NERDTree is the only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
nmap <leader>f :Ag<space>

" use * to search current word in normal mode
nmap * <Plug>AgActionWord
" use * to search selected text in visual mode
vmap * <Plug>AgActionVisual

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
"let g:auto_save_postsave_hook = 'TagsGenerate'  " this will run :TagsGenerate after each save

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
set mouse=a             " Enable mouse mode

set ttimeout
set ttimeoutlen=100

set encoding=utf-8
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

set shiftwidth=4        " Set tab width to 4 and force spaces
set tabstop=4
set softtabstop=4
set expandtab

set colorcolumn=80      " Highlight the 80th column
set nowrap              " By default no word wrapping
set nolinebreak         " Don't use linebreaks along with wrapping

set autoindent
set smartindent

set nobackup
set noswapfile

au FocusLost * :wa      " Save all files when you lose focus

nnoremap ; :

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
nnoremap <leader>c :checktime<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

nmap <silent> <leader>/ :nohlsearch<cr>

noremap <silent> <C-S>          :update<cr>
vnoremap <silent> <C-S>         <C-C>:update<cr>
inoremap <silent> <C-S>         <C-O>:update<cr>

map q: :q