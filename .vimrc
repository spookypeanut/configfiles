execute pathogen#infect()

" Settings
" Indent and folding stuff
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab

set backspace=eol,start

set foldmethod=indent
set nofoldenable
set nojoinspaces

set showcmd  "Show the current partial command on the right of the command line
set incsearch "Turn on incremental search (ie search as you type)
nohlsearch "Do this so we don't have highlighting from previous searches come up when we start vim
set hlsearch "Turn search term highlighting on by default
set report=0 "Always tell me how many lines have changed when search / replacing
set splitbelow "Make new split below the current one
set background=dark "Want dark background please

set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc "When autocompleting filenames, don't match these
set wildmode=longest:full "Please complete like <tab> in
set wildmenu              "a shell does, kthxbai

set ignorecase
set smartcase
set scrolloff=2

set laststatus=2
set history=500
"
" Set swp file dir. The two slashes at the end mean that it puts the whole
" path into the filename, letting you have /tmp/blah.txt and ~/blah.txt open
" simultaneously
set directory=~/.vim/tmp//    
set backupdir=~/.vim/tmp    " Set backup dir.

" Source the .vimrc immediately after you save it.
autocmd! bufwritepost .vimrc source %

map ; :
noremap ;; ;
"repeat the last command and put the cursor at start of change
map . .`[

" In normal and visual modes, use tab to jump between brackets
nnoremap <tab> %
vnoremap <tab> %

" L and H go up and down the file in chunks
nnoremap L 30k
vnoremap L 30k
nnoremap H 30j
vnoremap H 30j

" Colours
syntax on
set t_Co=256
colo peaksea

" Show whitespace
set list
"set listchars=tab:â–¸-,eol:â†µ
set listchars=tab:>-,eol:$
hi SpecialKey cterm=NONE ctermfg=1 guifg=DarkRed
hi NonText cterm=NONE ctermfg=1 guifg=DarkRed
" From http://vimcasts.org/episodes/show-invisibles/
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Jump to the last known position in the file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
hi CursorLine cterm=NONE ctermbg=235 guibg=Gray
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

set ruler
if exists('+colorcolumn')
    " 7.3 only
    set colorcolumn=73,74,75,76,77,78,79
    hi ColorColumn ctermbg=235 guibg=Gray
else
    " You can turn this off with :call matchdelete(w:m2)
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Mappings
au BufRead,BufNewFile *.sdl,*.jdl set filetype=fcdl
au BufRead,BufNewFile *.def set filetype=jobscheme
au BufRead,BufNewFile *.ma set filetype=mel
au BufRead,BufNewFile *.json set filetype=json
" Get rid of toolbar and menu in gvim
set guioptions-=T
set guioptions-=m
set gfn=Monospace\ 9


" Persistant undo between sessions (7.3 only)
set undofile
set undodir=/tmp/undos

" Select the text you just pasted
nnoremap <leader>v V`]

" Map function keys

" If we have relativenumber (7.3 only), turn it on
map <F1> :if exists("+relativenumber") <Bar> :set relativenumber! <Bar> else <Bar> :set number! <Bar> endif <CR>
" In fact, turn relativenumber on always
if exists("+relativenumber")
    set relativenumber
endif
" Comment out a single line / range
map <F2> \c 
" Search for any line longer than 80 characters
map <F3> /.{81,}<CR>
" Open the "tag list" (function definition list, etc) and 
" the project tree (eclim)
map <F4> :TagbarToggle<CR>:ProjectTree<CR>
" Commented out: let's not have it since the close doesn't work
"autocmd VimEnter * nested TagbarOpen
" But some things don't want it
"au FileType man TagbarClose

