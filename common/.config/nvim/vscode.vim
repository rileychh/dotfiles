call plug#begin()
Plug 'tpope/vim-surround'                      " surround objects
call plug#end()

xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

let mapleader=' '

" Window controls
nnoremap <Leader>w <C-w>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Buffer contols
nnoremap <Tab>      <Cmd>tabnext<CR>
nnoremap <S-Tab>    <Cmd>tabprevious<CR>

" Files
nnoremap <Leader>fw <Cmd>wa<CR>
nnoremap <Leader>fW <Cmd>w !sudo tee %<CR>
nnoremap <Leader>fo <Cmd>FZF<CR>
cnoremap w!! w !sudo tee > /dev/null %

" Select blocks after indenting
xnoremap < <gv
xnoremap > >gv|

" Easier indenting in visual mode
nnoremap > >>_
nnoremap < <<_

" Access system clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>Y "+Y
noremap <Leader>P "+P

" Open configuration files
nnoremap <Leader>kc <Cmd>edit $XDG_CONFIG_HOME/nvim/vscode.vim<CR>

set ignorecase smartcase                                      " case insensitive search
set hidden                                                    " allow unsaved hidden buffer
set noshowcmd                                                 " Show the (partial) command as it’s being typed
set linebreak                                                 " do not break words.
set nohlsearch                                                " do not highlight search results
set wildignorecase                                            " ingore case when compliting file names
set splitbelow splitright                                     " splits open at below and right
autocmd FileType * setlocal formatoptions-=r formatoptions-=o " do not insert comments
