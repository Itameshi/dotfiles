" setting


" 文字コードをUFT-8に変換
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" エラービープ音の全停止
set visualbell t_vb=
set noerrorbells
" スクロール送りをする前後の行数指定
set scrolloff=4
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
" ターミナルサイズ
set termwinsize=7x0


" 見た目
" 行番号を表示
set number
" インデントはスマートインデント
"set smartindent
"インデントはcindent
set cindent
" 括弧入力時の対応するカッコを表示
set showmatch
" 行末の一時先までカーソルを移動できるように
set virtualedit=onemore
" 現在の列を強調表示
set cursorcolumn
" 現在の行を強調表示
 set cursorline
" 全角スペースの可視化
"highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
"au BufNewFile,BufRead * match ZenkakuSpace /　/
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=Darkred gui=reverse guifg=DarkMagenta
endfunction
   
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" color
set background=dark
colorscheme onedark 
"colorschemes ...  hybrid onedark


"Tab系
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペース幾つぶん）
set tabstop=2
" 行頭でのTabの表示幅
set shiftwidth=2
"jjコマンドを<Esc>の代わりとする
inoremap <silent> jj <Esc>
"nmap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>


" プラグイン
call plug#begin()

" 非同期処理
Plug 'Shougo/vimproc.vim'

" 括弧の自動補完
Plug 'Townk/Vim-autoclose'

" 汎用的な構文チェック
Plug 'w0rp/ale'

" 汎用的な自動補完
Plug 'Shougo/neocomplete'

" Python補完
Plug 'davidhalter/jedi-vim', {'for': 'python'}

" Python自動整形
Plug 'tell-k/vim-autopep8', {'for': 'python'}

"ディレクトリツリーの表示
Plug 'scrooloose/nerdtree'

Plug 'w0ng/vim-hybrid'

"jupyter notebook
Plug 'goerz/jupytext.vim'
Plug 'jupyter-vim/jupyter-vim'

call plug#end()

" 常時lintのon
let g:ale_lint_on_text_changed = 1
" エディタがエラー行追加に左にずれるのを防ぐ
let g:ale_sign_column_always = 1

" jupyter notebook の設定
" セルの区切り文字をVSCode五感の # %% に指定
let g:jupytext_fmt = 'py:percent'

" vimのpython向けシンタックスハイライトを有効にする
let g:jupytext_filetype_map = {'py': 'python'}

" c_lang setting
autocmd! FileType c call ClangSetting()
function! ClangSetting()
  noremap <F5> :call Gcc()<CR>

  function! Gcc()
    let filename = expand("%")
    let filesize = strlen(filename)
    let $output_file = filename[0: filesize - 3]
    :!gcc % -o $output_file -lm
    :!./$output_file
  endfunction

endfunction

" JavaScript setting
autocmd! Filetype javascript call JavaScriptSetting()
function! JavaScriptSetting()
  noremap <F5> :! node %<CR>
endfunction

" HTML setting
autocmd! FileType html call HTMLSetting()
function! HTMLSetting()
  noremap <F5> :!firefox %<CR>
endfunction

" shell script sestting
autocmd! FileType sh call BashSetting()
function! BashSetting()
  noremap <F5> :! %<CR>
endfunction

" Python setting
autocmd! FileType python call PythonSetting()
function! PythonSetting()
  "Tab系の設定
  " set tabstop=2
  " set shiftwidth=2

  "### vim-autopep8 ###
  " Shift + F でautopep自動修正
  nnoremap <S-f> :call Autopep8()<CR>
  noremap <F5> :!python3 %<CR>

	"### jedi-vim ###
	" 自動で実行される初期化処理を有効
	let g:jedi#auto_initialization    = 1 
	" 'completeopt' オプションを上書きしない
	let g:jedi#auto_vim_configuration = 0
	" ドット(.)を入力したとき自動で補完する
	let g:jedi#popup_on_dot           = 1 
	" 補完候補の1番目を選択しない
	let g:jedi#popup_select_first     = 0 
	" 関数の引数表示を無効	
	let g:jedi#show_call_signatures   = 1
	" 補完エンジンはjediを使う
	autocmd FileType python setlocal omnifunc=jedi#completions

endfunction

"alias
"command <Alias> <変更前のコマンド>


"key_mapping
nnoremap <S-t> :NERDTree<CR>
nnoremap + <C-d>
nnoremap - <C-u>

"Test
