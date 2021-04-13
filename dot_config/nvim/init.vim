" ============================================================================
" Settings vars
" ============================================================================

" unnecessary for nvim, possibly still useful for vim
set nocompatible
let mapleader="\<Space>"
let g:vdotdir= expand($VDOTDIR)

if filereadable(expand("$VDOTDIR/plugins.vim"))
    call plug#begin("$VDOTDIR/vendor")
    execute 'source ' . g:vdotdir . '/plugins.vim'
    call plug#end()
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" ----------------------------------------------------------------------------
" Display
" ----------------------------------------------------------------------------

set novisualbell
set noerrorbells

set number
set numberwidth=5

" show context around current cursor position
set scrolloff=8
set sidescrolloff=16

set textwidth=80
set colorcolumn=+3
set colorcolumn=+120
set cursorline

set synmaxcol=512
set signcolumn=yes
" set showtabline=2
set laststatus=2
set updatetime=750

set noshowcmd
set noshowmode

if !$TERM_PROGRAM ==# "Apple_Terminal"
  set termguicolors
endif

" ----------------------------------------------------------------------------
" Input
" ----------------------------------------------------------------------------

" Enable mouse
set mouse=a

" Typing key combos
set notimeout
set ttimeout

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" ----------------------------------------------------------------------------
" Wild and file globbing stuff in command mode
" ----------------------------------------------------------------------------

" Binary
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.jar,*.pyc,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*.gem
set wildignore+=.sass-cache
set wildignore+=npm-debug.log
" Compiled
set wildignore+=*.marko.js
set wildignore+=*.min.*,*-min.*
" Temp/System
set wildignore+=*.*~,*~
set wildignore+=*.swp,.lock,.DS_Store,._*,tags.lock

" ----------------------------------------------------------------------------
" File saving
" ----------------------------------------------------------------------------

set fileformats=unix,dos

" No backup - that's what git is for. FZF has issues with swap conflicts, so
" disable swapfiles here.
set noswapfile
set nobackup
set nowritebackup

" don't create backups for these paths
set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set backupskip+=/private/tmp/*"

set undofile

set autoread                 " Auto-update a file that's been edited externally
set backspace=indent,eol,start
set history=10000
set hidden                   " Allow buffer switching without saving
set lazyredraw               " Don't update screen while running macros

" ----------------------------------------------------------------------------
" Built-in completion
" ----------------------------------------------------------------------------

" Don't consider = symbol as part filename.
set isfname-==

set complete-=t                       " don't complete tags
set completeopt-=longest              " ncm2 requirement
set completeopt-=preview              " don't open scratch (e.g. echodoc)
set completeopt+=noinsert             " ncm2 requirement
set completeopt+=noselect             " ncm2 don't select first thing
" set completeopt+=menu,menuone         " show PUM, even for one thing

set omnifunc=syntaxcomplete#Complete

" ----------------------------------------------------------------------------
" Message output on vim actions
" ----------------------------------------------------------------------------

set shortmess-=f
set shortmess+=a " ilmnrxoOtWI
set shortmess+=c " match x of y

" ----------------------------------------------------------------------------
" Window splitting and buffers
" ----------------------------------------------------------------------------

set splitbelow
set splitright

" ----------------------------------------------------------------------------
" Whitespace
" ----------------------------------------------------------------------------

set nowrap
" set nojoinspaces                      " J command doesn't add extra space

" ----------------------------------------------------------------------------
" Indenting - overridden by indent plugins
" ----------------------------------------------------------------------------

" For autoindent, use same spaces/tabs mix as previous line, even if
" tabs/spaces are mixed. Helps for docblock, where the block comments have a
" space after the indent to align asterisks
"
" The test case what happens when using o/O and >> and << on these:
"
"     /**
"      *
"
" Refer also to formatoptions+=o (copy comment indent to newline)
" set nocopyindent

" Try not to change the indent structure on "<<" and ">>" commands. I.e. keep
" block comments aligned with space if there is a space there.
" set nopreserveindent

" Smart detect when in braces and parens. Has annoying side effect that it
" won't indent lines beginning with '#'. Relying on syntax indentexpr instead.
" 'smartindent' in general is a piece of garbage, never turn it on.
" set nosmartindent

" Global setting. I don't edit C-style code all the time so don't default to
" C-style indenting.
" set nocindent

" Copy to system keyboard
set clipboard+=unnamedplus

set shortmess+=I

" ============================================================================
" Formatting
" ============================================================================

" help 'fo-table' for details
" Overridden by a bunch of filetypes
set formatoptions=
set formatoptions+=nr12
set formatoptions-=alo

" ==========================================================================
" Sessions
" ==========================================================================

let g:sessions_dir = "$VDOTDIR/sessions"

" ============================================================================
" Neovim-only mappings
" ============================================================================

nnoremap <special> <A-k>      <C-w>k
nnoremap <special> <A-j>      <C-w>j
nnoremap <special> <A-h>      <C-w>h
nnoremap <special> <A-l>      <C-w>l

" ==========================================================================
" Host providers
" ==========================================================================

function s:FindExecutable(paths) abort
  for l:path in a:paths
    let l:executable = glob(expand(l:path))
    if executable(l:executable) | return l:executable | endif
  endfor
  return ''
endfunction

let g:loaded_python_provider = 0
let s:pyenv_py3 = s:FindExecutable([
  \ '$PYENV_ROOT/versions/neovim3/bin/python',
  \ '/usr/bin/python3'
  \ ])
let g:python3_host_prog = s:pyenv_py3

" ==========================================================================
" Autocommands
" ==========================================================================

augroup nanwinresize
  autocmd!
  autocmd VimResized * wincmd =
augroup END

augroup nancomments
  autocmd!
  autocmd FileType * set formatoptions-=o
augroup END

augroup nanhugefile
  autocmd BufReadPre *
        \   if getfsize(expand("%")) > 10000000
        \|    syntax off
        \|    let b:nan_hugefile = 1
        \|  endif
  autocmd BufReadPre *.min.* syntax off
augroup END

" ============================================================================
" Theme
" ===========================================================================

silent! colorscheme onedark

" ============================================================================
" Security
" ============================================================================

let g:netrw_localrmdir='rm -r'

" Disallow unsafe local vimrc commands
" Leave down here since it trims local settings
set secure
