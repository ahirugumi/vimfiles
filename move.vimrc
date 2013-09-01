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

" インサートモードでの移動
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 0, 9で行頭、行末へ
nmap 1 0
nmap 0 ^
nmap 9 $

" insert mode でjjでesc
inoremap jj <Esc>

" F2で前バッファ
map <F2> <ESC>;bp<CR>
" F3で次バッファ
map <F3> <ESC>;bn<CR>
" F4でバッファ削除
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

