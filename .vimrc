" Settings
set tabstop=4
set shiftwidth=4
set autoindent
set showcmd
set smartindent
set incsearch
set report=0
set updatetime=500
set foldmethod=indent
set nofoldenable
set splitbelow
set background=dark

set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc
set wildmode=longest:full
set wildmenu

set ignorecase
set smartcase
set scrolloff=2

set laststatus=2
set history=500

" Colours
syntax enable
set t_Co=256
colo peaksea

" Show whitespace
set list
set listchars=tab:>-,eol:$
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

"match ErrorMsg '\%>80v.\+'
autocmd FileType * set noexpandtab
autocmd FileType python set expandtab

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

" Map function keys
map <F2> ,ci
map <F3> :registers<CR>
map <F4> :TlistToggle<CR>

map <F5> :set hls!<bar>set hls?<CR>
map <F6> :if exists("syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif <CR>
map <F7> zi
map <F8> :s/^[[:space:]]*//g

" Explore the filesystem
map <F9> :Sexplore<CR>
" Toggle paste
map <F10> :set paste!<Bar>set paste?<CR>
" Toggle line numbers
map <F11> :se nu!<CR>
" Maximize current split
map <F12> <C-w><C-_>

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

map + 5<C-W>+
map - 5<C-W>-
map <C-+> <C-W>+
map <C--> <C-W>-

map zw zCzO
map gf :sp <cfile><CR>
map ,cd :exe 'cd ' . expand ("%:p:h")<CR>
map Y y$

nmap ,.s :source $MYVIMRC<CR>
nmap ,.v :sp $MYVIMRC<CR>
nmap ,.c :sp $HOME/.cshrc<CR>
nmap ,fpm :s/, *[a-z]*/ + ", " + /eg<CR>:s/([a-z]*/(" +/<CR>:s/)[^()]*$/ + ")\\n");/<CR>:s/^\([[:space:]]*\)/\1print("/<CR>:s/" +  + "//g<CR>:s/+ \[\] \(\$[a-zA-Z0-9_]*\)/+ stringArrayToString(\1, ",")/g<CR>

" Toggle word
nmap ,t :ToggleWord<CR>

" VCS Command
nmap ,va :VCSAdd<CR>
nmap ,vd :VCSDiff<CR>
nmap ,vc :VCSUpdate<CR>:VCSCommit<CR>
nmap ,vu :VCSUpdate<CR>
nmap ,vp :exe 'cd ' . expand ("%:p:h")<CR>:!fSandboxPub %<CR>
let VCSCommandGitDiffOpt="--no-ext-diff"

" TwitVim
source ~/private/privatetwit.vim
let twitvim_enable_python = 1

" Tag list
let Tlist_Exit_OnlyWindow = 1

