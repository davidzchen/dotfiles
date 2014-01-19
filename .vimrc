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

call pathogen#infect()

" --------------------------------------- Moving around, searching and patterns

set hlsearch
set incsearch
set smartcase
set ignorecase

" ------------------------------------------------------------------------ Tags

" ------------------------------------------------------------- Displaying text

set scrolloff=3
set number

" ------------------------------------------- Syntax, highlighting and spelling

filetype plugin indent on
syntax enable

colorscheme solarized

"
" Change color of line numbes
"

highlight LineNr ctermfg=darkcyan

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

set tabstop=2
set softtabstop=2
set shiftwidth=2
"set expandtab
set autoindent

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

highlight clear SignColumn

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
