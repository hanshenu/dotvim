
set nocompatible

" VIM-PLUG BLOCK
" {{{

call plug#begin('~/.vim/plugged')

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'sheerun/vim-polyglot'
Plug 'fisadev/fisa-vim-colorscheme'

" Editing
Plug 'SirVer/ultisnips'
Plug 'lilydjwg/fcitx.vim'

" Navigation
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" View
Plug 'Yggdroot/indentLine'

" Linting
Plug 'w0rp/ale'

"Plug 'Valloric/YouCompleteMe'

function! BuildYCM(info)
if a:info.status == 'installed' || a:info.force
  !./install.py --clang-completer
endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()

" }}}

" BASIC SETTINGS
" {{{
 
let mapleader = ','

set encoding=utf-8

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Store lots of :cmdline history
set history=500

" Show line numbers
set nu

set nowrap

" Autoindent when starting new line
set autoindent
set smartindent
set lazyredraw

" Ignore case when searching
set ignorecase 

" Don't ignore case when search has capital letter
set smartcase

" Enable highlighted case-insensitive incremential search
set incsearch

" Enble search highlighting
set hlsearch

" Always show window statuses
set laststatus=2

" Show the size of block one selected in visual mode
set showcmd

" Hide buffers
set hidden
set visualbell

" Indent using four spaces
set expandtab smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set gcr=a:block-blinkon0

" Show the line and column number of the cursor position
set ruler

" Highlight line under cursor
set cursorline
set cursorcolumn

" }}}

" MAPPINGS
" {{{

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------

set background=dark
colorschem fisa 

" PLUGINS
" {{{

" ----------------------------------------------------------------------------
" ultisnips
" ----------------------------------------------------------------------------

let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
  
let g:indentLine_char = '│'

" ----------------------------------------------------------------------------
" tarbar
" ----------------------------------------------------------------------------

inoremap <F2> <esc>:TagbarToggle<cr>
nnoremap <F2> :TagbarToggle<cr>

let tagbar_left=1
let tagbar_width=32
let g:tagbar_sort = 0
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
 \ 'ctagstype' : 'c++',
 \ 'kinds'     : [
     \ 'c:classes:0:1',
     \ 'd:macros:0:1',
     \ 'e:enumerators:0:0', 
     \ 'f:functions:0:1',
     \ 'g:enumeration:0:1',
     \ 'l:local:0:1',
     \ 'm:members:0:1',
     \ 'n:namespaces:0:1',
     \ 'p:functions_prototypes:0:1',
     \ 's:structs:0:1',
     \ 't:typedefs:0:1',
     \ 'u:unions:0:1',
     \ 'v:global:0:1',
     \ 'x:external:0:1'
 \ ],
 \ 'sro'        : '::',
 \ 'kind2scope' : {
     \ 'g' : 'enum',
     \ 'n' : 'namespace',
     \ 'c' : 'class',
     \ 's' : 'struct',
     \ 'u' : 'union'
 \ },
 \ 'scope2kind' : {
     \ 'enum'      : 'g',
     \ 'namespace' : 'n',
     \ 'class'     : 'c',
     \ 'struct'    : 's',
     \ 'union'     : 'u'
 \ }
\ }

" ----------------------------------------------------------------------------
" nerdtree
" ----------------------------------------------------------------------------

inoremap <F3> <esc>:NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeToggle<CR>

let NERDTreeWinSize=22
let NERDTreeWinPos="right"
let NERDTreeShowHidden=0
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

" ----------------------------------------------------------------------------
" ale
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" ctrlsf.vim
" ----------------------------------------------------------------------------

nnoremap <c-f> :CtrlSF<CR>

" ----------------------------------------------------------------------------
" ctrlp.vim
" ----------------------------------------------------------------------------

" Disable output, vcs, archive, rails, temp and backup files
set wildignore+=*.o,*.out,*.obj,.git,*.pyc,*.class
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_map = '<s-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|vendor/bundle/*\|vendor/cache/*\|public\|spec)$',
  \ 'file': '\v\.(exe|so|dll|swp|log|jpg|png|json)$',
  \ }

" ----------------------------------------------------------------------------
" YouCompleteMe
" ----------------------------------------------------------------------------

set completeopt-=preview

nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
inoremap <leader>; <C-x><C-o>

let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=0
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1

" }}}
