"=========================================================================================
" プラグイン読み込み設定
"=========================================================================================
filetype off

if has('vim_starting')
  set runtimepath+=~/vimfiles/bundle/neobundle.vim
  " call neobundle#rc(expand('~/vimfiles/bundle/'))
  call neobundle#begin(expand('~/vimfiles/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif

" 入力補完 [[[
  " neocomplcache
  NeoBundle 'Shougo/neocomplcache'

  " neocomplcacheのsinpet補完
  NeoBundle 'Shougo/neosnippet.git'
  NeoBundle "Shougo/neosnippet-snippets.git"

  " snipmate
  NeoBundle 'honza/vim-snippets'
" ]]]

" 移動 [[[
  " <Leader><Leader>w ワードによる移動
  " <Leader><Leader>f 検索して移動
  NeoBundle 'EasyMotion'

  " パーセント「%」キーで対応する括弧へカーソルを移動する
  NeoBundle 'matchit.zip'

  " " matchit拡張のruby用
  " NeoBundle 'ruby-matchit'

  " 日本語単語単位移動強化
  NeoBundle 'deton/jasegment.vim'
" ]]]

" grep [[[
  " grep
  NeoBundle 'grep.vim'

  " grep拡張。いろいろな言語の正規表現が使える
  NeoBundle 'eregex.vim'
" ]]]

" プログラミング [[[
  " プログラムを実行
  NeoBundle 'thinca/vim-quickrun'

  " ヘルプ、リファレンス参照
  NeoBundle 'thinca/vim-ref'

  " tag拡張
  " NeoBundle 'taglist.vim'
  NeoBundle 'majutsushi/tagbar'

  " エラー箇所をハイライト
  NeoBundle 'errormarker.vim'

  " ruby拡張
  NeoBundle 'vim-ruby/vim-ruby'

  " rails拡張
  NeoBundle 'tpope/vim-rails'

  " vimdoc 日本語
  NeoBundle 'yuroyoro/vimdoc_ja'

  " コメントアウト拡張
  NeoBundle 'vim-scripts/tComment.git'

  " Python補完
  NeoBundle 'davidhalter/jedi-vim'

  " " reST用プラグイン
  " NeoBundle 'Rykka/riv.vim'
" ]]]

" シンタックス [[[
  " markdown
  NeoBundle 'tpope/vim-markdown'

  " coffee script
  NeoBundle 'kchmck/vim-coffee-script'

  " JavaScript
  NeoBundle 'JavaScript-syntax'

  " jQuery
  NeoBundle 'jQuery'

  " reST
  NeoBundle 'vim-scripts/rest.vim'
" ]]]

" バッファ [[[
  " " バッファ管理
  " NeoBundle 'minibufexpl.vim'

  " " バッファ管理拡張
  " NeoBundle 'thinca/vim-openbuf'

  " ファイラ
  NeoBundle 'Shougo/vimfiler.git'

  " " ツリーエクスプローラー
  " NeoBundle 'vtreeexplorer'

  " " vimshell
  " NeoBundle 'Shougo/vimshell.git'

  " vimproc(vimshellで必要)
  NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \    },
      \ }

  " ex commond拡張
  NeoBundle 'tyru/vim-altercmd'

  " vimからweb service呼び出し
  NeoBundle 'mattn/webapi-vim'

  " URLを扱うライブラリ
  NeoBundle 'tyru/urilib.vim'
" ]]]

" " Redmine [[[
"   " Redmine on Vim
"   NeoBundle 'mattn/vim-metarw-redmine'
"   NeoBundle 'basyura/rmine.vim'
"
"   " A framework to read/write fake:path
"   NeoBundle 'kana/vim-metarw'
" " ]]]

" 表示 [[[
  " solarized
  NeoBundle 'altercation/vim-colors-solarized'

  " wombat
  NeoBundle 'jeffreyiacono/vim-colors-wombat'

  " ステータスライン拡張
  " NeoBundle 'Lokaltog/vim-powerline'
  NeoBundle 'itchyny/lightline.vim'

  " インデントガイド
  NeoBundle 'nathanaelkane/vim-indent-guides'
" ]]]

" Git [[[
  " gitプラグイン
  NeoBundle 'tpope/vim-fugitive'

  " コミット差異を表示
  NeoBundle 'airblade/vim-gitgutter'

  " カーソルの下の単語をブラウザで開く
  NeoBundle 'tyru/open-browser.vim'
" ]]]

" Unite [[[
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'tsukkee/unite-help'
  NeoBundle 'h1mesuke/unite-outline'
  NeoBundle 'basyura/unite-rails'
  NeoBundle 'thinca/vim-unite-history'
  NeoBundle 'tsukkee/unite-tag'
  NeoBundle 'choplin/unite-vim_hacks'
  NeoBundle 'basyura/unite-yarm'
  NeoBundle 'ujihisa/unite-colorscheme'
  NeoBundle 'Shougo/neomru.vim'
" ]]]

" 整形 [[[
  " マルチバイト対応整形
  NeoBundle 'h1mesuke/vim-alignta'

  " Align
  NeoBundle 'Align'

  " フィルタリングと整形
  NeoBundle 'godlygeek/tabular'

  " DrawIt
  NeoBundle 'vim-scripts/DrawIt'
" ]]]

" 編集 [[[
  " memo
  NeoBundle 'fuenor/qfixhowm.git'

  " テキストを括弧で囲む／削除する
  NeoBundle 'tpope/vim-surround'

  " ヤンク拡張
  NeoBundle 'YankRing.vim'

  " ヤンクしたもので置換する
  NeoBundle 'operator-replace'

  " エンコーディング拡張
  NeoBundle 'banyan/recognize_charcode.vim'

  " +clipboardでコンパイルしていないくてもclipboardが使える
  NeoBundle 'kana/vim-fakeclip'

  " operatorを独自に定義できる
  NeoBundle 'operator-user'

  " camel-caseへ変換
  NeoBundle 'operator-camelize'

  " <C-a>でtrue/falseやok/ngをトグルする
  NeoBundle 'taku-o/vim-toggle'

  " undo履歴を追っかける
  NeoBundle 'Gundo'
" ]]]

" テキストオブジェクト [[[
  " テキストオブジェクトの定義できる
  NeoBundle 'textobj-user'

  " 色々なものをテキストオブジェクトにする
  NeoBundle 'thinca/vim-textobj-plugins.git'

  " 最後に検索されたものをテキストオブジェクトにする
  NeoBundle 'kana/vim-textobj-lastpat.git'

  " インデントされたものをテキストオブジェクトにする
  NeoBundle 'kana/vim-textobj-indent.git'

  " vimの最新当てたらエラーになって使えなくなった。おかしい。
  " " 関数の中身をテキストオブジェクトにする
  " NeoBundle 'kana/vim-textobj-function.git'

  " シンタックスハイライトされた単語をテキストオブジェクトにする
  NeoBundle 'kana/vim-textobj-syntax.git'
" ]]]

filetype plugin indent on
