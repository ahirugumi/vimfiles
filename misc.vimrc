"=========================================================================================
" その他設定
"=========================================================================================
" ;でもコマンド入力
" noremap ; :
" コマンドラインでも<C-n> <C-p>出来るようにする
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" " 矢印キーで入力するとA B C Dが入力される問題を解決
" set nocompatible
" imap OA <Up>
" imap OB <Down>
" imap OC <Right>
" imap OD <Left>
" set t_ku=OA
" set t_kd=OB
" set t_kr=OC
" set t_kl=OD
" nnoremap <Esc>A <up>
" nnoremap <Esc>B <down>
" nnoremap <Esc>C <right>
" nnoremap <Esc>D <left>
" inoremap <Esc>A <up>
" inoremap <Esc>B <down>
" inoremap <Esc>C <right>
" inoremap <Esc>D <left>
