if !nan#IsLoaded('fzf.vim') | finish | endif

nnoremap <silent><special> <A-f> :<C-U>FZFFiles<CR>
nnoremap <silent><special> <A-b> :<C-U>FZFBuffers<CR>
nnoremap <silent><special> <Bslash> :<C-U>FZFRg<CR>

" let g:fzf_preview_window = ['down:40%']
let g:fzf_layout = { 'down': '40%' }
" command! -bang -nargs=? -complete=dir Files
"     \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline']}, <bang>0)
