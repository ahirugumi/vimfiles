"-------------------------------------------------------------------------------
"" 基本設定 Basics
"-------------------------------------------------------------------------------
let mapleader = ","              " キーマップリーダー
set scrolloff=5                  " スクロール時の余白確保
set textwidth=0                  "一行に長い文章を書いていても自動折り返しをしない
set nobackup                     " バックアップ取らない
set autoread                     " 他で書き換えられたら自動で読み直す
set noswapfile                   " スワップファイル作らない
set hidden                       " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start   " バックスペースでなんでも消せるように
set formatoptions=lmoq           "テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                     " ビープをならさない
set browsedir=buffer             " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set modelines=0                  " モードラインは無効
set ambiwidth=double             " □や○の文字があってもカーソル位置がずれないようにする

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

"OSのクリップボードを使用する
set clipboard+=unnamed
"--------for linux-----------
"set clipboard=unnamedplus
"----------------------------
" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2
" 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする "
imap <C-v>  <ESC>"*pa

" vimrc, gvimrcの修正
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>

set helpfile=$VIMRUNTIME/doc/help.txt

" ファイルタイプ判定をon
filetype plugin on

"-------------------------------------------------------------------------------
" タグ関連 Tags
"-------------------------------------------------------------------------------
" set tags
if has("autochdir")
  " 編集しているファイルのディレクトリに自動で移動
  set autochdir
  set tags=tags;
else
  set tags=./tags,./../tags,./*/tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags
endif

set notagbsearch

"<C-t>はscreentとかぶるので削除
"tab pagesを使い易くする
" nnoremap <C-t>  <Nop>
" nnoremap <C-t>n  ;<C-u>tabnew<CR>
" nnoremap <C-t>c  ;<C-u>tabclose<CR>
" nnoremap <C-t>o  ;<C-u>tabonly<CR>
" nnoremap <C-t>j  ;<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
" nnoremap <C-t>k  gT

"tags-and-searchesを使い易くする
nnoremap t  <Nop>
"「飛ぶ」
nnoremap tt  <C-]>
"「進む」
nnoremap tj  ;<C-u>tag<CR>
"「戻る」
nnoremap tk  ;<C-u>pop<CR>
"履歴一覧
nnoremap tl  ;<C-u>tags<CR>

