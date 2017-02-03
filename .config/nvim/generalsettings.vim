" Highlight cursorline only in active window
aug CursorLine
    autocmd!
    autocmd VimEnter * setl cursorline
    autocmd WinEnter * setl cursorline
    autocmd BufWinEnter * setl cursorline
    autocmd WinLeave * setl nocursorline
aug END

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
filetype plugin on " Detect filetypes
set history=99          " Allow 99 entries in the history

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
