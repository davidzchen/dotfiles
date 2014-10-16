" Personalized vimrc. Layout based on spf-13.

" Environment {
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
  set background=dark
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
    nnoremap <C-k> :call NumberToggle()<cr>

    au FocusLost * :set number
    au FocusGained * :set relativenumber

    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber

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
" }

" Formatting {
  set nowrap          " Do not wrap long lines.

  set autoindent      " Indent at the same level of the previous line
  set shiftwidth=2    " Use indents of 2 spaces
  set expandtab       " Tabs are spaces, not tabs
  set tabstop=2       " An indentation every 2 columns
  set softtabstop=2   " Let backspace delete indent

  autocmd BufNewFile,BufRead .tiles,.repos,REPOS,BUILD setf python
  autocmd BufNewFile,BufRead *.flex setf jflex
  autocmd BufNewFile,BufRead *.scaml setf haml
  autocmd BufNewFile,BufRead *.gyp,*.gypi,*.json setf javascript
  autocmd BufNewFile,BufRead *.erl,*.es,*.hrl,*.yaws,*.xrl,*.app.src setf erlang
  autocmd FileType fish compiler fish setlocal textwidth=79
  autocmd FileType rust setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType go setlocal noet shiftwidth=8 tabstop=8 softtabstop=8
  autocmd FileType erlang setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
" }

" Key (re)Mappings {
  " Key mappings for tabs.
  nmap <C-h> :tabprevious<CR>
  nmap <C-l> :tabnext<CR>
  nmap <C-t> :tabnew<CR>
" }

" Plugins {
  " MarkMultiple {
    " Set C-m to be MarkMultiple trigger
    let g:mark_multiple_trigger = "<C-m>"
  " }

  " vim-indent-guides {
    hi IndentGuidesOdd ctermbg=black
    hi IndentGuidesEven ctermbg=darkgrey
  " }

  " Tmuxline {
    " Tmuxline custom preset
    let g:tmuxline_preset = {
      \'a':    '#S',
      \'b':    '#W',
      \'win':  '#I #W',
      \'cwin': '#I #W',
      \'x':    ['%Y-%m-%d', '%H:%M'],
      \'y':    '#(battery Charging; battery Discharging)',
      \'z':    '#h'}
  " }

  " NERDTree {
    map <C-n> :NERDTreeToggle<CR>
  " }

  " Tagbar {
    nmap <F8> :TagbarToggle<CR>
  " }

  " Airline {
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
  " }

  " Gitgutter {
    highlight clear SignColumn
  " }

  " Syntastic {
    " Passive mode for checker by default since it is not always working correclty
    " in Java projects. Use Ctrl+w E to run the checker.
    let g:syntastic_mode_map = {
      \'mode': 'passive',
      \'active_filetypes': [],
      \'passive_filetypes': [] }
    nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
  " }

  " Rainbow Parentheses {
    let g:rbpt_colorpairs = [
        \ ['brown',       'RoyalBlue3'],
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
        \ ]
    let g:rbpt_max = 15
    let g:rbpt_loadcmd_toggle = 0
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
  " }
" }

" Local vimrc {
  if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
  endif
" }
