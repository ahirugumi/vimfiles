" git protocol
if has('win32') || has("unix")
  let g:neobundle#types#git#default_protocol = 'https'
else
  let g:neobundle#types#git#default_protocol = 'git'
endif

" エンコード設定
source ~/vimfiles/encode.vimrc
" plugin読み込み
source ~/vimfiles/bundle.vimrc
" 基本設定
source ~/vimfiles/basic.vimrc
" 表示設定
source ~/vimfiles/display.vimrc
" 編集設定
source ~/vimfiles/edit.vimrc
" インデント設定
source ~/vimfiles/indent.vimrc
" 移動設定
source ~/vimfiles/move.vimrc
" 検索設定
source ~/vimfiles/search.vimrc
" プラグイン設定
source ~/vimfiles/plugin.vimrc
" 入力補完設定
source ~/vimfiles/completion.vimrc
" その他の設定
source ~/vimfiles/misc.vimrc
