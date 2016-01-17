" VIM Configuration File
" Author: hanshenu
"
" load plugins that ship with Vim {{{
set nocompatible
filetype on

"let vundle manage vbundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

source ~/.vim/bundles.vim

filetype plugin indent on
filetype plugin on

" Disable swapfile and backup {{{
set nobackup
set noswapfile
"}}}

"remap leader key{{{
let mapleader=','
"}}}

"some common configs {{{
"map visual mode vertical selectoin"
nmap <leader>v <c-v>
set fenc=utf-8
set termencoding=utf-8
set fileencodings=utf-8,chinese
set encoding=utf-8  "if not set, the powerline plugins won't work 
if has("win32") || has("win64")
    set fileencoding=chinese
endif
set autoindent
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set softtabstop=4
set expandtab
set textwidth=300
set t_Co=256
set number
set hidden
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set autoread
set title
set matchpairs+=<:>
set ruler
set backspace=indent,eol,start
map Y y$
set laststatus=2
set pastetoggle=<F2>
set nolist
syntax on
"}}}


"search" {{{
set incsearch
set hls
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap <silent> <C-c> :%s///gn<cr>
vnoremap < <gv
vnoremap > >gv
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
"}}}

"better command line editing {{{
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"}}}


" config ctags file locations {{{
set tags+=./tags
set tags+=~/.vim/tags/cpp
" let g:ProjTags = [ "~/workspace" ]
let g:ProjTags = [["~/workspace/cocos2d-html5", "~/.vim/tags/cocos2d-html5/cocos2d/tags", "~/.vim/tags/cocos2d-html5/chipmunk/tags","~/.vim/tags/cocos2d-html5/box2d/tags","~/.vim/tags/cocos2d-html5/CocosDenshion/tags","~/.vim/tags/cocos2d-html5/extensions/tags"]]
let g:ProjTags += [["~/workspace/cocos2d-x","~/.vim/tags/cocos2d-x/cocos2dx/tags","~/.vim/tags/cocos2d-x/chipmunk/tags","~/.vim/tags/cocos2d-x/Box2d/tags","~/.vim/tags/cocos2d-x/CocosDenshion/tags","~/.vim/tags/cocos2d-x/extensions/tags"]]
let g:ProjTags += [[ "~/workspace/opencv","~/.vim/tags/opencv/tags" ]]
"}}}


"plugins key maps" {{{
"--commentary plugin,comment a line
map <leader>/ \\\
"open a tag list ivew
nmap <silent> <leader>ta :TagbarToggle <CR>
"disable default buffergator keymaps"
let g:buffergator_suppress_keymaps = 1

"config for BufferNavigator"
nmap <leader>bf :BufExplorer<cr>
"}}}

"nerdTree plugin config {{{
autocmd vimenter * NERDTree
nmap <silent> <leader>n :NERDTreeToggle <CR>
let NERDTreeShowHidden=1
let NERDTreeWinSize=40


"better tag navigation from www.vimbits.com {{{
nnoremap <Return> <C-]>
nnoremap <leader>b <C-o>
"}}}


"map leader 1 for display cursorline {{{
:nnoremap <Leader>1 :set cursorline! cursorcolumn!<CR>
"}}}


"map windows command {{{
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap ,c <c-w>c
nmap ,<tab> <c-w><c-w>
nnoremap j gj
nnoremap k gk
" nmap <leader>d <c-D>
" nmap <leader>u <c-U>
"}}}

"config syntastic {{{
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
"}}}


"set colorscheme {{{
syntax enable
colorscheme mustang
if has("gui_running")
    colorscheme solarized
endif
"}}}

"config tagbar plugin {{{
let Tlist_Use_Right_Window = 1
"}}}


"solarized colorschema config{{{
let g:solarized_diffmode="low"
"}}}

" Ctlr-P {{{
nmap <leader>p :CtrlP <cr>
let g:ctrlp_jump_to_buffer    = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height        = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*.o
"}}}


"Configuration for tabular plugin {{{
nmap <Leader>= :Tabularize /=<CR>
vmap <Leader>= :Tabularize /=<CR>
nmap <Leader>: :Tabularize /:<CR>
vmap <Leader>: :Tabularize /:<CR>
"}}}

"english spell check {{{
nmap <silent> <leader>s :set spell!<CR>
" Set region to British English
set spelllang=en_gb
"}}}


"command line editing key maps {{{
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
" Prompt to open file with same name, different extension
map <leader>er :e <C-R>=expand("%:r")."."<CR>
"}}}

" add cpp11 syntax support {{{
let g:syntastic_cpp_compiler_options = ' -std=c++11'
"run cpp11 code"
if !has("win32")
nmap <leader>rr :<C-U>!clang++ -std=c++11 -stdlib=libc++ -nostdinc++ -I/usr/local/src/llvm/tools/libcxx/include -L/usr/local/src/llvm/tools/libcxx/lib -o %:r % && ./%:r <cr>
endif
"}}}

" Folding rules {{{
set foldenable                  " enable folding
set foldcolumn=2                " add a fold column
set foldmethod=marker           " detect triple-{ style fold markers
set foldlevelstart=99           " start out with everything folded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold
function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . '...' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()

"c/c++/javascript/java fold method
autocmd filetype c,cpp,javascript,java set foldmarker={,}

nnoremap zO zCzO
nnoremap <Space> za
vnoremap <Space> za
nnoremap ,z zMzv
"}}}

"configure for UltiSnips plugin {{{ 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"}}}

"auto reload vimrc configuration {{{
au BufWritePost .vimrc so ~/.vimrc
nmap <leader>vv :tabedit $MYVIMRC<CR>
"}}}


"config clang_complete library {{{
" g:clang_user_options set at vimprj section
au FileType cpp,objcpp set syntax=cpp11
au BufNewFile,BufRead *
\ if expand('%:e') =~ '^\(h\|hh\|hxx\|hpp\|ii\|ixx\|ipp\|inl\|txx\|tpp\|tpl\|cc\|cxx\|cpp\)$' |
\   if &ft != 'cpp'                                                                           |
\     set ft=cpp                                                                              |
\   endif                                                                                     |
\ endif   

let g:clang_use_library=1
let g:clang_library_path="/usr/lib/"
let g:clang_complete_copen=1
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
" Avoids lame path cache generation and other unknown sources for includes 
" let g:clang_auto_user_options=''
let g:clang_memory_percent=70
let g:clang_debug=1

set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'

" Complete options (disable preview scratch window, longest removed to aways
" show menu)
set completeopt=menu,menuone

" Limit popup menu height
set pumheight=20

" SuperTab completion fall-back 
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
"}}}

"keymaps for c/c++ development{{{
" Reparse the current translation unit in background
" command! Parse  call g:ClangBackgroundParse()  
" Reparse the current translation unit and check for errors
command! ClangCheck call g:ClangUpdateQuickFix()  

" Set the most common used run command
if has('win32') || has('win64') || has('os2')
    let g:common_run_command='$(FILE_TITLE)$'
else
    let g:common_run_command='./$(FILE_TITLE)$'
endif
 
noremap  <silent> <F7> :Parse<cr>
noremap  <silent> <F8> :ClangCheck<cr>
noremap  <silent> <F9> :SCCompile<cr>
noremap  <silent> <F10> :SCCompileRun<cr>
noremap! <silent> <F7> <c-o>:Parse<cr>
noremap! <silent> <F8> <c-o>:ClangCheck<cr>
noremap! <silent> <F9> <c-o>:SCCompile<cr>
noremap! <silent> <F10> <c-o>:SCCompileRun<cr>
"}}}

 
" Initialize vimprj plugin
call vimprj#init()

"delimitMate mappings{{{
let delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType cpp let b:delimitMate_matchpairs = "(:),[:],{:}"
"}}}

"some keymapings for tidying your whitespace{{{
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>
"}}}

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"velocity
au BufNewFile,BufRead *.vm,*.html,*.htm,*.shtml,*.stm set ft=velocity

xnoremap p pgvy
