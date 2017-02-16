"=========================================================================================
" 移動設定
"=========================================================================================
" カーソル自由に移動
set virtualedit+=all

" カーソルを表示行で移動
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
nnoremap <Down> gj
nnoremap <Up>   gk

" 矢印キーをオフ
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" インサートモードでの移動
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 0, 9で行頭、行末へ
nmap 0 ^
nmap 9 $

" insert mode でjjでesc
inoremap jj <Esc>

nnoremap <silent>bp :bprevious<CR> " 前のバッファ
nnoremap <silent>bn :bnext<CR>     " 次のバッファ
nnoremap <silent>bb :b#<CR>        " 直前のバッファ
nnoremap <silent>bf :bf<CR>        " バッファリストの最初のバッファ
nnoremap <silent>bl :bl<CR>        " バッファリストの最後のバッファ
nnoremap <silent>bm :bm<CR>        " 変更中のバッファ
nnoremap <silent>bd :bdelete<CR>   " バッファ削除

" 最後に編集された位置に移動
nnoremap gb '.

" 対応する括弧に移動
nnoremap ( %
nnoremap ) %

" カーソル位置の単語をヤンク
nnoremap vy vawy

" ビジュアルモード時vで行末まで選択
vnoremap v $h

" 検索後、見やすいようにヒットした文字列を真ん中に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" " shift-矢印でウィンドウ移動
" noremap <S-Left> <C-w>h
" noremap <S-Right> <C-w>l
" noremap <S-Up> <C-w>k
" noremap <S-Down> <C-w>j

" 自動的に前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

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
" nnoremap t <Nop>
" ジャンプ
nnoremap tt <C-]>
" 進む
nnoremap tj :" <C-u>tag<CR>
" 戻る
nnoremap tk :<C-u>pop<CR>
" 履歴一覧
nnoremap tl :<C-u>tags<CR>
" タグ作成
nnoremap <C-@> :!ctags -R<CR>
