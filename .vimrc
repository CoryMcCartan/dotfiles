" CORY McCARTAN
" vim configuration file
"
" Packages {{{
packadd! everforest
" }}}
" Intenting {{{ 
filetype indent on
set shiftwidth=4 
set tabstop=4 
set softtabstop=4 
set expandtab 
set autoindent 
set copyindent 
set smartindent 
set breakindent
" 80 character max 
set colorcolumn=80 
" wrap
set nowrap
set linebreak
"}}}
" Autocommands {{{
" commenting
autocmd FileType c,cpp,java,scala,javascript let b:comment_leader = '// '
autocmd FileType c,cpp,java,scala,javascript let b:comment_ender = ''
autocmd FileType sh,ruby,python,R,md,rmd   let b:comment_leader = '# '
autocmd FileType sh,ruby,python,R,md,rmd   let b:comment_ender = ''
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType tex              let b:comment_ender = ''
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType vim              let b:comment_ender = '" '
autocmd FileType html let b:comment_leader = '<!-- ' 
autocmd FileType html let b:comment_ender = ' -->' 
autocmd FileType css let b:comment_leader = '/* ' 
autocmd FileType css let b:comment_ender = ' */' 
" word wrap
autocmd FileType tex setlocal tw=80 	
autocmd FileType quarto set wrap
" filetype indenting
autocmd FileType html,python,sass set foldmethod=indent
autocmd FileType python,r,rmd set nosmartindent 
autocmd FileType sass setlocal sw=4 sts=4
autocmd FileType make set noexpandtab sw=4 sts=0
" syntax highlighting
autocmd BufNewFile,BufRead *.tikz   set syntax=tex
autocmd BufNewFile,BufRead .Rprofile   set syntax=r
autocmd FileType tex set regexpengine=1
" crontab editing
au FileType crontab setlocal bkc=yes
"}}}
" Syntax {{{
" syntax highighting
syntax on
" filetype based plugins etc
" filetype plugin on
" autocomplete
" set omnifunc=syntaxcomplete#Complete " autocomplete
"set omnifunc=ale#completion#OmniFunc
"let g:ale_completion_enabled = 1

" set completeopt=longest,menuone
" inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" refactoring
" nnoremap gr gdva{:s/<C-R>///g<left><left>
" nnoremap gR gD:%s/<C-R>///g<left><left>"}]
" don't jump to matching tags/brackets
set matchtime=0
" LaTeX
let g:tex_flavor = "latex"
" SQL
" let g:omni_sql_no_default_maps = 1
"}}}
" Keyboard shortcuts {{{
" replace : with ;
nnoremap ; :
vnoremap ; :
" leader keys
let mapleader=","
let maplocalleader=""
" repeat f / t
nnoremap \ ;
" increment and decrement
nmap <C-z> <C-a>
vmap <C-z> g<C-a>
vmap <C-x> g<C-x>
" timeout length for shortcuts
set timeoutlen=600
" moving lines
nnoremap <C-S-j> :m+<CR>==
nnoremap <C-S-k> :m-2<CR>==
vnoremap <C-S-j> :m'>+<CR>gv=gv
vnoremap <C-S-k> :m-2<CR>gv=gv
" exit insert mode
" inoremap jk <Esc>l
inoremap <C-c> <Esc>l
" Insert newline
" nnoremap <S-enter> o<Esc>k
" comment and uncomment
let b:comment_leader = ''
let b:comment_ender = ''
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:s/$/<C-R>=escape(b:comment_ender,'\/*')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:s/<C-R>=escape(b:comment_ender,'\/*')<CR>$<CR>:nohlsearch<CR>
noremap <silent> <leader>c :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>u :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
"}}}
" Motion {{{
" move to next editor line
nnoremap j gj
nnoremap k gk
" more normal handling
set nostartofline
set mouse=a
set backspace=indent,eol,start
" select what was just pasted
nnoremap gp `[v`]
" use f2 to toggle between pase and nopaste
set pastetoggle=<F2>
" fix arrow and function keys
"imap OA <ESC>ki
"imap OB <ESC>ji
"imap OC <ESC>li
"imap OD <ESC>hi
"noremap <silent> <ESC>A <Nop>
"noremap <silent> <ESC>B <Nop>
"noremap <silent> <ESC>C <Nop>
"noremap <silent> <ESC>D <Nop>
map OA <up>
map OB <down>
map OC <right>
map OD <left>
map OQ <F2>
map <Esc>OQ <F2>
"}}}
" Display {{{
" show partial commands
set showcmd
" line numbers
set number
set relativenumber
" show filename in title
set title
" ruler (cursor pos in lower right)
set ruler
" folding
nnoremap <space> za
vnoremap <space> za
set foldmethod=syntax
set foldlevelstart=2
" hidden characters (whitespace)
set listchars=tab:>.,trail:.,extends:#,nbsp:.
"}}}
" Color {{{
if has('termguicolors')
    set termguicolors
