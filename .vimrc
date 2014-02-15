set number
set nocompatible        " Disable vi-compatibility
set laststatus=2        " Always show the statusline
set encoding=utf-8      " Necessary to show Unicode glyphs
"set t_Co=256            " Explicitly tell Vim that the terminal supports 256 colors
set t_Sf=^[[1;3%p1%dm   " set foreground color
set t_Sb=^[[1;4%p1%dm   " set background color
set incsearch           " While typing a search pattern, show immediately where the so far typed pattern matches.
set hlsearch            " When there is a previous search pattern, highlight all its matches.
set showcmd             " show command
set showmode            " show current mode
set nocindent
set secure
set smarttab
set wildchar=<TAB>      " such as <TAB> in shell
"set tabstop=4
"set shiftwidth=4
"set mouse=a
syntax on               " show parts of the text in another font or color

highlight Comment    ctermfg=DarkCyan
highlight SpecialKey ctermfg=Yellow

" Setting up Vundle - the vim plugin bundler
filetype off                   " required!

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
	echo "Installing Vundle.."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
	let iCanHazVundle=0
endif

" git clone https://github.com/Lokaltog/powerline.git ~/.vim/bundle/powerline
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
" vim-scripts repos
Bundle 'Align'
" non github repos

if iCanHazVundle == 0
	echo "Installing Bundles, please ignore key map error messages"
	echo ""
	:BundleInstall
endif

filetype plugin indent on     " required!
" Setting up Vundle - the vim plugin bundler end

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


" FuzzyFinder key mapping
map fb <esc>:FufBuffer<cr>
map ff <esc>:FufFile<cr>
map fd <esc>:FufDir<cr>
map fj <esc>:FufJumpList<cr>
map fc <esc>:FufChangeList<cr>
map <silent> <c-\> :FufTag! <c-r>=expand('<cword>')<cr><cr>
map <c-f12> <esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction
augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END


" smart mapping for tab completion
function InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>


autocmd FileType c,cpp,cc,java call PROG()
function PROG()
	set showmatch
	set nosmartindent
	set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30
	set cinoptions=t0
	imap <C-a>f <END><CR>for(;;) {<CR>}<LEFT><CR><UP><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT>
	imap <C-a>w <END><CR>while( ) {<CR>}<LEFT><CR><UP><UP><UP><END><LEFT><LEFT>
	set formatoptions=tcqr
endfunction


map <F2> :update<CR>                    " using :update to replace :w
map <F3> :update<CR>:q<CR>
map <F4> :q!<CR>
map <F5> :bp<CR>
map <F6> :bn<CR>
map <F7> :if exists("syntax_on")<bar>syntax off<bar>else<bar>syntax on<bar>endif<CR>  " press <F7> syntax on/off
map <F8> :set hls!<BAR>set hls?<CR>     " toggle on/off highlightsearch
map <F9> :set paste!<BAR>set paste?<CR> " toggle on/off paste mode
set pastetoggle=<F9>
map <F10> <ESC>:read !date<CR>
map :T :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1


