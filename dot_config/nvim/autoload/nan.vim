if exists('g:loaded_nan') | finish | endif
let g:loaded_nan = 1

let g:nan#vim_dir = fnamemodify(expand($MYVIMRC), ":p:h")
let g:nan#plug_dir = '/vendor/'

let s:loaded = []

function! nan#Exists(name) abort
  return index(get(g:, 'plugs_order', []), a:name) > -1
endfunction

function! nan#PlugDir(name) abort
  let l:dir = nan#Exists(a:name) ? g:plugs[a:name].dir : ''
  let l:dir = substitute(l:dir, '/$', '', '')
  return l:dir
endfunction

function! nan#IsLoaded(name) abort
  " if index(s:loaded, a:name) != -1
  "   return 1
  " endif
  if match(&rtp, a:name) != -1
    return 1
  endif
endfunction

