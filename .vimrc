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

" setup for pathogen
call pathogen#infect()
filetype plugin indent on

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

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" pyflake
autocmd BufWritePost *.py call Flake8()
let g:flake8_show_quickfix=1
let g:flake8_show_in_gutter=0
let g:flake8_show_in_file=0

" ctags
map <leader>r ctags -R .<cr>
