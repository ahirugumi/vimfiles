"=========================================================================================
" 表示設定
"=========================================================================================

" カラースキーマ
" colorscheme wombat
colorschem solarized
set background=light

" ターミナルタイプによるカラー設定
" UbuntuのGnome端末は、xtermを返してくる。環境変数にxterm-256colorとかをちゃん
" とセットしてあげると正しく認識するはず
if &term =~ "xterm" || "xterm-256color" || "screen-256color"
  " 256色
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" ハイライト on
syntax enable
" 補完候補の選択色
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

" vimdiffの設定
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7
"-------------------------------------------------------------------------------
" ステータスライン StatusLine
"-------------------------------------------------------------------------------
set laststatus=2 " ステータスラインは、２行
set ruler  " カーソル位置表示

" 自動的に QuickFix リストを表示する
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
autocmd QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin

"-------------------------------------------------------------------------------
" 表示 Apperance
"-------------------------------------------------------------------------------
set number            " 行番号の表示
set list              " 不可視文字表示
set showmatch         " 括弧をハイライト
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set display=uhex      " 印字不可能文字を16進数で表示
set title       " タイトルを表示
set lazyredraw  " コマンド実行中再描画しない
set ttyfast     " 高速ターミナル接続
set cursorline  " カーソル行をハイライトする

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" カーソル行の設定
hi clear CursorLine
hi CursorLine gui=underline
" highlight CursorLine ctermbg=black guibg=black
highlight CursorLine ctermbg=LightGray guibg=LightGray
