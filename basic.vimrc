"=========================================================================================
" 基本設定
"=========================================================================================
let mapleader = ","              " キーマップリーダー
set ambiwidth=double             " 全角の記号とかあってもカーソルがズレないようにする。+multi_byteでコンパイルされていないと動作しない。
set textwidth=0                  " 自動折り返ししない
set colorcolumn=80               " 80文字にライン
set scrolloff=5                  " 余白確保
" バックアップなし
set nowritebackup
set nobackup
set noswapfile                   " スワップなし
set autoread                     " 開いているファイルが書き換えられたら自動的に開き直す
set hidden                       " 編集中でもファイルを開けるようにする
set switchbuf=useopen            " 新しく開く代わりにすでに開いてあるバッファを開く
set backspace=indent,eol,start   " バックスペースで色々消せる用にする
set formatoptions=lmoq           " 自動整形ON
" ビープをならさない
set vb t_vb=
set novisualbell
set whichwrap=b,s,h,l,<,>,[,]    " カーソルが行の一番最後で止まらないようにする
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set modelines=0                  " モードラインは無効
set browsedir=buffer             " Exploreの初期ディレクトリをバッファと同じにする
set t_ut=                        "
set t_Co=256

" OSのクリップボードを使用する。
" vimが+clipboardでコンパイルされていないと利用できない。
" if has('unnamedplus')
"   set clipboard+=unnamedplus, unnamed
" else
"   set clipboard+=unnamed
" endif

if has ('mac')
  set clipboard+=unnamed
elseif has('unix')
  set clipboard=unnamedplus
else
  set clipboard+=unnamed
endif

" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

imap <C-v> <ESC>"*pa " 挿入モードでCtrl+vを押すとクリップボードの内容を貼り付けられるようにする

""===========for linux IMEがオフにならないケースがあったのでテスト的にいれた。======================
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
""==================================================================================================

" vimrc, gvimrcの修正
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>

" ヘルプファイル
set helpfile=$VIMRUNTIME/doc/help.txt

" パス
set path+=$HOME/mywork

" ファイルタイプ判定をon
filetype plugin on

" bug??
set notagbsearch
