" pathogen
call pathogen#infect()
syntax on
filetype plugin indent on

" reload .vimrc every time it's written
au! BufWritePost $MYVIMRC source $MYVIMRC

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" save buffer when the window losses focus
au FocusLost * silent! wa

"SBL
"let g:pydiction_location = '/home/slobdell/.vim/bundle/pydiction/complete-dict'
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
" SBL
set t_Co=256

" expand tabs into tabstop spaces; use same for shifts
" 4 spaces == python standard, see: http://www.python.org/dev/peps/pep-0008/#indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4  " backspace deletes 4 spaces
set autoindent  " next line starts and same indentation

set wildmenu  " show completions in a menu
set visualbell  " no beeping
"set relativenumber  " easier to type commands w/ line counts
set number

" searching
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

set wrap  " wrap automatically, but don't break words
set linebreak
" set colorcolumn=81  " show a column barier

" don't let me use arrow keys; still training myself
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" colon is too often used to require a shift
nnoremap ; :

" save file automatiicaly when windows losses focus
au FocusLost * silent! wa

" I never use these, that's what source control is for
set nobackup
set nowritebackup
set noswapfile

" Solarized color schema
" SBL changed to wombat
" Move color schemes to /home/slobdell/.vim/bundle/extra-colors/colors/
if has('gui_running')
    set background=dark
    " set background=light
    colorscheme distinguished
else
    let g:solarized_termtrans=1
    set background=dark
    colorscheme distinguished
    " colorscheme lucius
    set cul
endif

if (&term == "xterm")
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" tags
" sudo apt-get install exuberant-ctags
" ctags -R -o ctags .
"set tags=ctags

" Automatically cd into the directory that the file is in
"set autochdir

" Enable mouse support in console
set mouse=a

" This is totally awesome - remap jj to escape in insert mode.  You'll never
" type jj anyway, so it's great!
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" show commands as you type them in the lower right
set showcmd
set laststatus=2  " always show the status line, even with a single file open

" fonts for gvim
if has("win32")
    set guifont=Consolas:h10
endif
if has("mac")
    " set guifont=Menlo\ Regular:h13
    set guifont=Source\ Code\ Pro:h13
endif

" GUI toolbar disable
if has("gui_running")
    set guioptions=egmrti
    if has("gui_gtk2")
    elseif
        set transparency=5
    endif
endif

" for ctrlp
set wildignore+=*.pyc
let g:ctrlp_regexp = 1

" syntax checking
let g:syntastic_python_checker = "pyflakes"

" map normal paste combo, use the system clipboard for regular yank
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
set clipboard=unnamedplus
if has("mac")
    set clipboard=unnamed
endif
if has("gui_gtk2")
    set clipboard=unnamedplus
endif
cmap <S-Insert>  <C-R>+  " paste into command line w/ shift-insert
xnoremap p pgvy  " paste doesn't blow away the register

" remember to run :RopeOpenProject in HearsayLabs

" map spell check toggle
nmap <silent> <leader>s :set spell!<CR>

" hide certain exts in NERDTree
let NERDTreeIgnore = ['\.pyc$']
"
" python-mode
let g:pymode_folding = 0

" needed to revert backspace change from OSX +python
set backspace=indent,eol,start

" same settings as Hearsay Social githooks
let g:pymode_lint_ignore = "E501,E121,E126,E128"

" opens search results in a window w/ links and highlight the matches
command! -nargs=+ Grep execute 'silent grep! -r -n --exclude *.json . -e <args>' | copen | execute 'silent /<args>'

" powerline: https://github.com/Lokaltog/powerline
"python from powerline.ext.vim import source_plugin; source_plugin()

set autoread

" vim-gitgutter correct background color on gutter
highlight clear SignColumn

" Spellcheck git commits
autocmd Filetype gitcommit setlocal spell textwidth=72

" SBL move text to new line
:map <F2> i<CR><ESC>
