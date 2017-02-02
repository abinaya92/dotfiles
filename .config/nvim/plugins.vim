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
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/a.vim'
Plug 'djoshea/vim-autoread'
Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'wesQ3/vim-windowswap'
Plug 'wikitopian/hardmode'
Plug 'flazz/vim-colorschemes'
"Plug 'majutsushi/tagbar'
"Plug 'craigemery/vim-autotag'
"Plug 'idanarye/vim-vebugger'
"Plug 'Shougo/deoplete.nvim'
"Plug 'FredKSchott/CoVim'
call plug#end()
