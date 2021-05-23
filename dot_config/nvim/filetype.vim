function! s:SetByShebang() abort
  let l:shebang = getline(1)
  if l:shebang =~# '^#!.*/.*\s\+node\>' | setfiletype javascript | endif
  if l:shebang =~# '^#!.*/.*\s\+zsh\>' | setfiletype zsh | endif
  if l:shebang =~# '^#!.*/.*\s\+python\>' | setfiletype python | endif
endfunction

augroup filetypedetect
  autocmd! BufNewFile,BufRead * call s:SetByShebang() 
  autocmd! BufNewFile,BufRead *.plist setfiletype xml
  autocmd! BufNewFile,BufRead *.zsh.tmpl setfiletype zsh
augroup END

" autocmd! FileType * set formatoptions-=o
