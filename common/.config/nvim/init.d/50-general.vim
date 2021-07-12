set number relativenumber                                     " line numbers
set noshowmode                                                " no "--INSERT--"
set ignorecase smartcase                                      " case insensitive search
set hidden                                                    " allow unsaved hidden buffer
set list                                                      " show tabs and trailing spaces
set listchars=tab:→\ ,trail:·,extends:↷,precedes:↶            " Strings to use in list mode
set noshowcmd                                                 " Show the (partial) command as it’s being typed
set linebreak                                                 " do not break words.
set scrolloff=10 sidescrolloff=10                             " keep cursor 10 lines/columns away from screen edge
set nowrap                                                    " do not wrap lone lines
set nohlsearch                                                " do not highlight search results
set wildignorecase                                            " ingore case when compliting file names
set splitbelow splitright                                     " splits open at below and right
set title                                                     " show window title
autocmd FileType * setlocal formatoptions-=r formatoptions-=o " do not insert comments
set smartindent softtabstop=-1 shiftwidth=2 expandtab         " default indent: 2 spaces
