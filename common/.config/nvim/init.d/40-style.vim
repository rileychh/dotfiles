colorscheme gruvbox

let g:airline_powerline_fonts = 1
let g:airline_mode_map = {
  \ '__'     : '-',
  \ 'c'      : 'C',
  \ 'i'      : 'I',
  \ 'ic'     : 'I',
  \ 'ix'     : 'I',
  \ 'n'      : 'N',
  \ 'multi'  : 'M',
  \ 'ni'     : 'N',
  \ 'no'     : 'N',
  \ 'R'      : 'R',
  \ 'Rv'     : 'R',
  \ 's'      : 'S',
  \ 'S'      : 'S',
  \ ''     : 'S',
  \ 't'      : 'T',
  \ 'v'      : 'V',
  \ 'V'      : 'V',
  \ ''     : 'V',
\ }

"Ɇ
let g:airline_symbols = {
  \ 'space': ' ',
  \ 'paste': 'PASTE',
  \ 'maxlinenr': '',
  \ 'dirty': '⚡',
  \ 'crypt': '🔒',
  \ 'linenr': '',
  \ 'readonly': '',
  \ 'spell': 'SPELL',
  \ 'modified': '+',
  \ 'notexists': '✭',
  \ 'keymap': 'Keymap:',
  \ 'ellipsis': '...',
  \ 'branch': '',
  \ 'whitespace': '⚠ ␣'
\ }

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let airline#extensions#nvimlsp#error_symbol = '✗ '
let airline#extensions#nvimlsp#warning_symbol = '⚠ '
let g:airline#extensions#tabline#show_tab_type = 0 " enable/disable displaying tab type (e.g. [buffers]/[tabs])
let g:airline#extensions#tabline#buffer_min_count = 1 " hide tabline when only 1 buffer is open