" Toggle highlighting of search terms
map <F5> :set hls!<bar>set hls?<CR>
" Toggle syntax
map <F6> :if exists("syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif <CR>
" Toggle folding
map <F7> zi
" Replace whitespace at end of lines (note: no <CR>, so doesn't actually do it)
map <F8> :%s/[[:space:]][[:space:]]*$//g

" Explore the filesystem
map <F9> :Sexplore<CR>
" Toggle paste
set pastetoggle=<F10>
" Toggle line numbers
"map <F11> :se nu!<CR>
map <F11> :Ant install<CR>
" Maximize current split
map <F12> <C-w><C-_>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqq

" Easier way to jump between splits
map <C-j> <C-w>j
map <C-k> <C-w>k
noremap <C-l> <C-w>l
map <C-h> <C-w>h

" Screen steals C-a. We could do C-a a, but C-s is easier in the muscle memory
map <C-s> <C-a>

" Easier way to jump between errors
map \e :cn<CR>
map \E :cp<CR>

" Easier way to increase / decrease the size of splits
map + 20<C-W>+
map - 20<C-W>-
map <C-+> <C-W>+
map <C--> <C-W>-

map zw zCzO
" Get the file under the cursor in a split
map gf :sp <cfile><CR>
" Change to the directory the current file is in
map ,cd :exe 'cd ' . expand ("%:p:h")<CR>
" This should soooo be what Y does (like D, innit?)
map Y y$

set clipboard=unnamedplus

" Easy ways to handle my config files
nmap ,.s :source $MYVIMRC<CR>
nmap ,.v :sp $MYVIMRC<CR>
nmap ,.c :sp $HOME/.cshrc<CR>
nmap ,.b :sp $HOME/.bashrc<CR>

" Replaces all instances of the work under the cursor with something else
nmap ,r :%s/\<<C-r>=expand("<cword>")<CR>\>//g<Left><Left>

" If you can figure out what this one does, I'll buy you lunch
nmap ,fpm :s/, *[a-z]*/ + ", " + /eg<CR>:s/([a-z]*/(" +/<CR>:s/)[^()]*$/ + ")\\n");/<CR>:s/^\([[:space:]]*\)/\1print("/<CR>:s/" +  + "//g<CR>:s/+ \[\] \(\$[a-zA-Z0-9_]*\)/+ stringArrayToString(\1, ",")/g<CR>

" Toggle word
nmap ,t :ToggleWord<CR>

nmap ]e :cnext<CR>
nmap [e :cprevious<CR>
nmap ]w :lnext<CR>
nmap [w :lprevious<CR>


" Pypar creates a pair of python :param lines
command -nargs=1 Pypar :normal o:param <args>: <CR>:type <args>: <CR><C-[>kkA
" Pyret creates return lines
command Pyret :normal o:return: <CR>:rtype: <CR><C-[>kkA
    

" From http://stackoverflow.com/questions/4027222/vim-use-shorter-textwidth-in-comments-and-docstrings
function! GetPythonTextWidth()
    if !exists('g:python_normal_text_width')
        let normal_text_width = 79
    else
        let normal_text_width = g:python_normal_text_width
    endif

    if !exists('g:python_comment_text_width')
        let comment_text_width = 72
    else
        let comment_text_width = g:python_comment_text_width
    endif

    let cur_syntax = synIDattr(synIDtrans(synID(line("."), col("."), 0)), "name")
    if cur_syntax == "Comment"
        return comment_text_width
    elseif cur_syntax == "String"
        " Check to see if we're in a docstring
        let lnum = line(".")
        while lnum >= 1 && (synIDattr(synIDtrans(synID(lnum, col([lnum, "$"]) - 1, 0)), "name") == "String" || match(getline(lnum), '\v^\s*$') > -1)
            if match(getline(lnum), "\\('''\\|\"\"\"\\)") > -1
                " Assume that any longstring is a docstring
                return comment_text_width
            endif
            let lnum -= 1
        endwhile
    endif

    return normal_text_width
endfunction

autocmd CursorMoved,CursorMovedI * :if &ft == 'python' | :exe 'setlocal textwidth='.GetPythonTextWidth() | :endif

fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

nmap ,gg :!git gui<CR>

" Tag list
let Tlist_Exit_OnlyWindow = 1
let Tlist_WinWidth = 50

let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
let g:pyflakes_use_quickfix = 0
let g:pymode_rope = 0
let g:pymode_python = 'python3'

" Not sure how many of these are needed...
filetype plugin indent on
filetype on
filetype plugin on
