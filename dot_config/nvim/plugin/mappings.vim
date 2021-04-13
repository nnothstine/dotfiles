" plugin/mappings.vim

" https://vi.stackexchange.com/questions/9751/understanding-ctrl-u-combination
nnoremap <silent><special> <Leader>evr
      \ :<C-U>execute 'edit ' . g:vdotdir . '/init.vim'<CR>

nnoremap <silent><special> <Leader>evp
      \ :<C-U>execute 'edit ' . g:vdotdir . '/plugins.vim'<CR>

nnoremap <silent><special> <Leader>em 
      \ :<C-U>execute 'edit ' . g:vdotdir . '/plugin/mappings.vim'<CR>

" cd to current buffer path
nnoremap <Leader>.. :<C-U>cd! %:h<CR>

nnoremap <silent> <Leader>v :<C-U>vsplit<CR>
nnoremap <silent> <Leader>h :<C-U>split<CR>

" new tab
nnoremap <silent> <Leader>t :<C-U>tabnew<CR>

" cd to current buffer
nnoremap <silent> <Leader>cd :<C-U>cd %:p:h<CR>

nnoremap zz :bd<CR>

" ==========================================================================
" Buffer manipulation
" ==========================================================================

" Prev buffer with <BS> backspace in normal (C-^ is kinda awkward)
nnoremap  <special>   <BS>  <C-^

nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" ----------------------------------------------------------------------------
" Tabs
" ----------------------------------------------------------------------------

nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" --------------------------------------------------------------------------
" Quitting
" --------------------------------------------------------------------------

nnoremap <Leader>w :<C-U>w!<CR>
nnoremap <Leader>wq :<C-U>wq!<CR>
nnoremap <Leader>q :<C-U>q!<CR>

" --------------------------------------------------------------------------
" Directories
" --------------------------------------------------------------------------

nnoremap <silent> <Leader>t :<C-U>tabnew<CR>

" ==========================================================================
" PUM
" ==========================================================================

" function! s:SmartTab() abort
"   " If characters all the way back to start of line were all whitespace,
"   " insert whatever expandtab setting is set to do.
"   if strpart(getline('.'), 0, col('.') - 1) =~? '^\s*$'
"     return "\<Tab>"
"   endif

"   " The PUM is closed and characters before the cursor are not all whitespace
"   " so we need to insert alignment spaces (always spaces)
"   " Calc how many spaces, support for negative &sts values
"   let l:sts = (&softtabstop <= 0) ? shiftwidth() : &softtabstop
"   let l:sp = (virtcol('.') % l:sts)
"   if l:sp == 0 | let l:sp = l:sts | endif
"   return repeat(' ', 1 + l:sts - l:sp)
" endfunction

" silent! iunmap <Tab>
" inoremap  <silent><special><expr>  <Tab>     <SID>SmartTab()
