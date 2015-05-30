" Personalized vimrc. Layout based on spf-13.

" Environment {
  " Environment variables {
    let env_background=$KZ_BACKGROUND
    let env_base16_scheme=$KZ_BASE16
  " }
  " Identify platform {
    silent function! OSX()
      return has('macunix')
    endfunction
    silent function! LINUX()
      return has('unix') && !has('macunix') && !has('win32unix')
    endfunction
    silent function! WINDOWS()
      return (has('win16') || has('win32') || has('win64'))
    endfunction
  " }

  " Basics {
    set nocompatible
    if &shell =~# 'fish$'
      set shell=sh
    endif
  " }

  " Terminal settings {
    set t_Co=256
    set encoding=utf-8
    set fillchars+=stl:\ ,stlnc:\
    set termencoding=utf-8
    set ttyfast
  " }
" }

" Use bundles config {
  if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
  endif
" }

" Use vimrc custom if exists {
  if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
  endif
" }

" General {
  if env_background != 'light'
    set background=dark
  endif
  syntax on
  filetype plugin indent on
  set clipboard=unnamed
  set backspace=indent,eol,start
" }

" Vim UI {
  " Line Numbers {
    set relativenumber
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

    au FocusLost * :set number
    au FocusGained * :set relativenumber

    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber

    " Automatically equalize splits when window is resized.
    autocmd VimResized * wincmd =

    if has("autocmd") && has('GUI_GTK')
      au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
      au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
      au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
    endif
  " }

  " Color scheme {
    let base16colorspace=256
    colorscheme base16-ocean
  " }

  " Color column {
    " Display a line in column 80 to show when to line break. Note that this is
    " not available before Vim 7.3. Also, note that Vim 7.3 follows a different
    " version scheme (703, not 730).
    if v:version >= 703
      set colorcolumn=80
    endif
  " }

  set cursorline

  " Change color of line numbes
  highlight LineNr ctermfg=8

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
" }

" Formatting {
  set nowrap          " Do not wrap long lines.

  set autoindent      " Indent at the same level of the previous line
  set shiftwidth=2    " Use indents of 2 spaces
  set expandtab       " Tabs are spaces, not tabs
  set tabstop=2       " An indentation every 2 columns
  set softtabstop=2   " Let backspace delete indent

  autocmd BufNewFile,BufRead .tiles,.repos,REPOS setf python
  autocmd BufNewFile,BufRead *.flex setf jflex
  autocmd BufNewFile,BufRead *.scaml setf haml
  autocmd BufNewFile,BufRead *.gyp,*.gypi,*.json setf javascript
  autocmd BufNewFile,BufRead *.erl,*.es,*.hrl,*.yaws,*.xrl,*.app.src setf erlang
  autocmd BufNewFile,BufRead *.pb,CROSSTOOL setf protoascii
  autocmd BufNewFile,BufRead *.jsonnet setf jsonnet
  autocmd FileType fish compiler fish setlocal textwidth=79
  autocmd FileType rust setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
  autocmd FileType go setlocal noet shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
  autocmd FileType erlang setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
  autocmd FileType org setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
" }

" Key (re)Mappings {
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
" }

" Plugins {
  " adinapoli/vim-markmultiple {
    " Set C-m to be MarkMultiple trigger
    let g:mark_multiple_trigger = "<C-m>"
  " }

  " nathanaelkane/vim-indent-guides {
    hi IndentGuidesOdd ctermbg=black
    hi IndentGuidesEven ctermbg=darkgrey
  " }

  " edkolev/tmuxline.vim {
    " Tmuxline custom preset
    let g:tmuxline_preset = {
      \'a':    '#S',
      \'win':  '#I #W',
      \'cwin': '#I #W',
      \'x':    ['%Y-%m-%d', '%H:%M'],
      \'y':    '#(battery Charging; battery Discharging)',
      \'z':    '#h'}
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
    let g:rainbow_active = 1
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
" }

" Local vimrc {
  if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
  endif
" }
