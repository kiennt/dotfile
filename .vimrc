set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'comments.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
call vundle#end()            " required
filetype plugin indent on    " required

set nocompatible    " use vim defaults
set ls=2            " allways show status line
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces when shift
set expandtab       " dont use tab, use space
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file
set number          " show line numbers
set ignorecase      " ignore case when searching
set title           " show title in console title bar
set ttyfast         " smoother changes
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set cindent         " cindent
syntax on           " syntax highlighing
let mapleader=","   " leader key
set gfn=Monaco:h14  " set gui font
set pastetoggle=<F2> " paste mode
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files


nnoremap j gj
nnoremap k gk

" maping new key to traversal in windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" add filter for NERDTree
let NERDTreeIgnore=['\.so$', '\.pyc$', '^a.out$', '\.d$', '\.o$', '\.sir$', '\.si$', '\.fla$', '\.flas$', '\.fls$']
let NERDTreeWinSize=30

" add file type
filetype on
au BufNewFile,BufRead *.cc set filetype=c
au BufNewFile,BufRead *.re set filetype=c
au BufNewFile,BufRead *.roy set filetype=js
au BufNewFile,BufRead *.erb set filetype=html
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.hbs set filetype=html
au BufNewFile,BufRead *.handlebars set filetype=html
au BufNewFile,BufRead Gemfile set filetype=ruby
au BufNewFile,BufRead Rakefile set filetype=ruby
au BufNewFile,BufRead Guardfile set filetype=ruby
au BufNewFile,BufRead *.task set filetype=ruby
au BufNewFile,BufRead *.ru set filetype=ruby
au BufNewFile,BufRead *.god set filetype=ruby
au BufNewFile,BufRead *.css set filetype=css
au BufNewFile,BufRead *.scss set filetype=scss
au BufNewFile,BufRead *.sass set filetype=scss

" turn on all plugin
filetype plugin on

" mix tab for file type
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType go setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType scss setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType coffee setlocal expandtab shiftwidth=2 softtabstop=2

" remove whitespace at end of line when save file
autocmd BufWritePre * :%s/\s\+$//e

" no swap
set noswapfile

" setup tab
nnoremap <leader>] gt
nnoremap <leader>[ gT

" set autocomplete
autocmd FileType ruby set omnifunc=rubycomplete#Complete

" set up folding
set nofoldenable    "dont fold by default

" highlight overtext
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/
