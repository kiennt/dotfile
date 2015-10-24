filetype off                        " required
set nocompatible                    " use vim defaults
set ls=2                            " allways show status line
set tabstop=4                       " numbers of spaces of tab character
set shiftwidth=4                    " numbers of spaces when shift
set expandtab                       " dont use tab, use space
set scrolloff=3                     " keep 3 lines when scrolling
set showcmd                         " display incomplete commands

" searching option
set hlsearch                        " highlight searches
set incsearch                       " do incremental searching
set ignorecase                      " ignore case when searching
map <leader><space> :nohlsearch<CR>


set ruler                           " show the cursor position all the time
set novisualbell                    " turn off visual bell
set nobackup                        " do not keep a backup file
set number                          " show line numbers
set rnu
set title                           " show title in console title bar
set ttyfast                         " smoother changes
set modeline                        " last lines in document sets vim mode
set modelines=3                     " number lines checked for modelines
set shortmess=atI                   " abbreviate messages
set nostartofline                   " don't jump to first character when paging
set cindent                         " cindent
let mapleader=","                   " leader key
set gfn=Monaco:h14                  " set gui font
set pastetoggle=<F2>                " paste mode
set whichwrap=b,s,h,l,<,>,[,]       " move freely between files
set ttymouse=xterm2                 " set mouse type to xterm.
set noswapfile                      " set no swap file
syntax enable                       " enable syntax
set nofoldenable                    " dont fold by default
set backspace=indent,eol,start      " enable backspace


" split config
set splitbelow
set splitright


" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>


" mapping copy and paste to clipboard
set clipboard=unnamed
vmap <C-y> y:call system("pbcopy", getreg("\""))<CR>


" mapping copy
" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon
" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon
noremap <silent><C-s>  :update<CR>
vnoremap <silent><C-s> <C-c>:update<CR><C-c>
inoremap <silent><C-s> <C-o>:update<CR><C-c>


" add file type
filetype on
filetype plugin on
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


" mix tab for file type
autocmd FileType html setlocal shiftwidth=2 tabstop=2
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


" highlight overtext
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/


" highlight current line
set cursorline
highlight CursorLine term=bold cterm=none ctermbg=0 guibg=#efefef
highlight CursorLineNr term=bold ctermfg=4 guifg=Yellow


" buffer
set hidden
nmap bn :bnext<CR>
nmap bp :bprevious<CR>
nmap bd :bd<CR>
nmap bw :bw<CR>


" bell
set visualbell


" plugin installs
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'fatih/vim-go'
Plugin 'sjl/gundo.vim'
Plugin 'rking/ag.vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'moll/vim-node'
Plugin 'Yggdroot/indentLine'
Plugin 'chriskempson/base16-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'janko-m/vim-test'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'gabrielelana/vim-markdown'
Plugin 'edkolev/tmuxline.vim'
Plugin 'flazz/vim-colorschemes'
call vundle#end()            " required
filetype plugin indent on    " required


" vundle
nmap <leader>bi :BundleInstall<CR>


" jedi
let g:jedi#auto_vim_configuration = 1
let g:jedi#completions_enabled = 1
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = 0
let g:jedi#smart_auto_mappings = 0
autocmd FileType python setlocal completeopt-=preview


" Add the virtualenv's site-packages to vim path
if has('python')
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
endif


" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_force_overwrite_statusline = 0
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$', '\.pyc$', '\.coverage', '\.png$', '\.jpeg$', '\.jpg$']
call vimfiler#custom#profile('default', 'context', {
    \ 'safe' : 0,
    \ 'auto_expand' : 1,
    \ 'parent' : 0
    \ })

function! s:vimfiler_settings()
  nunmap <buffer> <C-l>
  nunmap <buffer> <C-j>
  nnoremap <buffer> <C-r> <Plug>(vimfiler_redraw_screen)
  nnoremap <silent><buffer><expr> v
    \ vimfiler#do_switch_action('vsplit')
  nnoremap <silent><buffer><expr> s
    \ vimfiler#do_switch_action('split')
endfunction
map <c-n> :VimFilerExplorer -find<CR>
autocmd FileType vimfiler call s:vimfiler_settings()


" ctrlp
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'


" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" ag.vim
nnoremap <leader>a :Ag


" eslint
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_loc_list_height=5


" indentLine
let g:indentLine_enabled = 1
let g:indentLine_char = '┆'


" base16-vim
let base16colorspace=256  " Access colors present in 256 colorspace


" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "vimux"
let test#python#runner = 'djangotest'
let test#python#djangotest#file_pattern = '_test.py'
let test#python#djangotest#executable = $VIRTUAL_ENV.'/bin/python '.$VIRTUAL_ENV.'/../src/manage.py test'
let test#javascript#mocha#executable =  'node_modules/.bin/mocha test/bootstrap.js'
let test#javascript#mocha#file_pattern = 'test.js'


" vimux
let g:VimuxOrientation = "h"
let g:VimuxHeight = "50"
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
map <Leader>vz :call VimuxZoomRunner()<CR>


" vim-fugitive
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gp :Ggrep<CR>
nnoremap <leader>gm :Gmove<CR>
nnoremap <leader>gb :Git branch<CR>
nnoremap <leader>go :Git checkout


" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_detect_paste = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 10
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
let g:airline#extensions#tmuxline#enabled = 1


" vim-colorschemes
set background=dark
colo solarized
