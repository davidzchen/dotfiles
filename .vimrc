" =============================================================================
" FILE NAME: .vimrc
" -----------------------------------------------------------------------------
" DESCRIPTION:
"
" Vim configuration.
" -----------------------------------------------------------------------------
" AUTHOR: David Z. Chen
" -----------------------------------------------------------------------------
" REVISION HISTORY:
"
" 03-Mar-2013 - Create this file
" =============================================================================

" ------------------------------------------------------------------- Important

set nocompatible
if &shell =~# 'fish$'
  set shell=sh
endif

execute pathogen#infect()

" --------------------------------------- Moving around, searching and patterns

set hlsearch
set incsearch
set smartcase
set ignorecase

" ------------------------------------------------------------------------ Tags

" ------------------------------------------------------------- Displaying text

set background=dark

set scrolloff=3
set number

" ------------------------------------------- Syntax, highlighting and spelling

syntax on
filetype plugin indent on

"let g:hybrid_use_Xresources = 1
let base16colorspace=256
colorscheme base16-ocean

hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

"
" Change color of line numbes
"

highlight LineNr ctermfg=8

set backspace=indent,eol,start

"
" Display a line in column 80 to show when to line break. Note that this is
" not available before Vim 7.3. Also, note that Vim 7.3 follows a different
" version scheme (703, not 730).
"

if v:version >= 703
  set colorcolumn=80
endif

" ------------------------------------------------------------ Multiple windows

set laststatus=2
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" ---------------------------------------------------------- Multiple tab pages

" -------------------------------------------------------------------- Terminal

set t_Co=256
let g:airline_powerline_fonts = 1
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

set ttyfast

" ------------------------------------------------------------- Using the mouse

" -------------------------------------------------------------------- Printing

" ----------------------------------------------------------- Messages and info

set confirm

" -------------------------------------------------------------- Selecting text

set clipboard=unnamed

" ---------------------------------------------------------------- Editing text

set showmatch

" ---------------------------------------------------------- Tabs and indenting


" --------------------------------------------------------------------- Folding

set nowrap

" ------------------------------------------------------------------- Diff mode
" --------------------------------------------------------------------- Mapping
" --------------------------------------------------- Reading and writing files

set modeline
set modelines=5

" --------------------------------------------------------------- The swap file
" -------------------------------------------------------- Command line editing
" ------------------------------------------------- Executing external commands
" ------------------------------------------ Running make and jumping to errors
" ----------------------------------------------------------- Language specific
" ------------------------------------------------------- Multi-byte characters

" --------------------------------------------------------------------- Various

" Set C-m to be MarkMultiple trigger
let g:mark_multiple_trigger = "<C-m>"

" Key mappings for tabs.
nmap <C-h> :tabprevious<CR>
nmap <C-l> :tabnext<CR>
nmap <C-t> :tabnew<CR>

map <C-n> :NERDTreeToggle<CR>

highlight clear SignColumn

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

