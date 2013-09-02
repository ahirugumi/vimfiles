"=========================================================================================
" 各プラグインの設定
"=========================================================================================

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
let g:neocomplcache_enable_auto_select = 1
"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplcache_max_list = 20

" Define dictionary.
" -----------------for linux-------------------
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
"-----------------------------------------------

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
let g:neosnippet#snippets_directory = '~/vimfiles/snipmate-snippets/snippets ~/vimfiles/snippets'

" 補完を選択しpopupを閉じる
" inoremap <expr><C-y> neocomplcache#close_popup()
" 補完をキャンセルしpopupを閉じる
" inoremap <expr><C-e> neocomplcache#cancel_popup()
" TABで補完できるようにする
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" undo
inoremap <expr><C-g>     neocomplcache#undo_completion()
" 補完候補の共通部分までを補完する
inoremap <expr><C-s> neocomplcache#complete_common_string()
" C-kを押すと行末まで削除
" inoremap <C-k> <C-o>D
" C-nでneocomplcache補完
inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
" C-pでkeyword補完
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
" 補完候補が出ていたら確定、なければ改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
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

" +++++++++++++++++++++++ Grep +++++++++++++++++++++++
" ------------------------------------
" grep.vim
"------------------------------------
" 検索外のディレクトリ、ファイルパターン
let Grep_Skip_Dirs = '.svn .git .hg'
let Grep_Skip_Files = '*.bak *~'

" +++++++++++++++++++++++ プログラミング +++++++++++++++++++++++
"------------------------------------
" quickrun.vim
"------------------------------------
let g:quickrun_config = {}
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config['rspec/bundle'] = {
  \ 'type': 'rspec/bundle',
  \ 'command': "rspec",
  \ 'cmdopt': "-l %{line('.')}",
  \ 'exec': "bundle exec %c %o %s ",
  \ 'filetype': 'rspec-result'
  \}
let g:quickrun_config['rspec/normal'] = {
  \ 'type': 'rspec/normal',
  \ 'command': "rspec",
  \ 'cmdopt': "-l %{line('.')}",
  \ 'exec': '%c %o %s',
  \ 'filetype': 'rspec-result'
  \}
function! RSpecQuickrun()
  let b:quickrun_config = {'type' : 'rspec/bundle'}
endfunction
autocmd BufReadPost *_spec.rb call RSpecQuickrun()

"------------------------------------
" Pydiction
"------------------------------------
let g:pydiction_location = '~/vimfiles/bundle/pydiction/complete-dict'

"------------------------------------
" taglist.Vim
"------------------------------------
" 関数一覧
set tags=tags
"set tags+=~/.tags
" ------------- for mac ------------------
let Tlist_Ctags_Cmd = '/Applications/MacVim.app/Contents/MacOS/ctags' " ctagsのパス
" ----------------------------------------
let Tlist_Show_One_File = 1               " 現在編集中のソースのタグしか表示しない
let Tlist_Exit_OnlyWindow = 1             " taglistのウィンドーが最後のウィンドーならばVimを閉じる
" let Tlist_Use_Right_Window = 1            " 右側でtaglistのウィンドーを表示
let Tlist_Enable_Fold_Column = 1          " 折りたたみ
let Tlist_Auto_Open = 1                   " 自動表示
let Tlist_Auto_Update = 1
let Tlist_WinWidth = 30
"map <silent> <leader>tl :Tlist<CR>        " taglistを開くショットカットキー
nmap <F7> :CMiniBufExplorer<CR>:TrinityToggleTagList<CR>:TMiniBufExplorer<CR>
nmap <Leader>tl :CMiniBufExplorer<CR>:TrinityToggleTagList<CR>:TMiniBufExplorer<CR>

"------------------------------------
" errormarker.vim
"------------------------------------
" disable default shortcut mapping and re-define to <Leader>ec
let g:errormarker_disablemappings = 1
nmap <silent> <unique> <Leader>ec :ErrorAtCursor<CR>

