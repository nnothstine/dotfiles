if !nan#IsLoaded('neoformat') | finish | endif

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

