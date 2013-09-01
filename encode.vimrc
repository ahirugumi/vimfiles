"=========================================================================================
" エンコーディング設定
"=========================================================================================
set ffs=unix,dos,mac  " 改行文字
"-------for linux and mac---------
set encoding=utf-8    " デフォルトエンコーディング
"-------------------------
"set encoding=cp932    " デフォルトエンコーディング

" 以下、全て強制的にUTF-8
autocmd FileType js :set fileencoding=utf-8
autocmd FileType css :set fileencoding=utf-8
autocmd FileType html :set fileencoding=utf-8
autocmd FileType xml :set fileencoding=utf-8
autocmd FileType java :set fileencoding=utf-8
autocmd FileType svn :set fileencoding=utf-8

" 文字コードを指定して開く
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932
