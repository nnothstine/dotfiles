if !nan#IsLoaded('vim-commentary') | finish | endif

nnoremap <silent> <C-\> :Commentary<CR>
vnoremap <silent> <C-\> :Commentary<CR>
