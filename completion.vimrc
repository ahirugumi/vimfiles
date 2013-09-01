"=========================================================================================
" 入力補完
"=========================================================================================
set wildchar=<tab>         " タブでコマンド補完開始
set history=1000           " 補完履歴を1000にする
set complete+=k            " 辞書ファイルも補完対象にする
set wildmenu               " コマンド補完を拡張
set wildmode=list:full     " リスト表示，最長マッチ
" ワイルドカード指定時に優先順位を低くする
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
