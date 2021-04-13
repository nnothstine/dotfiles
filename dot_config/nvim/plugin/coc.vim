augroup nancoc
  autocmd!
augroup END

if !nan#IsLoaded('coc.nvim') | finish | endif

" let g:coc_global_extensions = [ 'coc-snippets', 'coc-pairs' ]
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.

" --------------------------------------------------------------------------
" Utils
" --------------------------------------------------------------------------

let s:vim_help = ['vim', 'help']
function! s:ShowDocumentation()
  if (index(s:vim_help, &filetype) >= 0)
    execute 'h ' . expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" --------------------------------------------------------------------------
" Mappings
" -------------------------------------------------------------------------

nnoremap <silent> K :<C-U>call <SID>ShowDocumentation()<CR>

" coc-snippets
imap <C-f> <Plug>(coc-snippets-expand-jump)

" Code navigation
nmap <silent> gh <Plug>(coc-declaration)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <Leader>t <Plug>(coc-type-definition)

" conflicts with vim-endwise
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <Plug>CustomCocCR "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
imap <silent> <CR> <Plug>CustomCocCR<Plug>DiscretionaryEnd
