" ============================================================================
" Vim Configuration File: .vimrc
" Description: A robust configuration tailored for Windows 11 / PowerShell,
"              focusing on usability, aesthetics, and basic functionality.
" ============================================================================

" --- General Settings -------------------------------------------------------
" This section contains fundamental settings for Vim's behavior.

set nocompatible            " Be iMproved - essential for modern Vim features.
filetype plugin indent on   " Enable file type detection, plugins, and smart indenting.
syntax on                   " Enable syntax highlighting.
set hidden                  " Allow background buffers. Don't close a buffer when
                            " another is opened. Instead, hide the current buffer.
set nobackup                " Do not create backup files.
set nowritebackup           " Do not create a backup file when overwriting a file.
set noswapfile              " Do not create swap files. This can be useful on SSDs
                            " or if you use other methods for recovery.
set autoindent              " Copy indent from current line when starting a new line.
set smartindent             " Smarter automatic indentation for C-like files.
set expandtab               " Use spaces instead of tabs.
set tabstop=4               " A tab character is 4 spaces wide.
set shiftwidth=4            " Number of spaces to use for autoindent.
set softtabstop=4           " Number of spaces a <Tab> counts for while editing.
set wrap                    " Lines longer than window width will wrap.
set display=lastline        " Show the last line even if it's partially off-screen.
set encoding=utf-8          " Use UTF-8 encoding for file and display. Essential for
                            " correct display of various characters.
set ttyfast                 " Improves redrawing speed for terminal.

" --- UI & Appearance --------------------------------------------------------
" Settings related to how Vim looks.

colorscheme onedark          " Preferred dark color scheme. (Requires installation, see notes below)
set background=dark         " Tell Vim the background is dark for color schemes.
set number                  " Show line numbers on the left.
set relativenumber          " Show relative line numbers (useful for navigation).
set ruler                   " Show cursor position in the status line (line, column).
set laststatus=2            " Always show the status line.
set showcmd                 " Show the (partial) command in the status line.
set showmode                " Show current mode (INSERT, REPLACE, VISUAL) in status line.
set scrolloff=8             " Keep 8 lines above/below cursor when scrolling.
set noshowmatch             " Don't show matching brackets automatically (can be slow with large files).
                            " If you want this, change to `set showmatch`
" Font settings (Note: This might be overridden by your terminal settings)
" For Neovim or GVim, you'd use 'set guifont=Fira\ Code:h10' etc.
" For console Vim, the font is set in your PowerShell/Windows Terminal profile.
" Make sure Fira Code is set as the font in your PowerShell or Windows Terminal.

" --- Search Settings --------------------------------------------------------
" Enhance searching functionality.

set incsearch               " Highlight matches as you type your search query.
set hlsearch                " Highlight all matches of the last search pattern.
nnoremap <leader>n :noh<CR> " Clear search highlights with <leader>n (mapleader usually \)

" --- Command-Line Completion (Wildmenu) -------------------------------------
" Improves auto-completion in the command line.

set wildmenu                " Enhanced command-line completion. (See explanation at end)
set wildmode=list:longest,full " Show all matches for completion, then select the longest common string.

" --- Performance Optimizations ----------------------------------------------
" Minor tweaks for better performance, especially with larger files.
" Given your typical file sizes (100-300 lines), these are less critical but good to have.

set lazyredraw              " Only redraw when necessary (can speed up macros and scripts).
set ttybuiltin              " Use terminal's built-in redraw optimizations.

" --- Key Mappings (No custom ones requested initially) ----------------------
" You can add your custom key mappings here.
" Example:
" noremap <C-s> :w<CR> " Ctrl-S to save

" --- Plugin Management (Placeholder - Requires vim-plug) --------------------
" This section assumes you will use vim-plug for plugin management.
" Follow the installation instructions for vim-plug first!
" If you don't install a plugin manager, these lines will cause errors.

" call plug#begin('~/AppData/Local/nvim/plugged') " For Neovim users on Windows
call plug#begin('~/vimfiles/plugged')             " For Vim users on Windows

" Recommended Plugins (Add these lines once you install vim-plug)
" Plug 'morhetz/gruvbox'          " Another popular dark color scheme
Plug 'joshdick/onedark.vim'      " One Dark Pro color scheme (you selected onedark)
Plug 'tpope/vim-sensible'        " Opinionated set of good defaults
Plug 'tpope/vim-surround'        " Easily delete, change, and add surroundings (parentheses, quotes, etc.)
Plug 'tpope/vim-commentary'      " Smart commenting out of code
Plug 'airblade/vim-gitgutter'    " Show git diff signs in the sign column
Plug 'preservim/nerdtree'        " A tree explorer plugin for Vim (file browser)
" Plug 'ctrlpvim/ctrlp.vim'       " Fuzzy file finder (or fzf.vim with fzf for faster results)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fzf executable for faster fuzzy finding
Plug 'junegunn/fzf.vim'          " Vim plugin for fzf
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Highly recommended for auto-completion, linting, etc.
" Plug 'honza/vim-snippets'        " Snippets for various languages (often used with UltiSnips or CoC)

" Add other language-specific plugins here if needed, e.g.:
" Plug 'sheerun/vim-polyglot'      " Comprehensive language packs for Vim
" Plug 'mattn/emmet-vim'           " For HTML/CSS/JS rapid development

call plug#end()                 " Required to finish plugin setup.

" --- Plugin Specific Configurations -----------------------------------------
" Configure plugins after they are loaded.

" NERDTree Config
let g:NERDTreeDirArrows = 1     " Use arrows for directories
map <C-n> :NERDTreeToggle<CR>   " Map Ctrl-n to toggle NERDTree

" fzf.vim Config
" Command to find files (CtrlP-like)
nnoremap <C-p> :Files<CR>
" Command to find lines in current buffer
nnoremap <C-g> :Rg<CR>

" coc.nvim Config (Basic setup)
" For full CoC setup, you'll need to install language servers via :CocInstall
" Example: :CocInstall coc-json coc-css coc-html coc-tsserver coc-python
let g:coc_global_extensions = ['coc-json', 'coc-css', 'coc-html', 'coc-tsserver', 'coc-python']
" Use <tab> for completion and navigating snippets.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain.
" C-g means auto-indent for current line.
inoremap <silent><expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `gd` for goto definition (e.g. `gd` on a function name)
nmap <silent> gd <Plug>(coc-definition)
" Use `gy` for goto type definition
nmap <silent> gy <Plug>(coc-type-definition)
" Use `gi` for goto implementation
nmap <silent> gi <Plug>(coc-implementation)
" Use `gr` for goto references
nmap <silent> gr <Plug>(coc-references)
" Use `K` for hover documentation
nmap <silent> K <Plug>(coc-hover)

" --- PowerShell Specific (Examples - not active by default) -----------------
" You can uncomment and modify these if you want specific PowerShell integrations.

" Example: Run current PowerShell script
" noremap <leader>rp :!powershell.exe -NoProfile -ExecutionPolicy Bypass -File %<CR>
" (This would run the current file in a new PowerShell instance)

" Example: Execute selected PowerShell code (requires visual mode selection)
" vnoremap <leader>rc :w! /tmp/vim_temp.ps1<CR>:!powershell.exe -NoProfile -ExecutionPolicy Bypass -File /tmp/vim_temp.ps1<CR>
" (This is a bit more complex and might need adjustment for Windows temp paths)

" Example: Syntax for PowerShell (if not handled by vim-polyglot)
" au BufNewFile,BufRead *.ps1 set filetype=powershell
