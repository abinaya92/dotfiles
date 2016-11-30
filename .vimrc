" Started here: http://nvie.com/posts/how-i-boosted-my-vim/

set nocompatible " This must be first, because it changes other options as side effect

" Automatically install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'moll/vim-bbye'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/a.vim'
Plug 'djoshea/vim-autoread'
Plug 'tpope/vim-surround'
Plug 'justincampbell/vim-eighties'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug 'vim-scripts/vim-auto-save'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/neocomplete.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'
Plug 'craigemery/vim-autotag'
Plug 'FredKSchott/CoVim'
Plug 'henrik/vim-qargs'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'wesQ3/vim-windowswap'
Plug 'idanarye/vim-vebugger'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/indentpython.vim'
Plug 'wikitopian/hardmode'
call plug#end()

let mapleader = "\<Space>"

nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

let g:airline#extensions#tabline#enabled = 1
:let g:airline_theme='distinguished'

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

set background=dark
colorscheme hybrid

nnoremap <leader>o :GFiles<cr>
nnoremap <leader>a :FZF<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>r :FilesMru --tiebreak=end<cr>

nnoremap <silent> <leader>tb :TagbarToggle<cr>

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

map <leader>i <Plug>(easymotion-overwin-f2)
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

let NERDTreeShowHidden=1
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
" Quit vim if NERDTree is the only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
nmap <leader>f :Ag<space>

" use * to search current word in normal mode
nmap # <Plug>AgActionWord
" use * to search selected text in visual mode
vmap # <Plug>AgActionVisual

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
set mouse+=a             " Enable mouse mode
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

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

" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim...
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    "if filereadable("cscope.out")
    "    cs add cscope.out
    " else add the database pointed to by environment variable
    "elseif $CSCOPE_DB != ""
    "    cs add $CSCOPE_DB
    "endif

    " show msg when any other cscope db added
    set cscopeverbose


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif