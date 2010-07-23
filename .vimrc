set tabstop=4
set shiftwidth=4
set autoindent
set showcmd
set smartindent
set incsearch
set report=0
set updatetime=500
syntax enable
set foldmethod=indent
set nofoldenable
set splitbelow
set background=dark
"colo peaksea
set t_Co=256
colo peaksea
au BufRead,BufNewFile *.sdl,*.jdl set filetype=fcdl
au BufRead,BufNewFile *.ma set filetype=mel
set laststatus=2
set history=500
set list
set listchars=tab:>-,eol:$
hi SpecialKey cterm=NONE ctermfg=1 guifg=DarkRed
hi NonText cterm=NONE ctermfg=1 guifg=DarkRed

" Get rid of toolbar and menu in gvim
set guioptions-=T
set guioptions-=m

"match ErrorMsg '\%>80v.\+'
autocmd FileType * set noexpandtab
autocmd FileType python set expandtab

set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc
set wildmode=longest:full
set wildmenu

set ignorecase
set smartcase
set scrolloff=2

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

" From http://vimcasts.org/episodes/show-invisibles/
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:▸\ ,eol:¬

map <F2> ,ci
map <F3> :registers<CR>
map <F4> :TlistToggle<CR>

map <F5> :set hls!<bar>set hls?<CR>
map <F6> :if exists("syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif <CR>
map <F7> zi
map <F8> :s/^[[:space:]]*//g

map <F9> :Sexplore<CR>
map <F10> :set paste!<Bar>set paste?<CR>
map <F11> :se nu!<CR>
map <F12> <C-w><C-_>

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

map + 5<C-W>+
map - 5<C-W>-
map <C-+> <C-W>+
map <C--> <C-W>-

"map + <C-W>+<C-W>+<C-W>k<C-W>-
"map - <C-W>-<C-W>-<C-W><C-K><C-W>+

"map + <C-W><C-K><C-W>-<C-W><C-J><C-W>+
"map - <C-W><C-K><C-W>+<C-W><C-J><C-W>-

map zw zCzO
map gf :sp <cfile><CR>

nmap ,t :ToggleWord<CR>

nmap ,va :VCSAdd<CR>
nmap ,vd :VCSDiff<CR>
nmap ,vc :VCSUpdate<CR>:VCSCommit<CR>
nmap ,vu :VCSUpdate<CR>
nmap ,vp :exe 'cd ' . expand ("%:p:h")<CR>:!fSandboxPub %<CR>
let VCSCommandGitDiffOpt="--no-ext-diff"

nmap ,.s :source $MYVIMRC<CR>
nmap ,.v :sp $MYVIMRC<CR>
nmap ,.c :sp $HOME/.cshrc<CR>
"nmap ,fpm :s/, *[a-z]*/ + ", " + /eg<CR>:s/([a-z]*/(" +/<CR>:s/)[^()]*$/ + ")");/<CR>:s/^\([[:space:]]*\)/\1print("/<CR>:s/" +  + "//g<CR>
nmap ,fpm :s/, *[a-z]*/ + ", " + /eg<CR>:s/([a-z]*/(" +/<CR>:s/)[^()]*$/ + ")\\n");/<CR>:s/^\([[:space:]]*\)/\1print("/<CR>:s/" +  + "//g<CR>:s/+ \[\] \(\$[a-zA-Z0-9_]*\)/+ stringArrayToString(\1, ",")/g<CR>

"Seemed like a good idea at the time, but really it just annoys me
"noremap <Space> <PageDown>
"noremap <BS> <PageUp>

map ,cd :exe 'cd ' . expand ("%:p:h")<CR>
map Y y$

"source ~/private/twit.credentials*/
let twitvim_enable_python = 1

let Tlist_Exit_OnlyWindow = 1

"let $ORIGKONSOLETITLE = system("dcop $KONSOLE_DCOP_SESSION sessionName | tr -d '\n'")
"autocmd BufReadPost * :silent !dcop $KONSOLE_DCOP_SESSION renameSession %
"nmap ,n :silent !dcop $KONSOLE_DCOP_SESSION renameSession %<CR>:redraw!<CR>
"autocmd WinEnter * :silent !dcop $KONSOLE_DCOP_SESSION renameSession %
"autocmd VimLeave * :!dcop $KONSOLE_DCOP_SESSION renameSession $ORIGKONSOLETITLE
