" Settings
" Indent and folding stuff
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

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

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

map ; :
noremap ;; ;
"
" Use "magic" regexps (ie, fewer backslashes) (trial)
nnoremap / /\v
vnoremap / /\v

nnoremap <tab> %
vnoremap <tab> %

" Colours
syntax enable
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

" Mappings
au BufRead,BufNewFile *.sdl,*.jdl set filetype=fcdl
au BufRead,BufNewFile *.ma set filetype=mel
" Get rid of toolbar and menu in gvim
set guioptions-=T
set guioptions-=m
set gfn=Monospace\ 9

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

map <F1> :set relativenumber!<CR>
" Comment out a single line / range
map <F2> \c 
" Search for any line longer than 80 characters
map <F3> /.{81,}<CR>
" Open the "tag list" (function definition list, etc) and 
" the project tree (eclim)
map <F4> :TlistToggle<CR>:ProjectTree<CR>

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
map <F10> :set paste!<Bar>set paste?<CR>
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

" Yank/paste to the OS clipboard with ,y and ,p
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P<

" Easy ways to handle my config files
nmap ,.s :source $MYVIMRC<CR>
nmap ,.v :sp $MYVIMRC<CR>
nmap ,.c :sp $HOME/.cshrc<CR>

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


nmap ,gg :!git gui<CR>

" Rename all instances of current word in file
nmap ,rf :%s/\<<c-r>=expand("<cword>")<cr>\>//g

" TwitVim
let twitvim_enable_python = 1

" Tag list
let Tlist_Exit_OnlyWindow = 1

let g:SuperTabDefaultCompletionType = "context"

" Not sure how many of these are needed...
filetype plugin indent on
filetype on
filetype plugin on
