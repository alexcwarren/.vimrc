"==============================
" Basic Settings
"==============================
set nocompatible              " Use Vim defaults (not Vi)
set encoding=utf-8            " UTF-8 encoding
set fileformats=unix,dos,mac
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set cursorline                " Highlight current line
set showcmd                   " Show command in bottom bar
set showmode                  " Show current mode
set wildmenu                  " Tab completion menu
set mouse=a                   " Enable mouse in all modes
set clipboard=unnamedplus     " Use system clipboard
set ttyfast                   " Speed up rendering
set lazyredraw                " Improve performance
set scrolloff=8               " Keep 8 lines visible when scrolling
set sidescrolloff=8
set ruler                     " Show cursor position
set hidden                    " Allow background buffers

"==============================
" Tabs & Indentation
"==============================
set tabstop=4                 " Number of spaces tabs count for
set shiftwidth=4              " Indent size
set expandtab                 " Use spaces, not tabs
set smarttab
set smartindent
set autoindent

"==============================
" Search
"==============================
set ignorecase                " Case-insensitive search...
set smartcase                 " ... unless you use caps
set incsearch                 " Show matches while typing
set hlsearch                  " Highlight search results

"==============================
" Appearance
"==============================
syntax enable
set background=dark           " Better for dark terminals
colorscheme desert            " Change to 'gruvbox' or 'nord' if installed
set termguicolors             " Enable true color support

"==============================
" Backup and Undo
"==============================
set nobackup
set nowritebackup
set noswapfile
set undofile                  " Persistent undo
set undodir=~/.vim/undodir
if !isdirectory(&undodir)
    silent !mkdir -p ~/.vim/undodir
endif

"==============================
" Status Line
"==============================
set laststatus=2              " Always show status line
set statusline=%f\ %y\ %m%r%h%w\ [%l,%c]\ [%p%%]

"==============================
" Filetype plugins
"==============================
filetype plugin indent on

"==============================
" Key Mappings
"==============================
let mapleader = ","
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>h :nohlsearch<CR>

" Move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"==============================
" Plugin Loader (optional)
"==============================
" Uncomment if using Vim 8+ native packages
" set runtimepath+=~/.vim/pack/plugins/start

" Uncomment if using Pathogen:
" execute pathogen#infect()
" call pathogen#helptags()

"==============================
" Extras
"==============================
" Enable 256-color terminal
if &term =~ "xterm.*"
  set t_Co=256
endif

" Autosave (optional)
" autocmd BufLeave,FocusLost * silent! wall

" Restore cursor position when reopening files
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