"------------------------------------
" vim-rails.vim
"------------------------------------
let g:rails_some_option = 1
let g:rails_level = 4
let g:rails_syntax = 1
let g:rails_statusline = 1
let g:rails_url='http://localhost:3000'
let g:rails_subversion=0
" let g:dbext_default_SQLITE_bin = 'mysql2'
let g:rails_default_file='config/database.yml'
" let g:rails_ctags_arguments = ''
function! SetUpRailsSetting()
  nmap <buffer><C-C> <Nop>
  imap <buffer><C-C> <Nop>
  map <buffer><C-_><C-C> <Nop>

  nmap <buffer><Space>r :R<CR>
  nmap <buffer><Space>a :A<CR>
  nmap <buffer><Space>m :Rmodel<Space>
  nmap <buffer><Space>c :Rcontroller<Space>
  nmap <buffer><Space>v :Rview<Space>
  nmap <buffer><Space>s :Rspec<Space>
  nmap <buffer><Space>p :Rpreview<CR>
  nmap <buffer><Space>t :Runittest<CR>
  au FileType ruby,eruby,ruby.rspec let g:neocomplcache_dictionary_filetype_lists = {
        \'ruby' : $HOME.'/vimfiles/dict/rails.dict',
        \'eruby' : $HOME.'/vimfiles/dict/rails.dict'
        \}
  setl dict+=~/vimfiles/dict/rails.dict
  setl dict+=~/vimfiles/dict/ruby.dict
endfunction
autocmd User Rails call SetUpRailsSetting()

" +++++++++++++++++++++++ シンタックス +++++++++++++++++++++++

" +++++++++++++++++++++++ バッファ +++++++++++++++++++++++
"------------------------------------
" MiniBufExplorer
"------------------------------------
"set minibfexp
let g:miniBufExplMapWindowNavVim=1 "hjklで移動
let g:miniBufExplSplitBelow=0  " Put new window above
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1
let g:miniBufExplMaxSize = 10

":MtでMiniBufExplorerの表示トグル
command! Mt :TMiniBufExplorer

"------------------------------------
" vimfiler.vim
"------------------------------------
" デフォルトのファイラをvimfilerにする
let g:vimfiler_as_default_explorer = 1
" vimfiler起動
nnoremap <silent> vf :VimFiler<CR>

"------------------------------------
" VTreeExplorer
"------------------------------------
let g:treeExplVertical=1
"<Leader>t<Space>でディレクトリツリー表示
noremap <Leader>t<Space> :VSTreeExplore<CR>
"分割したウィンドウのサイズ
let g:treeExplWinSize=30

"------------------------------------
" vimshell
"------------------------------------
" vimshell起動
nnoremap <silent> vs :VimShell<CR>
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_right_prompt = 'vimshell#vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
let g:vimshell_enable_smart_case = 1

if has('win32') || has('win64')
  " Display user name on Windows.
  let g:vimshell_prompt = $USERNAME."% "
else
  " Display user name on Linux.
  let g:vimshell_prompt = $USER."% "

  call vimshell#set_execute_file('bmp,jpg,png,gif', 'gexe eog')
  call vimshell#set_execute_file('mp3,m4a,ogg', 'gexe amarok')
  let g:vimshell_execute_file_list['zip'] = 'zipinfo'
  call vimshell#set_execute_file('tgz,gz', 'gzcat')
  call vimshell#set_execute_file('tbz,bz2', 'bzcat')
endif

function! g:my_chpwd(args, context)
  call vimshell#execute('echo "chpwd"')
endfunction
function! g:my_emptycmd(cmdline, context)
  call vimshell#execute('echo "emptycmd"')
  return a:cmdline
endfunction
function! g:my_preprompt(args, context)
  call vimshell#execute('echo "preprompt"')
endfunction
function! g:my_preexec(cmdline, context)
  call vimshell#execute('echo "preexec"')

  if a:cmdline =~# '^\s*diff\>'
    call vimshell#set_syntax('diff')
  endif
  return a:cmdline
endfunction

autocmd FileType vimshell
\ call vimshell#altercmd#define('g', 'git')
\| call vimshell#altercmd#define('i', 'iexe')
\| call vimshell#altercmd#define('l', 'll')
\| call vimshell#altercmd#define('ll', 'ls -al')
\| call vimshell#hook#set('chpwd', ['g:my_chpwd'])
\| call vimshell#hook#set('emptycmd', ['g:my_emptycmd'])
\| call vimshell#hook#set('preprompt', ['g:my_preprompt'])
\| call vimshell#hook#set('preexec', ['g:my_preexec'])

