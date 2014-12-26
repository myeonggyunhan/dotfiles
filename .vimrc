set nocp

"Bundle {{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'SuperTab'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
call vundle#end()

filetype plugin indent on
" }}}
"
filetype plugin on
filetype indent on

"Interface
syntax on
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
set ruler
set number
set exrc
set incsearch
set hlsearch
set wildignore=*.o,*.class,*.pyc

"Set backup off since we are always using git :D
set noswapfile
set nobackup
set nowb

"Correct broken redraw
set ttyfast
set noerrorbells
set novisualbell
set t_vb=
set lazyredraw

"Indentation
set foldmethod=marker
set shiftwidth=2
set expandtab
set tabstop=2
set bs=2

"Deal with html
autocmd FileType html setlocal sw=2 ts=2 et smartindent
autocmd FileType python,Makefile setlocal sw=2 ts=2 noexpandtab

"Autocomplete  {{{
set dictionary+=/usr/share/dict/words
set tags=~/.vim/tags/stl.tags
set tags+=tags

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1      
let OmniCpp_GlobalScopeSearch = 1      
let OmniCpp_ShowAccess = 1      
let OmniCpp_MayCompleteDot = 1      
let OmniCpp_MayCompleteArrow = 1      
let OmniCpp_MayCompleteScope = 1      
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]      

" automatically open and close the popup menu / preview window      
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif      
set completeopt=menuone,menu,longest,preview

"}}}
"Key-binding {{{
let mapleader = ","
let g:mapleader = ","

nmap <F2> :bprevious<Enter>
nmap <F3> :bnext<Enter>
nmap <F4> :enew<Enter>
nmap <F5> :make <Enter>
nmap <F6> :set tags+=tags <Enter>
nmap <F7> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . <Enter>
nmap <F9> :NERDTreeToggle<Enter>
nmap <F8> :TagbarToggle<Enter>
imap <C-Tab> :<Plug>snipMateNextOrTrigger<Enter>

nmap <leader>w :w!<cr>
nmap <leader>bd :bdelete<cr>
nmap <leader>ss :setlocal spell!<cr>

"Abbrevations 
ab W w
ab Wq wq
ab wQ wq
ab WQ wq
ab Q q
"}}}za
"vim-airline {{{
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline_theme='powerlineish'

"}}}
"IndentLine {{{
let g:indentLine_color_term = 124
let g:indentLine_char = "'"
let g:html_indent_inctags = "html,body,head,tbody"
let g:rehash256 = 1

"}}}
"NERDTree "{{{
" ---------------------------------------------------------------------         
let g:NERDChristmasTree = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeDirArrows = 0
" }}}
" Easy Motion "{{{
" ---------------------------------------------------------------------
"let g:EasyMotion_leader_key = '<Leader>'
"
"}}}
" Cursor "{{{
" ---------------------------------------------------------------------
set cursorline
match Error /{{{\|}}}/

"}}}
" Tagbar "{{{
" ---------------------------------------------------------------------
"let g:tagbar_compact = 1
"let g:tagbar_width = 30
"
"}}}
"SuperTab | utisnipts {{{
let g:SuperTabDefaultCompletionType = "context"
"}}}