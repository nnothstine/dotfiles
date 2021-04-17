if !nan#IsLoaded('fzf.vim') | finish | endif

nnoremap <silent><special> <A-f> :<C-U>FZFFiles<CR>
nnoremap <silent><special> <A-b> :<C-U>FZFBuffers<CR>
" MRU
nnoremap <silent><special> <A-p> :<C-U>FZFHistory<CR>
nnoremap <silent><special> <Bslash> :<C-U>FZFRg<CR>

let g:fzf_layout = { 'down': '40%' }

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline']}, <bang>0)

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_history_dir = '~/.local/share/fzf-history'