endif
set background=dark
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
"let g:everforest_colors_override = {'bg0': ['#202020', '234']}
colorscheme everforest
" }}}
" File manipulation {{{
" hide buffers instead of closing
set hidden
" ignore file names for tab-completion
set wildignore=*.swp,*.bak,*.pyc,*.class,*.log,*.aux,*.pdf
" ignore for directory view
let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'
"}}}
" Searching {{{
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
nnoremap <CR> :nohlsearch<CR><CR>
"}}}
" Custom Commands {{{
command! Shebang 0put =\"#!/usr/bin/env \"|start!|w|! chmod +x %
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR><CR>:noh<CR><CR>
nmap <leader>fd yyO<Esc>P$T)DA;<Esc>
nmap <leader>tc ggVG"*y
"}}}
" Windows and tabs {{{
" split
set splitright
set splitbelow
" tab navigation
nnoremap <C-h> <C-w>p
nnoremap <C-l> :tabnext<CR>
"}}}
" Powerline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1
let g:airline_section_warning = ''
let g:airline#extensions#tabline#tabs_label = ' '
let g:airline_theme="everforest"
let g:promptline_theme = "airline"
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#promptline#enabled = 0
"let g:airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
"let g:airline#extensions#promptline#snapshot_file = "~/.bin/promptline.sh"
function RebuildPowerline()
    let g:tmuxline_preset = {
            \'a'    : '#S',
            \'win'  : '#I #{b:pane_current_path}',
            \'cwin' : '#I #{b:pane_current_path}',
            \ 'z': '%R',
            \ 'options': {
            \'status-justify': 'left'}
            \}
    let g:promptline_preset = {
            \'a' : [ promptline#slices#host() ],
            \'c' : [ promptline#slices#cwd({ 'dir_limit': 2 }) ],
            \'y' : [ promptline#slices#vcs_branch() ],
            \'z' : [ promptline#slices#git_status() ],
            \'warn' : [ promptline#slices#jobs() ]}
    :Tmuxline airline
    TmuxlineSnapshot! ~/.tmux-status.conf
    PromptlineSnapshot! ~/.bin/promptline.sh
endfunction
" colors ??
" autocmd VimEnter * hi Normal ctermbg=none

"" These lines setup the environment to show graphics and colors correctly.
set nocompatible
" set t_Co=256" 
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
"}}}
" Slime {{{
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_no_mappings = 1
let g:slime_dont_ask_default = 1
" use s to send
nnoremap s <Nop>
"send visual selection
xmap s <Plug>SlimeRegionSend
"send based on motion or text object
nmap s <Plug>SlimeMotionSend
"send line
nmap ss <Plug>SlimeLineSend
nnoremap <buffer> <CR> :execute "normal \<Plug>SlimeLineSend"<CR>gj
" }}}
" Bracketed paste {{{
" Code from <https://github.com/ConradIrwin/vim-bracketed-paste/blob/master/plugin/bracketed-paste.vim>
if exists("g:loaded_bracketed_paste")
      finish
endif
let g:loaded_bracketed_paste = 1
let &t_ti .= "\<Esc>[?2004h"
let &t_te = "\e[?2004l" . &t_te
function! XTermPasteBegin(ret)
      set pastetoggle=<f29>
        set paste
          return a:ret
endfunction
execute "set <f28>=\<Esc>[200~"
execute "set <f29>=\<Esc>[201~"
map <expr> <f28> XTermPasteBegin("i")
imap <expr> <f28> XTermPasteBegin("")
vmap <expr> <f28> XTermPasteBegin("c")
cmap <f28> <nop>
cmap <f29> <nop>
"}}}
" Misc. {{{
" performance
"set lazyredraw
set ttyfast
" auto pairs
" let g:AutoPairsFlyMode = 1
" stop annoying bell
set belloff=all
" fix meta-keys
" set <M-e>=e
" imap e <M-e>
" set <M-b>=b
" imap b <M-b>
" only do syntax highlighting for first 160 columns
set synmaxcol=640
" for this file's folds
set modelines=1
"}}} vim:foldmethod=marker:foldlevel=0