" Redmine
"------------------------------------
" mattn/vim-metarw-redmine
"------------------------------------
let g:metarw_redmine_server = ''
let g:metarw_redmine_apikey = ''
let g:rmine_server_url = ''
let g:rmine_access_key = ''
let g:unite_yarm_server_url = ''
let g:unite_yarm_access_key = ''

" +++++++++++++++++++++++ 表示 +++++++++++++++++++++++
"------------------------------------
" lightline.vim
"------------------------------------
let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ }
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
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

"------------------------------------
" vim-indent-guides
"------------------------------------
nnoremap <silent> <Space>id :<C-u>IndentGuidesToggle<Enter>
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 4
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
if 'dark' == &background
    hi IndentGuidesOdd  ctermbg=black
    hi IndentGuidesEven ctermbg=darkgrey
else
    hi IndentGuidesOdd  ctermbg=white
    hi IndentGuidesEven ctermbg=lightgrey
endif

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
endif

" +++++++++++++++++++++++ Unite +++++++++++++++++++++++
"------------------------------------
" unite.vim
"------------------------------------
" The prefix key.
nnoremap [unite] <Nop>
nmap f [unite]

nnoremap [unite]u  :<C-u>Unite -no-split<Space>

" 全部乗せ
nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -no-split -buffer-name=files buffer file_mru bookmark file<CR>
" ファイル一覧
nnoremap <silent> [unite]f  :<C-u>Unite -no-split -buffer-name=files file<CR>
" バッファ一覧
nnoremap <silent> [unite]b  :<C-u>Unite -no-split buffer<CR>
" 常用セット
nnoremap <silent> [unite]u  :<C-u>Unite -no-split buffer file_mru<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]m  :<C-u>Unite -no-split file_mru<CR>
" 現在のバッファのカレントディレクトリからファイル一覧
nnoremap <silent> [unite]d  :<C-u>UniteWithBufferDir -no-split file<CR>
" snippet一覧
nnoremap <silent> [unite]s  :<C-u>Unite snippet<CR>

" nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

let g:yankring_zap_keys = ""
" from basyura/unite-rails
nnoremap <silent> [unite]rm  :<C-u>Unite -no-split rails/model<CR>
nnoremap <silent> [unite]rc  :<C-u>Unite -no-split rails/controller<CR>
nnoremap <silent> [unite]rv  :<C-u>Unite -no-split rails/view<CR>
nnoremap <silent> [unite]rl  :<C-u>Unite -no-split rails/lib<CR>
nnoremap <silent> [unite]rj  :<C-u>Unite -no-split rails/javascript<CR>
nnoremap <silent> [unite]rs  :<C-u>Unite -no-split rails/spec<CR>

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
let QFixHowm_FileType = 'qfix_memo'
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

"------------------------------------
" surround.vim
"------------------------------------
" s, ssで選択範囲を指定文字でくくる
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround
let g:surround_{char2nr('e')} = "begin \r end"
let g:surround_{char2nr('d')} = "do \r end"
let g:surround_{char2nr("-")} = ":\r"

"------------------------------------
" YankRing.vim
"------------------------------------
" Yankの履歴参照
nmap ,y ;YRShow<CR>

"------------------------------------
" operator-replace.vim
"------------------------------------
" RwなどでYankしてるもので置き換える
map R <Plug>(operator-replace)

"------------------------------------
" operator-camelize.vim
"------------------------------------
" camel-caseへの変換
map <Leader>u <Plug>(operator-camelize)
map <Leader>U <Plug>(operator-decamelize)

"------------------------------------
" toggle.vim
"------------------------------------
imap <C-A> <Plug>ToggleI
nmap <C-A> <Plug>ToggleN
vmap <C-A> <Plug>ToggleV
let g:toggle_pairs = { 'and':'or', 'or':'and', 'if':'unless', 'unless':'if', 'yes':'no', 'no':'yes', 'enable':'disable', 'disable':'enable', 'pick':'reword', 'reword':'fixup', 'fixup':'squash', 'squash':'edit', 'edit':'exec', 'exec':'pick' }

"------------------------------------
" gundo.Vim
"------------------------------------
nmap U :<C-u>GundoToggle<CR>
