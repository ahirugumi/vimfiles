"=========================================================================================
" 編集設定
"=========================================================================================
set noimdisable            " ノーマルモードでIMEをオフ
set iminsert=0 imsearch=0  " これもノーマルモードと検索モードでIMEをオフ
set noimcmdline            " コマンドラインでIMEオフ
set infercase              " 補完するときに大文字小文字を区別しない

inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" Tabキーを空白に変換
set expandtab
" <C-t>で改行
nnoremap <C-t> :<C-u>call append(expand('.'), '')<Cr>j
" yeでカーソル位置にある単語をレジスタに追加
nmap ye ;let @"=expand("<cword>")<CR>
" コンマの後に自動的にスペースを挿入
inoremap , ,<Space>
" " インサートモード時のUNDO
" inoremap <C-u> <C-g>u<C-u>
" inoremap <C-w> <C-g>u<C-w>
" インサートモード時のペーストを<C-v>でする
inoremap <C-v> <ESC>:<C-U>YRPaste 'p'<CR>i
" Yで行末までヤンク
nmap y9 y$
" y0で行頭までヤンク
nmap y0 y^
" カーソルから行頭まで削除
nnoremap <silent> <C-d> d0
" カーソルから行頭まで削除(インサートモード)
inoremap <silent> <C-b> <Esc>lc$
" カーソルから行末まで削除(インサートモード)
inoremap <silent> <C-d> <Esc>lc^
" 保存時に行末の空白を除去する（条件付き）
" autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufWritePre * call s:strip_trailing_whitespace()
function! s:strip_trailing_whitespace()
  let position = getpos('.')
  if &ft =~ 'python\|haskell\|coffee\|haml'
    %s/\S\zs\s\+$//e
  elseif &ft =~ 'markdown'
    %s/^\s\+$//e
  else
    %s/\s\+$//e
  endif
  call setpos('.', position)
endfunction
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge
" quickfixウィンドウではq/ESCで閉じる
autocmd FileType qf nnoremap <buffer> q :ccl<CR>
autocmd FileType qf nnoremap <buffer> <ESC> :ccl<CR>
" XMLの閉タグを自動挿入
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END
" 日時の自動入力
inoremap <expr> ,df strftime('%Y-%m-%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M:%S')
" sudoコマンド
cmap w!! w !sudo tee > /dev/null %
" ペーストした際にインデントしないよう切り替える
set pastetoggle=<F5>
" 初期は、ペーストモードオフ
set nopaste
