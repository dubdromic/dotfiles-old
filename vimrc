call pathogen#infect()

set nocompatible
set autoindent
set relativenumber    
set cursorline
set hidden       
set shortmess=aIoOA
set novisualbell   
set showcmd
set splitbelow  
set splitright 
set scrolloff=2
set sidescrolloff=8
set laststatus=2
set backspace=indent,eol,start
set showmatch
set matchtime=3
set smartcase
set encoding=utf-8

set ts=2
set sw=2
set sts=2
set expandtab

set ttyfast
set lazyredraw

set wildmenu
set wildchar=<Tab>
set wildmode=list:longest,list
set wildignore+=.hg,.git,.svn
set wildignore+=*.sw?
set wildignore+=*.o?,*.obj
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.eot,*.svg,*.ttf,*.woff,*.pdf,*.graffle
set wildignore+=*.DS_Store
set wildignore+=*.pyc
set wildignore+=*.class

set mouse=a
set nomousehide

" works around crontab issues
set backupskip=/tmp/*,/private/tmp/*

set undodir=~/.tmp/
set backupdir=~/.tmp/
set directory=~/.tmp/
set backup

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=m

syntax on
filetype on
filetype plugin on
filetype indent on

let mapleader=","

let Powerline_symbols = 'fancy'

let g:CommandTMatchWindowAtTop = 1
let g:CommandTMaxHeight = 15
let g:CommandTMatchWindowReverse = 0

let NERDTreeWinPos="right"

set term=screen-256color

" Go syntax highlighting and :Fmt command
set rtp+=$GOROOT/misc/vim

set t_Co=256
colorscheme Tomorrow-Night

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

nmap <C-f> :Ack 
nmap <Leader>n :NERDTreeToggle<CR>:wincmd p<CR>
nmap <Leader>nf :NERDTreeFind<CR>:wincmd p<CR>

noremap j gj
noremap k gk
noremap p gp
noremap P gP

nnoremap <leader>p p`[v`]=`
nnoremap K <nop>

au BufRead * set relativenumber
au BufRead /tmp/mutt* set tw=70

au BufNewFile,BufRead *.gpg setlocal nobackup
au BufNewFile,BufRead *.gpg setlocal nowritebackup
au BufNewFile,BufRead *.gpg setlocal noswapfile

au BufWritePre *.go Fmt
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Close NERDTree if it's the only buffer open
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" Fat fingers
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang WA wa<bang>
command! -bang Wa wa<bang>
command! -bang WQ wq<bang>
command! -bang Wq wq<bang>
command! -bang Bd bd<bang>
command! -bang Vsp vsp<bang>
