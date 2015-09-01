noremap <S-h>   ^
noremap <S-l>   $

set nocompatible " vi互換なし
set number " 行番号を表示
set scrolloff=5 " スクロール時の余白確保
set cursorline " カーソル行をハイライト
set autoread " Vimの外部で変更されたことが判明したとき、自動的に読み直す
set noswapfile " スワップファイルを作成しない
set noundofile " Undoファイルを作成しない

" http://yuroyoro.hatenablog.com/entry/20101104/1288879591
set ignorecase " 大文字小文字無視
set smartcase " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch " インクリメンタルサーチ
set hlsearch " 検索文字をハイライト

" インデント関連 http://vimblog.hatenablog.com/entry/vimrc_set_tab_indent_options
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

set imdisable "これで挿入モードから抜ける際、入る際に必ずIMEがオフになります

" http://nanasi.jp/articles/howto/file/seemingly-unneeded-file.html#id7
set nobackup

filetype off

" NeoBundleの設定
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle'))

  " ここにインストールしたいプラグインのリストを書く
  NeoBundle 'tell-k/vim-browsereload-mac'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/neocomplete.vim'
  NeoBundle 'h1mesuke/unite-outline'
  NeoBundle 'Align'
  NeoBundle 'kana/vim-surround'
  NeoBundle 'w0ng/vim-hybrid'
  NeoBundle 'Shougo/vimshell.vim'
  NeoBundle 'kana/vim-fakeclip'
  " NeoBundle 'scrooloose/nerdtree'
  " NeoBundle 'jistr/vim-nerdtree-tabs'
  NeoBundle 'cohama/lexima.vim' " 自動的に対応する括弧を入力する
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'slim-template/vim-slim'
  NeoBundle 'Shougo/vimfiler.vim'
  NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
        \ 'windows' : 'make -f make_mingw32.mak',
        \ 'cygwin' : 'make -f make_cygwin.mak',
        \ 'mac' : 'make -f make_mac.mak',
        \ 'unix' : 'make -f make_unix.mak',
        \ },
        \ }

  NeoBundle 'haya14busa/vim-easymotion'

  call neobundle#end()
endif




let g:EasyMotion_leader_key = '<Space><Space>'
let g:EasyMotion_keys = 'sdflkj'
let g:EasyMotion_smartcase = 1
hi EasyMotionTarget ctermbg=none ctermfg=yellow
hi EasyMotionShade  ctermbg=none ctermfg=black
map f <Plug>(easymotion-fl)
map t <Plug>(easymotion-tl)
map F <Plug>(easymotion-Fl)
map T <Plug>(easymotion-Tl)
nmap <Space> <Plug>(easymotion-s2)

" `JK` Motions: Extend line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" keep cursor column with `JK` motions
let g:EasyMotion_startofline = 0

" Show target key with upper case to improve readability
let g:EasyMotion_use_upper = 1
" Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1


let g:returnApp = "iTerm"
" 0だと、Chromeリロードのときに、Chromeがアクティブになる。1だと上で指定したアプリ
let g:returnAppFlag = 1

" https://github.com/Shougo/neocomplete.vim
let g:neocomplete#enable_at_startup = 1

" NerdTree関連は邪魔になってきたのでいったんコメントアウト
" autocmd VimEnter * execute 'NERDTree ./'
" let NERDTreeShowHidden = 1 " 隠しファイルの表示
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
" let g:NERDTreeWinSize=20
" let NERDTreeMapOpenInTab='<ENTER>' " タブで開く

" NerdTreeTabs
" let g:nerdtree_tabs_open_on_console_startup=1

if v:version >= 700
  nnoremap <C-Tab>   <C-w>w
  nnoremap <Left>  :let g:returnAppFlag=0<CR>:ChromeReload<CR>
  nnoremap <Right>  :let g:returnAppFlag=1<CR>:ChromeReload<CR>
  nnoremap <Up> :q
  nnoremap <Down> "0
  noremap s "*
endif

" http://nauthiz.hatenablog.com/entry/20101107/1289140518
nnoremap ,s :VimShell<CR>

filetype plugin on
filetype indent on

" crontabの編集を可能に
" http://weble.org/2011/06/06/mac-cron
"set backupskip=/tmp/*,/private/tmp/*

syntax on


" .gvimrcに書いてた設定
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

if !empty($MY_RUBY_HOME)
  let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),"\n"),',')
endif
