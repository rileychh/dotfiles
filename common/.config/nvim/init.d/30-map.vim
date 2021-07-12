let mapleader=' '

" Use mouse
set mouse=a
noremap <ScrollWheelUp>     <C-Y>
noremap <S-ScrollWheelUp>   <C-U>
noremap <ScrollWheelDown>   <C-E>
noremap <S-ScrollWheelDown> <C-D>

" Window controls
nnoremap <Leader>w <C-w>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Buffer contols
nnoremap <Tab>      <Cmd>bnext<CR>
nnoremap <S-Tab>    <Cmd>bprevious<CR>
nnoremap <Leader>bb <Cmd>files<CR>:buffer<Space>
nnoremap <Leader>bd <Cmd>bdelete<CR>

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

" Toggle terminal
nnoremap <Leader>t <Cmd>suspend<CR>
