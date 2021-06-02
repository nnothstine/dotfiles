if !nan#IsLoaded('neomake') | finish | endif

let g:neomake_echo_current_error = 0 " neovim virtualtext is enough
let g:neomake_highlight_columns = 0
let g:neomake_open_list = 2
let g:neomake_open_list_resize_existing = 0 " using vim-qf_resize
let g:neomake_serialize = 0 " aggregate errors
let g:neomake_error_sign    = { 'text': '⚑', 'texthl': 'NeomakeErrorSign' }
let g:neomake_warning_sign  = { 'text': '⚑', 'texthl': 'NeomakeWarningSign' }
let g:neomake_message_sign  = { 'text': '⚑', 'texthl': 'NeomakeMessageSign' }
let g:neomake_info_sign     = { 'text': '⚑', 'texthl': 'NeomakeInfoSign' }

function! nan#OnBattery()
  if has('macunix')
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  elseif has('unix')
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  endif
  return 0
endfunction

if nan#OnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif
