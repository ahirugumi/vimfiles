"=========================================================================================
" 各プラグインの設定
"=========================================================================================
""
""


" +++++++++++++++++++++++ 入力補完 +++++++++++++++++++++++
"------------------------------------
" neocomplecache.vim
"------------------------------------
" AutoComplPopを無効にする
let g:acp_enableAtStartup = 0
" NeoComplCacheを有効にする
let g:neocomplcache_enable_at_startup = 1
" 補完が自動で開始される文字数
let g:neocomplcache_auto_completion_start_length = 3
" smarrt case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplcache_enable_camel_case_completion = 1
" _(アンダーバー)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplcache_min_syntax_length = 3
" neocomplcacheを自動的にロックするバッファ名のパターン
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" -入力による候補番号の表示
let g:neocomplcache_enable_quick_match = 1
" 補完候補の一番先頭を選択状態にする(AutoComplPopと似た動作)
" let g:neocomplcache_enable_auto_select = 1
"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplcache_max_list = 20

autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#popup_select_first=0
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

" let g:neocomplete#force_omni_input_patterns.python = '\%([^\t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'java' : $HOME.'/vimfiles/dict/java.dict',
    \ 'c' : $HOME.'/vimfiles/dict/c.dict',
    \ 'cpp' : $HOME.'/vimfiles/dict/cpp.dict',
    \ 'javascript' : $HOME.'/vimfiles/dict/javascript.dict',
    \ 'perl' : $HOME.'/vimfiles/dict/perl.dict',
    \ 'php' : $HOME.'/vimfiles/dict/php.dict',
    \ 'vm' : $HOME.'/vimfiles/dict/vim.dict'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" ユーザー定義スニペット保存ディレクトリ
let g:neocomplcache_snippets_dir = $HOME.'/vimfiles/snippets'

" スニペット
imap <C-y> <Plug>(neosnippet_expand_or_jump)
smap <C-y> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" snipet template dirs
let g:neosnippet#snippets_directory = '~/vimfiles/bundle/vim-snippets/snippets, ~/vimfiles/snippets/'

" 補完を選択しpopupを閉じる
" inoremap <expr><C-y> neocomplcache#close_popup()
" 補完をキャンセルしpopupを閉じる
" inoremap <expr><C-e> neocomplcache#cancel_popup()
" TABで補完できるようにする
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" undo
inoremap <expr><C-g> neocomplcache#undo_completion()
" 補完候補の共通部分までを補完する
inoremap <expr><C-s> neocomplcache#complete_common_string()
" C-kを押すと行末まで削除
" inoremap <C-k> <C-o>D
" C-nでneocomplcache補完
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
" C-pでkeyword補完
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
" 補完候補が出ていたら確定、なければ改行
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "<CR>"

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-x><C-o> &filetype == 'vim' ? "\<C-x><C-v><C-p>" : neocomplcache#manual_omni_complete()

" buffer開いたらneoconでcache
autocmd BufReadPost,BufEnter,BufWritePost :NeoComplCacheCachingBuffer <buffer>

" FileType毎のOmni補完を設定
autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c          setlocal omnifunc=ccomplete#Complete
autocmd FileType ruby       setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" autocmd FileType ruby let g:neocomplcache_source_disable = {
  " \ 'include_complete' : 1,
  " \ 'omni_complete' : 1
" \ }
" autocmd FileType ruby let g:neocomplcache_source_disable = {
  " \ 'include_complete' : 1
" \ }

"インクルードパスの指定
let g:neocomplcache_include_paths = {
  \ 'cpp'  : '.,/opt/local/include/gcc46/c++,/opt/local/include,/usr/include',
  \ 'c'    : '.,/usr/include',
  \ 'ruby' : '.,$HOME/.rvm/rubies/**/lib/ruby/1.8/',
  \ }
"インクルード文のパターンを指定
let g:neocomplcache_include_patterns = {
  \ 'cpp' : '^\s*#\s*include',
  \ 'ruby' : '^\s*require',
  \ 'perl' : '^\s*use',
  \ }
"インクルード先のファイル名の解析パターン
let g:neocomplcache_include_exprs = {
  \ 'ruby' : substitute(v:fname,'::','/','g')
  \ }
" ファイルを探す際に、この値を末尾に追加したファイルも探す。
let g:neocomplcache_include_suffixes = {
  \ 'ruby' : '.rb',
  \ }

" +++++++++++++++++++++++ 移動 +++++++++++++++++++++++
"------------------------------------
" open-blowser.vim
"------------------------------------
" カーソル下のURLをブラウザで開く
nmap <Leader>fu <Plug>(openbrowser-open)
vmap <Leader>fu <Plug>(openbrowser-open)
" カーソル下のキーワードをググる
nnoremap <Leader>fs :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

" +++++++++++++++++++++++ プログラミング +++++++++++++++++++++++
"------------------------------------
" quickrun.vim
"------------------------------------
"<C-r>でquickrun実行
silent! map <unique> <Leader>rr <Plug>(quickrun)
let g:quickrun_config = {}
let g:quickrun_config._ = {'runner' : 'vimproc', 'outputter/buffer/split' : ':botright 12sp', "outputter/buffer/into" : 1}
" let g:quickrun_config._ = {'runner' : 'vimproc'}
" let g:quickrun_config['rspec/bundle'] = {
"   \ 'type': 'rspec/bundle',
"   \ 'command': "rspec",
"   \ 'cmdopt': "-l %{line('.')}",
"   \ 'exec': "bundle exec %c %o %s ",
"   \ 'filetype': 'rspec-result'
"   \}
" let g:quickrun_config['rspec/normal'] = {
"   \ 'type': 'rspec/normal',
"   \ 'command': "rspec",
"   \ 'cmdopt': "-l %{line('.')}",
"   \ 'exec': '%c %o %s',
"   \ 'filetype': 'rspec-result'
"   \}
" function! RSpecQuickrun()
"   let b:quickrun_config = {'type' : 'rspec/bundle'}
" endfunction
" autocmd BufReadPost *_spec.rb call RSpecQuickrun()

"------------------------------------
" Tagbar.vim
"------------------------------------
nmap <Leader>t :TagbarToggle<CR>

" +++++++++++++++++++++++ シンタックス +++++++++++++++++++++++

" +++++++++++++++++++++++ バッファ +++++++++++++++++++++++
"------------------------------------
" vimfiler.vim
"------------------------------------
" デフォルトのファイラをvimfilerにする
let g:vimfiler_as_default_explorer = 1
" vimfiler起動
nnoremap <silent> vf :VimFilerBufferDir -buffer-name=explorer -split -winwidth=35 -simple -toggle -no-quit<CR>

" "------------------------------------
" " vimshell
" "------------------------------------
" " vimshell起動
" nnoremap <silent> vs :VimShell<CR>
" let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
" let g:vimshell_enable_smart_case = 1
" autocmd FileType vimshell
" \ call vimshell#altercmd#define('ll', 'ls -al')
" \| call vimshell#altercmd#define('l', 'll')

" +++++++++++++++++++++++ 表示 +++++++++++++++++++++++
"------------------------------------
" lightline.vim
"------------------------------------
" vim-gitgutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'

" lightline.vim
let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [
        \     ['mode', 'paste'],
        \     ['fugitive', 'gitgutter', 'filename'],
        \   ],
        \   'right': [
        \     ['lineinfo', 'syntastic'],
        \     ['percent'],
        \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
        \   ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'syntastic': 'SyntasticStatuslineFlag',
        \   'charcode': 'MyCharCode',
        \   'gitgutter': 'MyGitGutter'
        \ },
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction

"------------------------------------
" vim-indent-guides
"------------------------------------
let g:indentLine_fileTypeExclude = ['help', 'tagbar', 'unite']

" +++++++++++++++++++++++ Git +++++++++++++++++++++++
"------------------------------------
" Fugitive.vim
"------------------------------------
nnoremap <Space>gd :<C-u>Gdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :<C-u>Glog<Enter>
nnoremap <Space>ga :<C-u>Gwrite<Enter>
nnoremap <Space>gc :<C-u>Gcommit<Enter>
nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>

