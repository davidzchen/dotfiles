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
    Plugin 'jwalton512/vim-blade'
    Plugin 'davidzchen/vim-opus'
  " }

  " Color schemes {
    Plugin 'chlorophyllin/base16-vim'
    Plugin 'dylanaraps/wal.vim'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'colepeters/spacemacs-theme.vim'
    Plugin 'agreco/vim-citylights'
  " }

  " Tools {
    Plugin 'chlorophyllin/snipmate.vim'
    Plugin 'tpope/vim-dispatch'
    Plugin 'sjl/vitality.vim'
    "Plugin 'tpope/vim-fugitive'
    "Plugin 'adinapoli/vim-markmultiple'
    "Plugin 'sjl/gundo.vim'
    Plugin 'nathanaelkane/vim-indent-guides'
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
    "Plugin 'nsf/gocode', {'rtp': 'vim/'}
    if !filereadable(expand('~/.disable_ycm'))
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

  " Google cdoefmt {
    " Add maktaba and codefmt to the runtimepath.
    " (The latter must be installed before it can be used.)
    Plugin 'google/vim-maktaba'
    Plugin 'google/vim-codefmt'
    " Also add Glaive, which is used to configure codefmt's maktaba flags. See
    " `:help :Glaive` for usage.
    Plugin 'google/vim-glaive'
  " }
" }

" Finish Bundle Setup {
  call vundle#end()
  filetype plugin indent on

  " the glaive#Install() should go after the "call vundle#end()"
  call glaive#Install()
  Glaive codefmt plugin[mappings]
  Glaive codefmt google_java_executable="java -jar /Users/dzc/.dots/bin/google-java-format-1.21.0-all-deps.jar"
  Glaive codefmt clang_format_executable="/opt/homebrew/bin/clang-format"
  Glaive codefmt buildifier_executable="/opt/homebrew/bin/buildifier"

  augroup autoformat_settings
    autocmd FileType bzl AutoFormatBuffer buildifier
    autocmd FileType c,cpp,proto,javascript,typescript,arduino AutoFormatBuffer clang-format
    autocmd FileType python AutoFormatBuffer yapf
    autocmd FileType swift AutoFormatBuffer swift-format
  augroup END
" }
