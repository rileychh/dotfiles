if empty(glob('$XDG_DATA_HOME/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" look and feel
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

                                               " features
Plug 'neovim/nvim-lspconfig'                   " lint
Plug 'kabouzeid/nvim-lspinstall'               " language server installer
Plug 'nvim-lua/completion-nvim'                " completion
Plug 'tpope/vim-commentary'                    " comments
Plug 'tpope/vim-fugitive'                      " git
Plug 'sbdchd/neoformat'                        " formatter
Plug 'mhinz/vim-startify'                      " start screen
Plug 'tpope/vim-obsession'                     " session recording
Plug 'junegunn/fzf'                            " fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'                      " file explorer
Plug 'Xuyuanp/nerdtree-git-plugin'             " file explorer git plugin
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " file explorer filetype highlighting
Plug 'tpope/vim-surround'                      " surround objects
Plug 'junegunn/vim-easy-align'                 " align lines

" filetypes
Plug 'cespare/vim-toml' " toml
Plug 'dag/vim-fish' " fish
Plug 'mattn/emmet-vim' " html - emmet

call plug#end()
