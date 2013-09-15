"=========================================================================================
" 移動設定
"=========================================================================================
" ブロック選択で自由に移動
set virtualedit+=block

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

" previous buffer
map <F2> <ESC>:bp<CR>
" next buffer
map <F3> <ESC>:bn<CR>
" buffer delete
map <F4> <ESC>:bnext \| bdelete #<CR>
command! Bw :bnext \| bdelete #

"<space>jで次の画面。<space>kで前の画面。
noremap <Space>j <C-f>
noremap <Space>k <C-b>

" 最後に編集された位置に移動
nnoremap gb '[
nnoremap gn ']

" 対応する括弧に移動
nnoremap ( %
nnoremap ) %

" カーソル位置の単語をヤンク
nnoremap vy vawy

" ビジュアルモード時vで行末まで選択
vnoremap v $h

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

