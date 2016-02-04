"=========================================================================================
" プラグイン読み込み設定
"=========================================================================================
filetype off

if has('vim_starting')
  set runtimepath+=~/vimfiles/bundle/neobundle.vim
  " call neobundle#rc(expand('~/vimfiles/bundle/'))
endif

call neobundle#begin(expand('~/vimfiles/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" 入力補完 [[[
  " neocomplcache
  NeoBundle 'Shougo/neocomplcache'

  " neocomplcacheのsinpet補完
  NeoBundle 'Shougo/neosnippet.git'
  NeoBundle "Shougo/neosnippet-snippets.git"

  " snipmate
  NeoBundle 'honza/vim-snippets'

  " auto-pairs
  NeoBundle 'jiangmiao/auto-pairs'
" ]]]

" 移動 [[[
  " <Leader><Leader>w ワードによる移動
  " <Leader><Leader>f 検索して移動
  NeoBundle 'EasyMotion'

  " 日本語単語単位移動強化
  NeoBundle 'deton/jasegment.vim'
" ]]]

" プログラミング [[[
  " プログラムを実行
  NeoBundle 'thinca/vim-quickrun'

  " tag拡張
  NeoBundle 'majutsushi/tagbar'

  " ruby拡張
  NeoBundle 'vim-ruby/vim-ruby'

  " vimdoc 日本語
  NeoBundle 'yuroyoro/vimdoc_ja'

  " コメントアウト拡張
  NeoBundle 'vim-scripts/tComment.git'

  " Python補完
  NeoBundle 'davidhalter/jedi-vim'

  " Pythonインデント拡張
  NeoBundle 'hynek/vim-python-pep8-indent'

" ]]]

" シンタックス [[[
  " markdown
  NeoBundle 'tpope/vim-markdown'

  " JavaScript
  NeoBundle 'JavaScript-syntax'

  " jQuery
  NeoBundle 'jQuery'

  " reST
  NeoBundle 'vim-scripts/rest.vim'
" ]]]

" バッファ [[[

  " ファイラ
  NeoBundle 'Shougo/vimfiler.git'

  " " vimshell
  " NeoBundle 'Shougo/vimshell.git'
  "
  " vimproc(vimshellで必要)
  NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'linux' : 'make',
      \    },
      \ }

  " vimからweb service呼び出し
  NeoBundle 'mattn/webapi-vim'

  " URLを扱うライブラリ
  NeoBundle 'tyru/urilib.vim'

" ]]]

" 表示 [[[
  " カーソルの下の単語をブラウザで開く
  NeoBundle 'tyru/open-browser.vim'

  " solarized
  NeoBundle 'altercation/vim-colors-solarized'

  " ステータスライン拡張
  " NeoBundle 'Lokaltog/vim-powerline'
  NeoBundle 'itchyny/lightline.vim'

  " インデントガイド
  " NeoBundle 'nathanaelkane/vim-indent-guides'
  NeoBundle 'Yggdroot/indentLine'
" ]]]

" Git [[[
  " gitプラグイン
  NeoBundle 'tpope/vim-fugitive'

  " コミット差異を表示
  NeoBundle 'airblade/vim-gitgutter'

" ]]]

" Unite [[[
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/unite-help'
  NeoBundle 'tsukkee/unite-tag'
  NeoBundle 'Shougo/unite-outline'
  NeoBundle 'tacroe/unite-mark'
  NeoBundle 'thinca/vim-unite-history'
  NeoBundle 'ujihisa/unite-launch'
  NeoBundle 'sgur/unite-qf'
  NeoBundle 'Shougo/neomru.vim'
" ]]]

" operator [[[
  " operatorを独自に定義できる
  NeoBundle 'operator-user'

  " コメント/アンコメント
  NeoBundle 'emonkak/vim-operator-comment'

  " 選択したオブジェクトをソートする
  NeoBundle 'emonkak/vim-operator-sort'

  " ヤンクしたもので置換する
  NeoBundle 'operator-replace'

  " surroundのoperator版
  NeoBundle 'rhysd/vim-operator-surround'

  " 選択したものを検索する
  NeoBundle 'sgur/vim-operator-openbrowser'

  " camel-caseへ変換
  NeoBundle 'operator-camelize'

" ]]]

" 整形 [[[
  " マルチバイト対応整形
  NeoBundle 'h1mesuke/vim-alignta'

  " Align
  NeoBundle 'Align'

" ]]]

" 編集 [[[
  " memo
  NeoBundle 'fuenor/qfixhowm.git'

  " テキストを括弧で囲む／削除する
  "NeoBundle 'tpope/vim-surround'

  " ヤンク拡張
  NeoBundle 'YankRing.vim'

  " エンコーディング拡張
  NeoBundle 'banyan/recognize_charcode.vim'

  " +clipboardでコンパイルしていないくてもclipboardが使える
  NeoBundle 'kana/vim-fakeclip'

  " undo履歴を追っかける
  NeoBundle 'Gundo'
" ]]]

" テキストオブジェクト [[[
  " 色々なものをテキストオブジェクトにする
  NeoBundle 'thinca/vim-textobj-plugins.git'

  " テキストオブジェクトの定義できる
  NeoBundle 'kana/vim-textobj-user'

  " カーソル行 al, li
  NeoBundle 'kana/vim-textobj-line'

 " シンタックスハイライトされた単語をテキストオブジェクトにする ay, iy
 NeoBundle 'kana/vim-textobj-syntax'

 " インデントされたものをテキストオブジェクトにする
 NeoBundle 'kana/vim-textobj-indent.git'

  " 日付と時刻 ada, ida
  NeoBundle 'kana/vim-textobj-datetime'

  " 任意の区切り文字の間 af, if
  NeoBundle 'thinca/vim-textobj-between'

  " コメント ac, ic
  NeoBundle 'thinca/vim-textobj-comment'

  " ASCII文字とマルチバイト文字の境界を区切り(日本語の中の英語) am, im
  NeoBundle 'deton/textobj-mbboundary.vim'

  " 日本語に対応している WORD am, im
  NeoBundle 'deton/textobj-nonblankchars.vim'

  " URL au, iu
  NeoBundle 'mattn/vim-textobj-url'

  "  連続したスペース aS, iS
  NeoBundle 'saihoooooooo/vim-textobj-space'

  " 関数の引数 a, , i,
  NeoBundle 'sgur/vim-textobj-parameter'

  " 任意の複数の括弧のいずれか asb, isb
  NeoBundle 'osyo-manga/vim-textobj-multiblock'

  " インデントの空白行 ao, io
  NeoBundle 'glts/vim-textobj-indblock'

  " Rubyのブロック arr, irr
  " NeoBundle 'rhysd/vim-textobj-ruby'

  " Python af, if
  " NeoBundle 'bps/vim-textobj-python'

" ]]]
call neobundle#end()
filetype plugin indent on
