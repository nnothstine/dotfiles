function! s:AutoMkdir() abort
    let l:directory = expand("<afile>:p:h")
    if !isdirectory(l:directory)
        call mkdir(l:directory, 'p')
    endif
endfunction

augroup nanautomkdir
    autocmd!
    autocmd BufWritePre,FileWritePre * call s:AutoMkdir()
augroup END