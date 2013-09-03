"=========================================================================================
" 基本設定
"=========================================================================================
let mapleader = ","              " キーマップリーダー
set ambiwidth=double             " 全角の記号とかあってもカーソルがズレないようにする。+multi_byteでコンパイルされていないと動作しない。
set textwidth=0                  " 自動折り返ししない
set scrolloff=5                  " 余白確保
set nobackup                     " バックアップなし
set noswapfile                   " スワップなし
set autoread                     " 開いているファイルが書き換えられたら自動的に開き直す
set hidden                       " 編集中でもファイルを開けるようにする
set backspace=indent,eol,start   " バックスペースで色々消せる用にする
set formatoptions=lmoq           " 自動整形ON
set vb t_vb=                     " ビープをならさない
set whichwrap=b,s,h,l,<,>,[,]    " カーソルが行の一番最後で止まらないようにする
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set modelines=0                  " モードラインは無効
set browsedir=buffer             " Exploreの初期ディレクトリをバッファと同じにする

" OSのクリップボードを使用する。
" vimが+clipboardでコンパイルされていないと利用できない。
set clipboard+=unnamed
"--------for linux-----------
"set clipboard=unnamedplus
"----------------------------
" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

imap <C-v> <ESC>"*pa " 挿入モードでCtrl+vを押すとクリップボードの内容を貼り付けられるようにする

""===========for linux====================
"" PythonによるIBus制御指定
"let IM_CtrlBusPython = 1
""au InsertLeave * call PyIBusDisable()
"
""" PythonでIMのオフ
"function! PyIBusDisable()
""python << EOF
"import ibus
""bus = ibus.Bus()
"ic = ibus.InputContext(bus, bus.current_input_contxt())
""ic.disable()
"EOF
""endfunction

"" <ESC>押下後のIM切替開始までの反応が遅い場合はttimeoutlenを短く設定してみてください。
"set timeout timeoutlen=3000 ttimeoutlen=100
""=====================================================

" vimrc, gvimrcの修正
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>

" ヘルプファイル
set helpfile=$VIMRUNTIME/doc/help.txt

" ファイルタイプ判定をon
filetype plugin on

"-------------------------------------------------------------------------------
" タグ関連 Tags
"-------------------------------------------------------------------------------
" タグセット
if has("autochdir")
  set autochdir  " 編集中のファイルのディレクトリに移動
  set tags=tags;
else
  set tags=./tags,./../tags,./*/tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags
endif

"tags-and-searchesを使い易くする
nnoremap t <Nop>
nnoremap tt <C-]>  " ジャンプ
nnoremap tj;<C-u>tag<CR>  " 進む
nnoremap tk;<C-u>pop<CR>  " 戻る
nnoremap tl;<C-u>tags<CR> " 履歴一覧

" bug??
set notagbsearch