"------------------------------------
" Gitgutter.vim
"------------------------------------
if has('win32')
  let g:gitgutter_realtime = 0
  let g:gitgutter_eager = 0
  let g:gitgutter_enabled = 0
endif
" GGでGitGutterを有効/無効
command! GG :GitGutterToggle

" +++++++++++++++++++++++ Unite +++++++++++++++++++++++
"------------------------------------
" unite.vim
"------------------------------------
" The prefix key.
nnoremap [unite] <Nop>
nmap <space><space> [unite]

" 常用セット
nnoremap <silent> [unite]u  :<C-u>Unite -no-split buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> [unite]a  :<C-u>UniteWithBufferDir -no-split -buffer-name=files buffer file_mru bookmark file<CR>
" ファイル一覧
nnoremap <silent> [unite]f  :<C-u>Unite -no-split -buffer-name=files file<CR>
" バッファ一覧
nnoremap <silent> [unite]b  :<C-u>Unite -no-split buffer<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]m  :<C-u>Unite -no-split file_mru<CR>
" 現在のバッファのカレントディレクトリからファイル一覧
nnoremap <silent> [unite]d  :<C-u>UniteWithBufferDir -no-split file<CR>
" レジスタの一覧
nnoremap <silent> [unite]r  :<C-u>Unite register<CR>
" アウトライン
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
" タブ
nnoremap <silent> [unite]t  :<C-u>Unite tab<CR>
" ウィンドウ
nnoremap <silent> [unite]w  :<C-u>Unite window<CR>
" ブックマーク
nnoremap <silent> [unite]c  :<C-u>Unite bookmark<CR>
" ヘルプ
nnoremap <silent> [unite]h  :<C-u>UniteWithCursorWord help<CR>
" Quickfix
nnoremap <silent> [unite]q  :<C-u>Unite qf<CR>
" マーク
nnoremap <silent> [unite]k  :<C-u>Unite mark<CR>
" history command
nnoremap <silent> [unite]hc  :<C-u>Unite history/command<CR>
" history search
nnoremap <silent> [unite]hs  :<C-u>Unite history/search<CR>

let g:yankring_zap_keys = ""

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  " ESCキーを2回押すと終了する
  nmap <buffer> <ESC>      <Plug>(unite_exit)
  nmap <buffer> <ESC><ESC> <Plug>(unite_exit)
  imap <buffer> jj      <Plug>(unite_insert_leave)
  nnoremap <silent><buffer> <C-k> :<C-u>call unite#mappings#do_action('preview')<CR>
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
  " Start insert.
  let g:unite_enable_start_insert = 1

  " ウィンドウを分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')

  " ウィンドウを縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
endfunction"}}}

let g:unite_source_file_mru_limit = 200

" unite-plugins
cnoremap UH Unite help<Enter>
cnoremap UO Unite outline<Enter>

" +++++++++++++++++++++++ 整形 +++++++++++++++++++++++
"------------------------------------
" Align
"------------------------------------
" Alignを日本語環境で使用するための設定
let g:Align_xstrlen = 3

" +++++++++++++++++++++++ 編集 +++++++++++++++++++++++
"------------------------------------
" fuenor/qfixhowm
"------------------------------------
" qfixhowmをランタイムに追加する
set runtimepath+=~/vimfiles/bundle/qfixhowm
" qfixhowmを保存する場所を指定する
let howm_dir = '~/howm'
" キーマップリーダー
let QFixHowm_Key = 'g'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
" qfix_memoファイルタイプ
let QFixHowm_FileType = 'markdown'
" qfix_memoの拡張子
let QFixHowm_FileExt  = 'txt'
" , yで全ての予定を表示
let QFixHowm_ListReminder_ScheExt = '[-@+!~.]'
" メモのファイルタイプ
let QFixHowm_Title    = '#'
"Quickfixウィンドウから開いた後ウィンドウを閉じる
let QFix_CloseOnJump = 1
" カーソル位置にあるエントリーのみ日付が更新される
let QFixHowm_RecentMode = 2
" 新規エントリのテンプレート
" %TAG%はQFixHowm_DefaultTagに変換されます。
let QFixHowm_Template = [
  \"# %TAG%",
  \"%DATE%",
  \""
\]
" デフォルトタグ
let QFixHowm_DefaultTag = '[:work]'
"エントリを自動整形する
"2に設定すると、一ファイル複数エントリのエントリ間の空白行も削除する
" 0にすると自動整形無効
let QFixHowm_Autoformat = 1
"行頭にQFixHowm_Titleがある行は全てタイトルとみなして自動整形する
let QFixHowm_Autoformat_TitleMode = 1
"タイムスタンプを自動で付加しない
let QFixHowm_SaveTime = -1
" Vimで開くファイルの正規表現指定
let QFixHowm_OpenVimExtReg = '\.\(txt\|mkd\|wiki\|rd\|vim\|js\|java\|py\|rb\|h\|c\|cpp\|ini\|conf\)$'
" Quickfixウィンドウの高さ
let QFix_Height = 10
" プレビューウィンドウの高さ
let QFix_PreviewHeight = 10
" QuickfixウィンドウをON/OFF
nnoremap <silent> g,s :ToggleQFixWin<CR>
" 分割状態にかかわらず、常に一番下に表示
let QFix_CopenCmd = 'botright'
" 垂直分割した右側に水平表示(プレビューウィンドウ)
let QFix_PreviewOpenCmd = 'vertical rightbelow'
" Quickfixウィンドウの横幅指定
let QFix_Width         = 60
" プレビューウィンドウの横幅指定
let QFix_PreviewWidth  = 60
" QFixHowmのメニュー画面の横幅指定
let QFixHowm_MenuWidth = 60
" アクティブウィンドウの横幅指定
set winwidth=60
" HTMLファイル出力先
let HowmHtml_htmldir = '~/howm/html'
"タイトルは折りたたまない
let QFixHowm_Folding = 2
"チャプタータイトルは折りたたまない
let QFixHowm_FoldingChapterTitle = 1
"ワイルドカードチャプターを使用する
let QFixHowm_WildCardChapter = 1
"チャプターのレベルに応じた折りたたみを設定する
let QFixHowm_FoldingMode = 1
"Markdownを外部コマンド使用でHTML変換
let HowmHtml_ConvertFunc = '<SID>MarkdownStr2HTML'
"HTML変換コマンドは、pacdocを使う
let HowmHtml_ConvertCmd = 'pandoc -f markdown'

"------------------------------------
" YankRing.vim
"------------------------------------
" Yankの履歴参照
nmap ,y :YRShow<CR>

"------------------------------------
" operator-replace.vim
"------------------------------------
" RwなどでYankしてるもので置き換える
map R <Plug>(operator-replace)

"------------------------------------
" operator-surround.vim
"------------------------------------
"saaw'  カーソル上にある単語を'で囲む
"sda(   カーソル上にある()で囲まれた者の()を削除する
"sra('  カーソル上にある(で囲まれたものを'に置換する
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

"------------------------------------
" operator-openbrowser.vim
"------------------------------------
"soiw    カーソル上にある単語をブラウザで検索する
map <silent>so <Plug>(operator-openbrowser)

"------------------------------------
" operator-camelize.vim
"------------------------------------
map <silent>sc <Plug>(operator-camelize)
map <silent>sC <Plug>(operator-decamelize)

"------------------------------------
" operator-replace.vim
"------------------------------------
map <silent>s <Plug>(operator-replace)

"------------------------------------
" gundo.Vim
"------------------------------------
nmap U :<C-u>GundoToggle<CR>
let g:gundo_width = 30
let g:gundo_preview_height = 40
let g:gundo_right = 1

"------------------------------------
" jasegment.Vim
"------------------------------------
" text-object ie, aeを割当
call jasegment#define('knbc_bunsetu', {
   \ 'select-i': 'ie',
   \ 'select-a': 'ae',
   \ })

"------------------------------------
" multiblock
"------------------------------------
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)



