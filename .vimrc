set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8

"" Plugins {{{1
" Use vim.plug to manage plugins
call plug#begin('~/.vim/plugged') " required

" Vim enhancement
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/YankRing.vim'
Plug 'mhinz/vim-startify'
Plug 't9md/vim-choosewin'
" Plug 'Shougo/neocomplete.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/vim-cursorword'
Plug 'kien/tabman.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-repeat'
Plug 'Lokaltog/vim-easymotion'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'tomtom/tlib_vim'
"Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'fisadev/vim-ctrlp-cmdpalette'

" colorscheme
Plug 'flazz/vim-colorschemes'
Plug 'liuchengxu/space-vim-dark'

" Python
"Plug 'elsdrium/vim-debug'  " It's awesome, but shortcut keys conflict to other plugins...
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

" Scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

" LaTeX
"Plug 'LaTeX-Box-Team/LaTeX-Box'
"Plug 'gerw/vim-latex-suite'
"Plug 'xuhdev/vim-latex-live-preview'

" Markdown
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
"Plug 'suan/vim-instant-markdown', { 'do': 'npm -g install instant-markdown-d', 'for': 'markdown' }

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
"Plug 'motemen/git-vim'

" Development
"Plug 'elsdrium/Conque-Shell'
"Plug 'fholgado/minibufexpl.vim'
Plug 'elsdrium/vim-sleuth'
Plug 'godlygeek/tabular', { 'on': 'Tab' }
Plug 'majutsushi/tagbar'
Plug 'jistr/vim-nerdtree-tabs' | Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Yggdroot/indentLine'
"Plug 'jeaye/color_coded', { 'do': 'cmake . && make && make install', 'for': ['c', 'cpp', 'objc', 'objcpp'] }
Plug 'junegunn/vim-easy-align'
if v:version > 704 || (v:version == 704 && has('patch1578'))
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer' }
endif

if v:version >= 800 || has('nvim')
  Plug 'w0rp/ale'
else
  Plug 'scrooloose/syntastic'
endif

call plug#end() " required
" }}}

"" Plugins' Settings
""" vim-easymotion {{{1
let g:EasyMotion_leader_key = '\'
nmap <Leader>v <Plug>(easymotion-bd-w)

""" vim-airline {{{1
let g:airline_powerline_fonts = 0
let g:airline_theme = 'kalisi'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"]
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#ale#enabled = 1

""" deoplete.nvim {{{1
let g:deoplete#enable_at_startup = 1
augroup MyDeoplete
  au!
  autocmd CompleteDone * silent! pclose!
augroup END

""" NERDCommenter {{{1
let g:NERDSpaceDelims = 1

""" UltiSnips {{{1
let g:UltiSnipsExpandTrigger='<Leader><TAB>'
let g:UltiSnipsJumpForwardTrigger='<C-g>'
let g:UltiSnipsJumpBackwardTrigger='<C-t>'
let g:UltiSnipsListSnippets=',ls'

""" vim-choosewin {{{1
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

""" auto-pairs {{{1
" let g:AutoPairsFlyMode = 1

""" tabman.vim {{{1
" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tm'
let g:tabman_focus  = 'tf'

""" tagbar {{{1
" toggle tagbar display
nmap tb :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1
let tagbar_map_closefold = ['zc']
let tagbar_map_openfold = ['zo']

let g:tagbar_type_typescript = {
      \ 'ctagstype': 'typescript',
      \ 'kinds': [
      \ 'c:classes',
      \ 'n:modules',
      \ 'f:functions',
      \ 'v:variables',
      \ 'v:varlambdas',
      \ 'm:members',
      \ 'i:interfaces',
      \ 'e:enums',
      \ ]
      \ }

""" vim-nerdtree-tabs / nerdtree {{{1
function! NERDTreeFindToggle()
  if exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
    NERDTreeTabsClose
  else
    NERDTreeFind
  endif
endfunction
" toggle nerdtree tab with the current file selected
nmap ,t :call NERDTreeFindToggle()<CR>
" don;t show these file types
"let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
let NERDTreeShowHidden = 1
let NERDTreeDirArrows = 1
let NERDTreeMouseMode = 2
"autocmd FileType nerdtree setlocal nolist
"hi Directory ctermfg=darkred
autocmd FileType nerdtree highlight Directory ctermfg=darkred

""" vim-signify {{{1
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <Leader>sn <Plug>(signify-next-hunk)
nmap <Leader>sp <Plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

""" vim-fugitive {{{1
nnoremap gb :Gblame<CR>

" diff with HEAD (overrided default behavior for starting select mode)
nnoremap gh :Gdiff HEAD

""" fzf.vim {{{1
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
" Quickfix window for quick navigation
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

" This is the default extra key bindings
let g:fzf_action = {
      \ 'ctrl-t': function('s:build_quickfix_list')
      \ }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In neovim, set up fzf window using a Vim command
if has('nvim')
  let g:fzf_layout = { 'window': 'enew' }
  let g:fzf_layout = { 'window': '-tabnew' }
  let g:fzf_layout = { 'window': '10split enew' }
end

" Customize fzf colors to match your color scheme
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.vim/dirs/fzf-history'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
"let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Mapping selecting mappings
nmap <Leader><TAB> <plug>(fzf-maps-n)
xmap <Leader><TAB> <plug>(fzf-maps-x)
omap <Leader><TAB> <plug>(fzf-maps-o)

" commands shortcut
nnoremap ,b :Buffers<CR>
nnoremap ,f :Files<CR>
nnoremap ,L :Lines<CR>
nnoremap ,l :BLines<CR>
nnoremap ,w :Windows<CR>

command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)

""" vim-surround {{{1
"autocmd FileType tex let b:surround_108 = '\\begin{\1environment: \1}\r\\end{\1\r}.*\r\1}'

""" ale {{{1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_open_list = 0
let g:ale_fixers = {
      \   'c': ['clang'],
      \   'cpp': ['clang'],
      \   'python': ['flake8'],
      \   'javascript': ['eslint'],
      \}

""" syntastic {{{1
" show list of errors and warnings on the current file
"nnoremap <C-e> :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 1
" custom icons (enable them if you use a patched font, and enable the previous setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '☢'
let g:syntastic_style_warning_symbol = '☣'

let g:syntastic_javascript_checkers=['jshint']

"let g:syntastic_python_python_exec = '/usr/bin/env python3'
let g:syntastic_python_python_exec = '/usr/bin/env python'
let g:syntastic_python_checkers = ['flake8']

let g:syntastic_c_compiler = 'clang'
"let g:syntastic_cuda_checkers = ['cpp/gcc']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11'
"let g:syntastic_cpp_compiler_options = '-std=c++11 -I/usr/local/cuda/include -L/usr/local/cuda/lib64 -lcudart --cuda-gpu-arch=sm_30'
let g:syntastic_cuda_config_file = '~/.unix_settings/.syntastic_cuda_config'

""" tabular {{{1
let mapleader=','
if exists(':Tabularize')
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> ,tb <Bar><Esc>:call <SID>align()<CR>a 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

""" indentLine {{{1
let g:indentLine_color_term = 239

""" vim-easy-align {{{1
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""" vim-latex-suite {{{1
"let g:tex_flavor='latex'
"imap <C-d> <Plug>IMAP_JumpForward
"imap <C-l> <Plug>Tex_LeftRight

""" jedi-vim {{{1
"let g:jedi#force_py_version = 3
let g:jedi#completions_command = '<TAB>'
let g:jedi#show_call_signatures = 1
let g:jedi#show_call_signatures_delay = 50
if has('python3')
  let g:jedi#force_py_version = 3
endif

""" minibufexpl.vim {{{1
"nnoremap ,l :MBEToggleAll<CR>:MBEFocus<CR>
"let g:miniBufExplorerAutoStart = 0

""" YankRing.vim {{{1
nnoremap <silent> ,y :YRShow<CR>
let g:yankring_history_dir = '~/.vim/dirs/'
" Useless, just for avoiding conflicts
let g:yankring_replace_n_nkey = '<m-f>'
let g:yankring_replace_n_pkey = '<m-r>'

""" LaTeX-Box {{{1
"nnoremap <Leader>la :w<CR>:LatexmkClean<CR>:Latexmk<CR>:LatexView<CR>

""" vim-instant-markdown {{{1
autocmd FileType markdown nnoremap <C-m> :InstantMarkdownPreview<CR>
let g:instant_markdown_autostart = 0
let g:instant_markdown_allow_unsafe_content = 1

""" YouCompleteMe {{{1
"check syntax with other plugins instead
let g:ycm_show_diagnostics_ui = 0

let g:ycm_auto_trigger = 1
"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.unix_settings/ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_cache_omnifunc = 1
let g:ycm_disable_for_files_larger_than_kb = 50000
let g:ycm_key_list_select_completion = ['<TAB>', '<C-j>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<C-k>']
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \ 'mundo': 1,
      \ 'fzf': 1,
      \ 'ctrlp' : 1
      \}

" Go to Definition variable
nnoremap <Leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

""" tern_for_vim {{{1
let g:tern#is_show_argument_hints_enabled = 1
nnoremap <silent> td :TernDoc<CR>

""" typescript-vim {{{1
let g:typescript_indent_disable = 1

" End of plugins' settings -------------------------- }}}

"" Enviroment Settings
" tabs and spaces {{{1
set smartindent
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" indicate tab characters
set list lcs=tab:\|\ 

" file types with tab length exceptions {{{1
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2

" todo / fixme list {{{1
command! TODOList noautocmd silent! vimgrep /TODO\|FIXME/j % | cw
function! ToggleTODOList()
  let old_last_winnr = winnr('$')
  cclose
  if old_last_winnr == winnr('$')
    " Nothing was closed, open syntastic error location panel
    TODOList
  endif
endfunction
nmap tt :call ToggleTODOList()<CR>

" toggle list of errors and warnings on the current file
function! ToggleErrors()
  let old_last_winnr = winnr('$')
  let g:ale_open_list = 0
  lclose
  if old_last_winnr == winnr('$')
    " Nothing was closed, open syntastic/ale error location panel
    if exists(":Errors")
      Errors
    else
      let g:ale_open_list = 1
      let g:ale_keep_list_window_open = 1
      lw
    endif
  endif
endfunction
nmap ,e :call ToggleErrors()<CR>

" auto-close quickfix window if it's the last one
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" native search {{{1
" incremental search
set incsearch
" highlighted search results
set hlsearch
" case insensitive search
set ignorecase
set smartcase

" mouse support {{{1
set ttyfast
set mousehide
if has('mouse')
  set mouse=a
endif

" clipboard support {{{1
if has('clipboard')
  set clipboard=unnamed
endif

" folding setting {{{1
set foldenable
set foldmethod=marker
set foldcolumn=1

" cscope setting {{{1
if has("cscope")
  let g:csdb = findfile("cscope.out", ".;")
  let g:dbdir = fnamemodify(g:csdb, ":h")
  silent exe "cs add " . g:csdb . " " . g:dbdir
  set csverb
  " Use both cscope and ctag
  set cscopetag
  " Use tags for definition search first
  set cscopetagorder=1
  " Use quickfix window to show cscope results
  set cscopequickfix=s-,g-,c-,d-,i-,t-,e-

  function! RefreshCsdb()
    if !empty(get(g:, 'dbdir'))
      silent exe "!(cd " . g:dbdir . " && exec cscope -b -i cscope.files)"
      silent exe "cs reset"
      exe "redraw!"
    endif
  endfunction

  function! CscopeQueryQF(qtype)
    if &ft == 'qf'
      cclose
      return
    endif
    call setqflist([])
    let wview = winsaveview()
    let fname = @%
    exe "normal! mY"
    silent! keepjumps exe "cs find " . a:qtype . " " . expand("<cword>")
    if fname != @%
      exe "normal! `Y"
      bd #
    endif
    call winrestview(wview)
    botright cw
  endfunction

  nnoremap ;r :call RefreshCsdb()<CR>
  nnoremap ;s :call CscopeQueryQF("s")<CR>
  nnoremap ;g :call CscopeQueryQF("g")<CR>
  nnoremap ;c :call CscopeQueryQF("c")<CR>
  nnoremap ;d :call CscopeQueryQF("d")<CR>
endif

" search ctags file upward
set tags=./tags;

" nvim vs vim stuffs {{{1
if has('nvim')
  set viminfo+=n~/.vim/dirs/nviminfo
  tnoremap ;; <C-\><C-n>
else
  set viminfo+=n~/.vim/dirs/viminfo
  set ttymouse=xterm2
endif


" general settings
syntax on
colo molokai2
set cul
"set cuc
set history=1000
set wrap
set nu
"set rnu
"set foldmethod=indent
"set foldenable
set autoindent
"set cursorline
set showcmd
set wildmenu
set lazyredraw
" better detection for shortmess c
if has('patch-7.4.314')
  set shortmess+=c
endif

" miscellaneous {{{1
aug MyMiscStuff
  autocmd!
  autocmd! Syntax python :syn keyword Keyword self
aug END
" always show status bar
set ls=2

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos

" create needed directories if they don't exist
if !isdirectory(&backupdir)
  call mkdir(&backupdir, 'p')
endif
if !isdirectory(&directory)
  call mkdir(&directory, 'p')
endif
if !isdirectory(&undodir)
  call mkdir(&undodir, 'p')
endif

" no annoying beeps anymore...
set vb
set t_vb=

" make backspace works
set backspace=2

" support 256 colors
set t_Co=256 "

" use F2 as pastetoggle
set pastetoggle=<F2>

"" Personal Key Mappings {{{1
function! GoPrevious()
  if &diff
    exe ":normal! [c"
  else
    exe ":cprevious"
  endif
endfunction
function! GoNext()
  if &diff
    exe ":normal! ]c"
  else
    exe ":cnext"
  endif
endfunction
nnoremap <C-p> :call GoPrevious()<CR>
nnoremap <C-n> :call GoNext()<CR>

nmap <CR><CR> o<Esc>
imap <C-]> <C-o>l
"nmap ;l  :res +10<CR>
"nmap ;s  :res -10<CR>
nmap ;vl :vertical res +10<CR>
nmap ;vs :vertical res -10 <CR>
noremap ,, <Esc>:bnext<CR>
noremap ,. <Esc>:bprevious<CR>
nnoremap <C-k> :lprevious<CR>
nnoremap <C-j> :lnext<CR>
noremap <C-e> <Esc>:e!<CR>
inoremap <C-e> <Esc>:e!<CR>
inoremap ;; <Esc>
inoremap ;, ;<Esc>
vnoremap ;; <Esc>
inoremap ,, <End>
inoremap ,. <Esc>I
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
vnoremap // y/<C-R>"<CR> 
vnoremap <C-c> "+y
nnoremap <F3> :NeoCompleteToggle<CR>
nnoremap gV `[v`]
" formatting html
nnoremap ,= :s/<[^>]*>/\r&\r/g<CR>:g/^$/d<CR>gg=G
nnoremap <C-f> :Ag 
