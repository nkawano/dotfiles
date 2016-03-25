set encoding=utf-8
set nocompatible
set notitle
set backspace=indent,eol,start
set number
set title
set showmatch
set showmode
set showcmd
syntax on
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set ignorecase
set smartcase
set incsearch
set wrapscan
set background=dark
set list
set listchars=tab:>-,extends:>,precedes:<,nbsp:%
set noswapfile
set hlsearch
highlight Search ctermfg=Black ctermbg=Red cterm=NONE
if has('win32unix')
    set clipboard+=unnamed
else
    set clipboard&
    set clipboard^=unnamedplus
endif
set splitbelow
set splitright
set nf=""
set wildmode=list:longest
set nrformats=
set undofile
set undodir=~/.vim/undo/
set fileformat=unix
set laststatus=2
" set autochdir


" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif
"
if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif
    "
    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
"
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

runtime ftplugin/man.vim

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in
"                             .gvimrc!
"

NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }
NeoBundle 'Shougo/vimshell.vim'
let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '

NeoBundle 'Shougo/neocomplete.vim'
" ===================== neocomplete =========================================
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" ===================== neocomplete =========================================

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<TAB>" : "\<Plug>(neosnippet_expand_or_jump)"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

" insert modeで開始
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

NeoBundle 'Shougo/vimfiler.vim'
" vimfiler
let g:vimfiler_as_default_explorer = 1
noremap <Space>vf :VimFiler -split -simple -winwidth=45 -no-quit<ENTER>

NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'tpope/vim-fugitive' start
nnoremap <silent> <Space>gb :Gblame<CR>
nnoremap <silent> <Space>gd :Gdiff<CR>
nnoremap <silent> <Space>gs :Gstatus<CR>
if isdirectory(expand('~/.vim/bundle/vim-fugitive'))
    set statusline+=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
endif
"NeoBundle 'tpope/vim-fugitive' end

NeoBundle 'cohama/agit.vim'

NeoBundle 'tomtom/tcomment_vim'

NeoBundle 'ntpeters/vim-better-whitespace'
let g:better_whitespace_filetypes_blacklist = ['unite', 'vimfiler']
" let g:better_whitespace_filetypes_blacklist+=['vimfiler']
" NeoBundle 'bronson/vim-trailing-whitespace'
" if neobundle#tap('vim-trailing-whitespace')
"     " uniteでスペースが表示されるので、設定でOFFにします。
"     let g:extra_whitespace_ignored_filetypes = ['unite', 'vimfiler']
" endif

NeoBundle 'scrooloose/syntastic'
"NeoBundle 'scrooloose/syntastic' start
"
if isdirectory(expand('~/.vim/bundle/syntastic'))
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
endif

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"NeoBundle 'scrooloose/syntastic' end

" NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'powerline/powerline'

NeoBundle 'thinca/vim-ref'
"NeoBundle 'thinca/vim-ref' start
let g:ref_phpmanual_path=$HOME . '/.vim/php-ref/php-chunked-xhtml'
"NeoBundle 'thinca/vim-ref' end
"
NeoBundle 'tpope/vim-surround'


" NeoBundle 'kana/vim-smartinput'
autocmd FileType php,javascript inoremap { {}<Left>

NeoBundle 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>

NeoBundle 'camelcasemotion'

" NeoBundle 'gregsexton/VimCalc'
NeoBundle 'sudo.vim'
NeoBundle 'joonty/vdebug'

NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

NeoBundle 'tsukkee/unite-tag'

autocmd BufEnter *
\   if empty(&buftype)
\|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
\|  endif

autocmd BufEnter *
\   if empty(&buftype)
\|      nnoremap <buffer> <C-t> :<C-u>Unite jump<CR>
\|  endif
" colorscheme
" NeoBundle 'ujihisa/unite-colorscheme'
" NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'croaker/mustang-vim'
" NeoBundle 'nanotech/jellybeans.vim'
" NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'vim-scripts/twilight'
" NeoBundle 'jonathanfilip/vim-lucius'
" NeoBundle 'jpo/vim-railscasts-theme'
" NeoBundle 'vim-scripts/Wombat'
" NeoBundle 'vim-scripts/rdark'
" NeoBundle 'tomasr/molokai'

colorscheme molokai
set t_Co=256
let g:molokai_original=1
" highlight CursorLine cterm=underline
set cursorline
highlight CursorLine term=reverse cterm=none ctermbg=237
call neobundle#end()
"
" Required:
filetype plugin indent on
"
" If there are uninstalled bundles found on
"                                 startup,
"                                  " this will conveniently prompt you to
"                                  install them.
NeoBundleCheck

" ======================== originam key maps ====================
nnoremap ; :
nnoremap : ;
noremap j gj
noremap k gk
nnoremap <C-j> 5j
nnoremap <C-k> 5k
vnoremap <C-j> 5j
vnoremap <C-k> 5k
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-h> <Backspace>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
nnoremap <Tab> gt
nnoremap <S-Tab> gT
" nnoremap <C-l> <C-w>>
" nnoremap <C-h> <C-w><
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
nnoremap <C-Up> <C-w>-
nnoremap <C-Down> <C-w>+
" nnoremap <CR> o<Esc>
"
""" 挿入モードでのカーソル移動
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-d> <Del>
inoremap <C-a> <Esc>^i
inoremap <C-e> <Esc>$i

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
command Vexp Vexplore
command Sexp Sexplore


" inoremap { {}<Left>
" autocmd FileType php inoremap <buffer> { {}<Left><CR><Esc><S-o>
" inoremap [ []<Left>
" inoremap ( ()<Left>
" inoremap ' ''<Left>
" inoremap " ""<Left>

inoremap <CR> <CR><Esc>I

vnoremap v $h
vnoremap * <Esc>/\%V

autocmd FileType xml,html inoremap < <><Left>

" nnoremap [space] <Nop>
nnoremap <Space> <Nop>


" nnoremap [tagjump] <Nop>
" nnoremap <Space>j [tagjump]
nnoremap <Space>je :e<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <Space>jl :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <Space>jj :split<CR> :exe("tjump ".expand('<cword>'))<CR>
" nnoremap <Space>t :tabnew<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <Space>jt :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif

augroup MyXML
    autocmd!
    autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

set tags=tags;

" 前回編集位置復元
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
" ======================== original key maps ====================

" ======================== original commadn =====================
" cnoremap mygrep read !find . -type f |xargs grep
" ======================== original commadn =====================
