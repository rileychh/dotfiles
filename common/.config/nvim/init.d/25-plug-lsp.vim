lua require('lsp')

autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
" vim.lsp.buf.code_action()
" vim.lsp.buf.completion()
nnoremap <silent> gD    <Cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd    <Cmd>lua vim.lsp.buf.definition()<CR>
autocmd CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
nnoremap <silent> g0    <Cmd>lua vim.lsp.buf.document_symbol()<CR>
" vim.lsp.buf.execute_command()
" vim.lsp.buf.formatting()
nnoremap <silent> K     <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <Cmd>lua vim.lsp.buf.implementation()<CR>
" vim.lsp.buf.incoming_calls()
" vim.lsp.buf.outgoing_calls()
nnoremap <silent> gr    <Cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <Cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gs    <Cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gt    <Cmd>lua vim.lsp.buf.type_definition()<CR>

" Format on save
" autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync()
augroup fmt
  autocmd!
  autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

" Use completion-nvim in every buffer
autocmd BufEnter * lua require('completion').on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Matching strategy
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
