command! PI PlugInstall
command! PU PlugUpdate | PlugUpgrade

" Similar but safer than Cond() from
" https://github.com/junegunn/vim-plug/wiki/tips
" This is a global function for command access
function! PlugIf(condition, ...) abort
  let l:enabled = a:condition ? {} : { 'on': [], 'for': [] }
  return a:0 ? extend(l:enabled, a:000[0]) : l:enabled
endfunction

" ==========================================================================
" Vim debugging
" ==========================================================================

" Show slow plugins
Plug 'tweekmonster/startuptime.vim', { 'on': [ 'StartupTime' ] }
Plug 'tpope/vim-unimpaired'