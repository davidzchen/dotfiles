set nocompatible

if filereadable(expand("~/.dots/vim/bundles.vim"))
  source ~/.dots/vim/bundles.vim
endif

" Terminal settings
set encoding=utf-8
set fileencoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
set ttyfast

" General
syntax on
filetype plugin indent on
set backspace=indent,eol,start

" Show error highlight past margin.
function! HighlightTooLongLines()
  highlight def link RightMargin Error
  if &textwidth != 0
    exec ('match RightMargin /\%>' . &textwidth . 'v.\+/')
  endif
endfunction

" Display a line in column 80 to show when to line break. Note that this is
" not available before Vim 7.3. Also, note that Vim 7.3 follows a different
" version scheme (703, not 730).
if v:version >= 703
  set colorcolumn=80
endif
"augroup highlight_toolong
"  au!
"  au FileType,BufEnter * call HighlightTooLongLines()
"augroup END

" Change cursor depending on if the active cursor is in the window.
if has("autocmd") && has('GUI_GTK')
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif

" Add :Trimws command for clearing trailing whitespace.
function! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfunction
command! Trimws call TrimWhitespace()

" Highlight the line the cursor is on
"set cursorline

" Key mappings for tabs.
nnoremap th :tabprevious<CR>
nnoremap tl :tabnext<CR>
nnoremap tn :tabnew<CR>

" Navigation among splits.
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" More natural movement between lines, especially with wrapped text.
nnoremap j gj
nnoremap k gk

" Quickly move to the beginning or end of a line.
nnoremap H ^
nnoremap L $

" Automatically equalize splits when window is resized.
autocmd VimResized * wincmd =

" Line Numbers {
set number
function! NumberToggle()
  if(&relativenumber == 1)
    if v:version > 703 || (v:version == 703 && has('patch1115'))
      set norelativenumber
    end
    set number
  else
    if v:version > 703 || (v:version == 703 && has ('patch1115'))
      set nonumber
    end
    set relativenumber
  endif
endfunc
nnoremap fk :call NumberToggle()<cr>

" Change color of line numbes
highlight LineNr ctermfg=8

" Enable 24-bit colors
" N.B. Disabled currently because the wal vim and airline themes are based on
" the terminal's ANSI colors, which requiers 16-bit colors.
"if exists('+termguicolors')
"  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"  set termguicolors
"endif

" Color scheme
set background=dark
colorscheme wal

set incsearch
set hlsearch
set smartcase
set ignorecase
set scrolloff=3
set showmatch
set confirm

set modeline
set modelines=5

set laststatus=2
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
set foldenable
set visualbell
set wildmenu

" Use more natural splitting
set splitbelow
set splitright

" Formatting {
set nowrap          " Do not wrap long lines.

set autoindent      " Indent at the same level of the previous line
set shiftwidth=2    " Use indents of 2 spaces
set expandtab       " Tabs are spaces, not tabs
set tabstop=2       " An indentation every 2 columns
set softtabstop=2   " Let backspace delete indent

autocmd BUfNewFile,BufRead BUILD.bazel,*.BUILD,*.WORKSPACE setf bzl
autocmd BufNewFile,BufRead .tiles,.repos,REPOS setf python
autocmd BufNewFile,BufRead *.BUILD,*.WORKSPACE,BUILD.bazel setf bzl
autocmd BufNewFile,BufRead *.flex setf jflex
autocmd BufNewFile,BufRead *.scaml setf haml
autocmd BufNewFile,BufRead *.gyp,*.gypi,*.json setf javascript
autocmd BufNewFile,BufRead *.erl,*.es,*.hrl,*.yaws,*.xrl,*.app.src setf erlang
autocmd BufNewFile,BufRead *.pb,CROSSTOOL setf protoascii
autocmd BufNewFile,BufRead *.cson setf coffee
autocmd BufNewFile,BufRead *.i setf swig
autocmd BufNewFile,BufRead *.desktop setf dosini
autocmd BufNewFile,BufRead gitconfig setf gitconfig
autocmd BufNewFile,BufRead Kbuild setf make
autocmd FileType fish compiler fish setlocal textwidth=79
autocmd FileType rust setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType go setlocal noet shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
autocmd FileType python setlocal noet shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType erlang setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType org setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType vala setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType markdown setlocal textwidth=80
if v:version > 703
  autocmd FileType java setlocal colorcolumn=100
  autocmd FileType rust setlocal colorcolumn=100
  autocmd FileType swift setlocal colorcolumn=100
  autocmd FileType vala setlocal colorcolumn=90
endif

" Plugin-specific

  " adinapoli/vim-markmultiple {
    " Set C-m to be MarkMultiple trigger
    let g:mark_multiple_trigger = "<C-m>"
  " }

  " nathanaelkane/vim-indent-guides {
    hi IndentGuidesOdd ctermbg=black
    hi IndentGuidesEven ctermbg=darkgrey
  " }

  " scrooloose/nerdtree {
    map <C-n> :NERDTreeToggle<CR>
  " }

  " majutsushi/tagbar {
    nmap <F8> :TagbarToggle<CR>
  " }

  " bling/vim-airline {
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    let g:airline_theme='wal'
  " }

  " airblade/vim-gitgutter {
    highlight clear SignColumn
  " }

  " scrooloose/syntastic {
    " Passive mode for checker by default since it is not always working correclty
    " in Java projects. Use Ctrl+w E to run the checker.
    let g:syntastic_mode_map = {
      \'mode': 'passive',
      \'active_filetypes': [],
      \'passive_filetypes': [] }
    nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
  " }

  " exu/pgsql.vim {
    " Tells sql.vim to use the pgsql dialect by default.
    let g:sql_type_default = 'pgsql'
  " }

  " luochen1990/rainbow {
    let g:rainbow_active = 0
    let g:rainbow_conf = {
    \  'guifgs': [
    \    'darkred',
    \    'DarkBlue',
    \    'darkmagenta',
    \    'darkgreen',
    \    'darkcyan',
    \    'darkgray',
    \  ],
    \  'ctermfgs': [
    \    'darkred',
    \    'DarkBlue',
    \    'darkmagenta',
    \    'darkgreen',
    \    'darkcyan',
    \    'darkgray',
    \  ],
    \  'operators': '_,_',
    \  'parentheses': [
    \    'start=/(/ end=/)/ fold',
    \    'start=/\[/ end=/\]/ fold',
    \    'start=/{/ end=/}/ fold'
    \  ],
    \  'separately': {
    \    '*': {},
    \    'tex': {
    \      'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \    },
    \    'vim': {
    \      'parentheses': [
    \        'start=/(/ end=/)/',
    \        'start=/\[/ end=/\]/',
    \        'start=/{/ end=/}/ fold',
    \        'start=/(/ end=/)/ containedin=vimFuncBody',
    \        'start=/\[/ end=/\]/ containedin=vimFuncBody',
    \        'start=/{/ end=/}/ fold containedin=vimFuncBody'
    \      ],
    \    },
    \    'css': 0,
    \  }
    \}
  " }
