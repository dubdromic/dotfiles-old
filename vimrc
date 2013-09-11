call pathogen#infect()

set nocompatible
set autoindent
set relativenumber
set hidden
set splitbelow
set splitright
set ts=2
set sw=2
set sts=2
set expandtab
set t_Co=256

colorscheme Tomorrow-Night

let mapleader=","

" syntax on
filetype on
filetype indent on

let g:CommandTMatchWindowAtTop = 1
let g:CommandTMaxHeight = 15
let g:CommandTMatchWindowReverse = 0

set undodir=~/.tmp/
set undofile
set undolevels=1000
set undoreload=10000

set backupdir=~/.tmp/
set directory=~/.tmp/
set backup

set noeb vb t_vb=
