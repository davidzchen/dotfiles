" Setup Bundle Support {
  set nocompatible
  filetype off
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
" }

" Bundles {
  " Vundle {
    Plugin 'VundleVim/Vundle.vim'
  " }

  " Syntaxes {
    Plugin 'chlorophyllin/avro-vim'
    Plugin 'chlorophyllin/pig.vim'
    Plugin 'chlorophyllin/rc.vim'
    Plugin 'chlorophyllin/Syntax-for-Fasta'
    Plugin 'chlorophyllin/hive.vim'
    Plugin 'chlorophyllin/jproperties.vim'
    Plugin 'vim-scripts/jade.vim'
    Plugin 'pbrisbin/html-template-syntax'
    Plugin 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM'
    Plugin 'tpope/vim-markdown'
    Plugin 'arrufat/vala.vim'
    Plugin 'guns/vim-clojure-static'
    Plugin 'vim-scripts/Io-programming-language-syntax'
    Plugin 'juvenn/mustache.vim'
    Plugin 'jvoorhis/coq.vim'
    Plugin 'fatih/vim-go'
    Plugin 'timcharper/textile.vim'
    Plugin 'ksauzz/thrift.vim'
    Plugin 'uarun/vim-protobuf'
    Plugin 'lepture/vim-velocity'
    Plugin 'jimmyhchan/dustjs.vim'
    Plugin 'groenewege/vim-less'
    Plugin 'derekwyatt/vim-sbt'
    Plugin 'gre/play2vim'
    Plugin 'othree/html5.vim'
    Plugin 'derekwyatt/vim-scala'
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'sellerie/vim-gradle'
    Plugin 'wting/rust.vim'
    Plugin 'b4winckler/vim-objc'
    Plugin 'tpope/vim-haml'
    Plugin 'jrozner/vim-antlr'
    Plugin 'cespare/vim-toml'
    Plugin 'jimenezrick/vimerl'
    Plugin 'edkolev/erlang-motions.vim'
    Plugin 'justinmk/vim-syntax-extra'
    Plugin 'darfink/vim-plist'
    Plugin 'exu/pgsql.vim'
    Plugin 'google/vim-ft-bzl'
    Plugin 'elixir-lang/vim-elixir'
    Plugin 'tmux-plugins/vim-tmux'
    Plugin 'OrangeT/vim-csharp'
    Plugin 'jdonaldson/vaxe'
    Plugin 'idris-hackers/idris-vim'
    Plugin 'JuliaLang/julia-vim'
    Plugin 'lambdatoast/elm.vim'
    Plugin 'brandonbloom/vim-factor'
    Plugin 'vim-scripts/clearsilver'
    Plugin 'google/vim-jsonnet'
    Plugin 'keith/swift.vim'
    Plugin 'Glench/Vim-Jinja2-Syntax'
    Plugin 'stephpy/vim-yaml'
    Plugin 'vim-scripts/SWIG-syntax'
    Plugin 'matze/vim-meson'
  " }

  " Color schemes {
    Plugin 'chlorophyllin/base16-vim'
    Plugin 'dylanaraps/wal.vim'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'chlorophyllin/citylights.vim'
    Plugin 'colepeters/spacemacs-theme.vim'
  " }

  " Tools {
    Plugin 'chlorophyllin/snipmate.vim'
    Plugin 'tpope/vim-dispatch'
    Plugin 'sjl/vitality.vim'
    "Plugin 'tpope/vim-fugitive'
    "Plugin 'adinapoli/vim-markmultiple'
    "Plugin 'sjl/gundo.vim'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'edkolev/tmuxline.vim'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'dag/vim-fish'
    "Plugin 'kien/ctrlp.vim'
    Plugin 'edkolev/promptline.vim'
    "Plugin 'scrooloose/nerdtree'
    "Plugin 'scrooloose/syntastic'
    Plugin 'jceb/vim-orgmode'
    Plugin 'reedes/vim-wordy'
    Plugin 'tpope/vim-speeddating'
    " On OS X, Exuberant CTags must be installed:
    " brew install ctags-exuberant
    "Plugin 'majutsushi/tagbar'
    Plugin 'airblade/vim-gitgutter'
    "Plugin 'tpope/vim-surround'
    Plugin 'nsf/gocode', {'rtp': 'vim/'}
    if !filereadable(expand('~/.custom_ycm'))
      Plugin 'Valloric/YouCompleteMe'
    endif
    "Plugin 'vim-scripts/DrawIt'
    Plugin 'vim-scripts/SyntaxRange'
    Plugin 'luochen1990/rainbow'
    Plugin 'unblevable/quick-scope'
    Plugin 'tmux-plugins/vim-tmux-focus-events'
    "Plugin 'junegunn/goyo.vim'
    "Plugin 'amix/vim-zenroom2'
  " }
" }

" Finish Bundle Setup {
  call vundle#end()
  filetype plugin indent on
" }
