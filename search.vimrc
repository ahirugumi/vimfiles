"=========================================================================================
" 検索設定
"=========================================================================================
set ignorecase " 検索するとき大文字小文字を無視
set wrapscan   " 最後まで検索したら一番最初に戻る
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト

" バックスラッシュやクエスチョンをうまいこと合わせてエスケープする
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" ハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>
" Ctrl-hでヘルプ
nnoremap <C-h>      :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>
" " :Gb <args> でバッファをGrepする
" command! -nargs=1 Gb :GrepBuffer <args>
" " カーソル下の単語をGrepBufferする
" nnoremap <C-g><C-b> :<C-u>GrepBuffer<Space><C-r><C-w><Enter>
" " :Gr <args>でカレントディレクトリ以下を再帰的にgrepする
" command! -nargs=1 Gr :Rgrep <args> *<Enter><CR>
" " カーソル下の単語をgrepする
" nnoremap <silent> <C-g><C-r> :<C-u>Rgrep<Space><C-r><C-w> *<Enter><CR>
