" install vim-plug if missing:
let pluginstall=system("[ -e ~/.config/nvim/autoload/plug.vim ] ; echo $?")
if pluginstall != 0
    call system("curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
    so ~/.config/nvim/autoload/plug.vim
endif

call plug#begin()

" Visuals
Plug 'fneu/breezy'                    " sexy theme
Plug 'ryanoasis/vim-devicons'         " icons
Plug 'itchyny/lightline.vim'          " light beautiful status line

" Tools
Plug 'christoomey/vim-tmux-navigator' " seamless tmux/vim nav
Plug 'moll/vim-bbye'                  " delete buffer
Plug 'junegunn/fzf',                  " fuzzy file search
    \ { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'               " fzf integration for vim
Plug 'tpope/vim-fugitive'             " git integration
Plug 'airblade/vim-gitgutter'         " git gutter integration
Plug 'tpope/vim-commentary'           " comment stuff out with gcc / gc<motion>
Plug 'mbbill/undotree'                " undo tree
Plug 'justinmk/vim-sneak'             " precision movement with s<char><char>
Plug 'vim-scripts/a.vim'              " header/implementation switch
Plug 'junegunn/vim-easy-align'        " horizontal alignment of lines
Plug 'thirtythreeforty/lessspace.vim' " remove new trailing whitespace
Plug 'metakirby5/codi.vim'            " REPL integration with :Codi <filetype>
Plug 'djoshea/vim-autoread'           " external file changes trigger auto read
Plug 'vim-scripts/vim-auto-save'      " auto save documents on changes
Plug 'tpope/vim-surround'             " tweak surround things

" Languages
Plug 'hynek/vim-python-pep8-indent'   " PEP8 conform indenting
Plug 'lervag/vimtex'                  " LaTeX tools
Plug 'sheerun/vim-polyglot'           " Syntax and stuff for several languages

" Completion
Plug 'ervandew/supertab'              " Use Tab for completion
Plug 'Shougo/deoplete.nvim',          " Async completion framework
    \ { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'            " Python completions for deoplete

" Snippets
Plug 'SirVer/ultisnips'               " Snippet engine
Plug 'honza/vim-snippets'             " Default snippets

" Linting
Plug 'w0rp/ale'                       " run async linters while editing

" Tags
" Plug 'ludovicchabant/vim-gutentags'   " automatic tag management

" ToDo
Plug 'mileszs/ack.vim'                " doesn't work not sure why?
"Plug 'idanarye/vim-vebugger'
"Plug 'FredKSchott/CoVim'

call plug#end()