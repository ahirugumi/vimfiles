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
  " " vimproc(vimshellで必要)
  " NeoBundle 'Shougo/vimproc', {
  "     \ 'build' : {
  "     \     'mac' : 'make -f make_mac.mak',
  "     \     'linux' : 'make',
  "     \    },
  "     \ }

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
  NeoBundle 'nathanaelkane/vim-indent-guides'
" ]]]

" Git [[[
  " gitプラグイン
  NeoBundle 'tpope/vim-fugitive'

  " コミット差異を表示
  NeoBundle 'airblade/vim-gitgutter'

" ]]]

" Unite [[[
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'tsukkee/unite-help'
  NeoBundle 'tsukkee/unite-tag'
  NeoBundle 'h1mesuke/unite-outline'
  NeoBundle 'ujihisa/unite-font'
  NeoBundle 'tacroe/unite-mark'
  NeoBundle 'thinca/vim-unite-history'
  NeoBundle 'ujihisa/unite-launch'
  NeoBundle 'sgur/unite-qf'
  NeoBundle 'Shougo/neomru.vim'
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
call neobundle#end()
filetype plugin indent on
