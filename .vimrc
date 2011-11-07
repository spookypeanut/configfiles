" Settings
" Indent and folding stuff
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

set backspace=indent,eol,start

set foldmethod=indent
set nofoldenable

set showcmd  "Show the current partial command on the right of the command line
set incsearch "Turn on incremental search (ie search as you type)
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

set directory=~/.vim/tmp    " Set swp file dir.
set backupdir=~/.vim/tmp    " Set backup dir.

map ; :
noremap ;; ;
"repeat the last command and put the cursor at start of change
map . .`[
"
" Use "magic" regexps (ie, fewer backslashes) (trial)
nnoremap / /\v
vnoremap / /\v

nnoremap <tab> %
vnoremap <tab> %

" Colours
syntax on
set t_Co=256
colo peaksea

" Show whitespace
set list
set listchars=tab:▸-,eol:↵
hi SpecialKey cterm=NONE ctermfg=1 guifg=DarkRed
hi NonText cterm=NONE ctermfg=1 guifg=DarkRed
" From http://vimcasts.org/episodes/show-invisibles/
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

hi CursorLine cterm=NONE ctermbg=235 guibg=DarkGrey
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

set ruler
if exists('+colorcolumn')
    " 7.3 only
    set colorcolumn=+1
    hi ColorColumn ctermbg=235 guibg=DarkGrey
else
    " You can turn this off with :call matchdelete(w:m2)
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Mappings
au BufRead,BufNewFile *.sdl,*.jdl set filetype=fcdl
au BufRead,BufNewFile *.ma set filetype=mel
" Get rid of toolbar and menu in gvim
set guioptions-=T
set guioptions-=m
set gfn=Monospace\ 9


" Persistant undo between sessions (7.3 only)
set undofile
set undodir=/tmp/undos

" Auto-close brackets
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap []     []
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" Select the text you just pasted
nnoremap <leader>v V`]

" Map function keys

" If we have relativenumber (7.3 only), turn it on
map <F1> :if exists("+relativenumber") <Bar> :set relativenumber! <Bar> else <Bar> :set number! <Bar> endif <CR>
" Comment out a single line / range
map <F2> \c 
" Search for any line longer than 80 characters
map <F3> /.{81,}<CR>
" Open the "tag list" (function definition list, etc) and 
" the project tree (eclim)
map <F4> :TagbarToggle<CR>:ProjectTree<CR>
" But lets have it open by default
autocmd VimEnter * nested TagbarOpen

" Toggle highlighting of search terms
map <F5> :set hls!<bar>set hls?<CR>:PyflakesUpdate<CR>
" Toggle syntax
map <F6> :if exists("syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif <CR>
" Toggle folding
map <F7> zi
" Replace whitespace at end of lines (note: no <CR>, so doesn't actually do it)
map <F8> :%s/[[:space:]][[:space:]]*$//g

" Explore the filesystem
map <F9> :Sexplore<CR>
" Toggle paste
map <F10> :set paste!<Bar>set paste?<CR>
imap <F10> <Esc>:set paste!<Bar>set paste?<CR>a
" Toggle line numbers
"map <F11> :se nu!<CR>
map <F11> :Ant install<CR>
" Maximize current split
map <F12> <C-w><C-_>

" Easier way to jump between splits
map <C-j> <C-w>j
map <C-k> <C-w>k
noremap <C-l> <C-w>l
map <C-h> <C-w>h

" Screen steals C-a. We could do C-a a, but C-s is easier in the muscle memory
imap <C-s> <C-a>

" Easier way to jump between errors
map \e :cn<CR>
map \E :cp<CR>

" Easier way to increase / decrease the size of splits
map + 5<C-W>+
map - 5<C-W>-
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

" If you can figure out what this one does, I'll buy you lunch
nmap ,fpm :s/, *[a-z]*/ + ", " + /eg<CR>:s/([a-z]*/(" +/<CR>:s/)[^()]*$/ + ")\\n");/<CR>:s/^\([[:space:]]*\)/\1print("/<CR>:s/" +  + "//g<CR>:s/+ \[\] \(\$[a-zA-Z0-9_]*\)/+ stringArrayToString(\1, ",")/g<CR>

" Toggle word
nmap ,t :ToggleWord<CR>

" VCS Command
nmap ,va :VCSAdd<CR>
nmap ,vd :VCSDiff<CR>
nmap ,vc :VCSCommit<CR>
nmap ,vu :VCSUpdate<CR>
nmap ,vp :exe 'cd ' . expand ("%:p:h")<CR>:!fSandboxPub %<CR>
let VCSCommandGitDiffOpt="--no-ext-diff"

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

nmap ,gg :!git gui<CR>

noremap ,gp :call Svndiff("prev")<CR> 
noremap ,gn :call Svndiff("next")<CR> 
noremap ,gc :call Svndiff("clear")<CR> 

hi DiffAdd      ctermfg=0 ctermbg=2 guibg='green' 
hi DiffDelete   ctermfg=0 ctermbg=1 guibg='red' 
hi DiffChange   ctermfg=0 ctermbg=3 guibg='yellow' 

" TwitVim
let twitvim_enable_python = 1

" Tag list
let Tlist_Exit_OnlyWindow = 1
let Tlist_WinWidth = 50

let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
let g:pyflakes_use_quickfix = 0

" Not sure how many of these are needed...
filetype plugin indent on
filetype on
filetype plugin on
