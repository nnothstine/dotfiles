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
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
let g:endwise_no_mappings = 1
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'pgdouyon/vim-evanesco'
Plug 'junegunn/vim-easy-align'

let g:coc_global_extensions = [
    \ 'coc-diagnostic',
    \ 'coc-eslint',
    \ 'coc-git',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-git',
    \ 'coc-pairs',
    \ 'coc-prettier',
    \ 'coc-pyright',
    \ 'coc-sh',
    \ 'coc-snippets',
    \ 'coc-solargraph',
    \ 'coc-vimlsp',
    \ 'coc-yaml',
    \]
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'tmsvg/pear-tree'
" conflicts with vim-endwise
Plug 'neoclide/coc-pairs'
Plug 'honza/vim-snippets'

Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-rooter'

" --------------------------------------------------------------------------
" Modeline
" --------------------------------------------------------------------------

Plug 'itchyny/lightline.vim'

" Doesn't seem to work in after/plugin...
let g:fzf_command_prefix = 'FZF'
let g:fzf_path = isdirectory("/AppleInternal") ? "/opt/brew/opt/fzf" : '/usr/local/opt/fzf'
Plug g:fzf_path
Plug 'junegunn/fzf.vim'

Plug 'sbdchd/neoformat', PlugIf(has('nvim'))
let g:neoformat_enabled_python = ['black']

Plug 'neomake/neomake', PlugIf(has('nvim'))

Plug 'nathanaelkane/vim-indent-guides'

let g:matchup_delim_noskips = 2
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_status_offscreen = 0
Plug 'andymass/vim-matchup', PlugIf(has('patch-7.4.1689'))

" --------------------------------------------------------------------------
" Signature preview
" --------------------------------------------------------------------------

Plug 'Shougo/echodoc.vim'

" Cursorline
Plug 'delphinus/vim-auto-cursorline'
" Plug 'jiangmiao/auto-pairs'
" Plug 'Krasjet/auto.pairs'

" --------------------------------------------------------------------------
" Language: CSS
" --------------------------------------------------------------------------

Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim', { 'for': [ 'scss' ] }

" --------------------------------------------------------------------------
" Language: Hoon
" --------------------------------------------------------------------------

Plug 'urbit/hoon.vim'

" --------------------------------------------------------------------------
" Language: JavaScript
" --------------------------------------------------------------------------

Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" --------------------------------------------------------------------------
" Language: Python
" --------------------------------------------------------------------------

Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'

" --------------------------------------------------------------------------
" Language: zsh
" --------------------------------------------------------------------------

Plug 'chrisbra/vim-sh-indent'
Plug 'chrisbra/vim-zsh'

" ==========================================================================
" Themes
" ==========================================================================

Plug 'joshdick/onedark.vim'

Plug 'blueyed/vim-qf_resize'

Plug 'romainl/vim-qf'
