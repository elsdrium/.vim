set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8

" Use vim.plug to manage plugins
call plug#begin('~/.vim/plugged')        " required

" Vim enhancement
Plug 'IndexedSearch'
Plug 'matchit.zip'
Plug 'YankRing.vim'
Plug 't9md/vim-choosewin'
Plug 'Shougo/neocomplete.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'tpope/vim-surround'
Plug 'Townk/vim-autoclose'
Plug 'kien/tabman.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-repeat'
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
"Plug 'tomtom/tlib_vim'
"Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'fisadev/vim-ctrlp-cmdpalette'

" Development
"Plug 'elsdrm/Conque-Shell'
"Plug 'fholgado/minibufexpl.vim'
Plug 'godlygeek/tabular', { 'on': 'Tab' }
Plug 'majutsushi/tagbar'
Plug 'jistr/vim-nerdtree-tabs' | Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/syntastic'
Plug 'flazz/vim-colorschemes' " manage color schemes
Plug 'Yggdroot/indentLine'

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript'}

" LaTeX
"Plug 'LaTeX-Box-Team/LaTeX-Box'
"Plug 'gerw/vim-latex-suite'
"Plug 'xuhdev/vim-latex-live-preview'

" Python
"Plug 'elsdrm/vim-debug'  " It's awesome, but shortcut keys conflict to other plugins...
Plug 'davidhalter/jedi-vim', {'for': 'python'}

" Git
Plug 'mhinz/vim-signify'
"Plug 'motemen/git-vim'
"Plug 'tpope/vim-fugitive'


call plug#end()              " required
" filetype plugin indent on    " required

" plugins' settings
""" vim-easymotion
let g:EasyMotion_leader_key = '\'
nmap <Leader>v <Plug>(easymotion-bd-w)

""" vim-airline
let g:airline_powerline_fonts = 0
let g:airline_theme = 'kalisi'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#tabline#enabled = 1

""" neocomplete.vim
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

" Recommended key-mappings.
" <CR>: close popup and save indent.
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? '\<C-n>' : '\<TAB>'
" <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplete#smart_close_popup().'\<C-h>'
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : '\<Space>'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=jedi#completions

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'


""" UltiSnips
let g:UltiSnipsExpandTrigger='<Leader><TAB>'
let g:UltiSnipsJumpForwardTrigger='<C-g>'
let g:UltiSnipsJumpBackwardTrigger='<C-t>'
let g:UltiSnipsListSnippets=',ls'


""" vim-choosewin
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1


""" Autoclose
" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {'ENTER': '\<C-Y>', 'ESC': '\<ESC>'}


""" tabman.vim
" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tm'
let g:tabman_focus  = 'tf'


""" tagbar
" toggle tagbar display
nmap tb :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1
let tagbar_map_closefold = ['zc']
let tagbar_map_openfold = ['zo']


""" vim-nerdtree-tabs / nerdtree
" toggle nerdtree tab
nmap ,t :NERDTreeTabsToggle<CR>
" open nerdtree with the current file selected
map ,q :NERDTreeFind<CR>
" don;t show these file types
"let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
let NERDTreeShowHidden = 1
let NERDTreeDirArrows = 1
let NERDTreeMouseMode = 2
"autocmd FileType nerdtree setlocal nolist
"hi Directory ctermfg=darkred
autocmd FileType nerdtree highlight Directory ctermfg=darkred


""" vim-signify
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


""" fzf.vim
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


""" vim-surround
"autocmd FileType tex let b:surround_108 = '\\begin{\1environment: \1}\r\\end{\1\r}.*\r\1}'


""" syntastic
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
" show list of errors and warnings on the current file
nnoremap <C-e> :Errors<CR>
" toggle list of errors and warnings on the current file
nmap ,e :call ToggleErrors()<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 1
" custom icons (enable them if you use a patched font, and enable the previous setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '☢'
let g:syntastic_style_warning_symbol = '☣'

"let g:syntastic_python_python_exec = '/usr/bin/env python3'
let g:syntastic_python_python_exec = '/usr/bin/env python'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_c_compiler = 'clang'
"let g:syntastic_cuda_checkers = ['cpp/gcc']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11'
"let g:syntastic_cpp_compiler_options = '-std=c++11 -I/usr/local/cuda/include -L/usr/local/cuda/lib64 -lcudart --cuda-gpu-arch=sm_30'
let g:syntastic_cuda_config_file = '~/.unix_settings/.syntastic_cuda_config'


""" tabular
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


""" indentLine
let g:indentLine_color_term = 239


""" vim-latex-suite
"let g:tex_flavor='latex'
"imap <C-d> <Plug>IMAP_JumpForward
"imap <C-l> <Plug>Tex_LeftRight


""" jedi-vim
"let g:jedi#force_py_version = 3
let g:jedi#completions_command = '<TAB>'
let g:jedi#show_call_signatures = 1
let g:jedi#show_call_signatures_delay = 50


""" minibufexpl.vim
"nnoremap ,l :MBEToggleAll<CR>:MBEFocus<CR>
"let g:miniBufExplorerAutoStart = 0


""" YankRing.vim
nnoremap <silent> ,y :YRShow<CR>
let g:yankring_history_dir = '~/.vim/dirs/'


""" LaTeX-Box
"nnoremap <Leader>la :w<CR>:LatexmkClean<CR>:Latexmk<CR>:LatexView<CR>

""" YouCompleteMe
"check syntax with syntastic instead
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

" End of plugins' settings --------------------------


" tabs and spaces
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

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

" todo / fixme list
command! TagList noautocmd vimgrep /TODO\|FIXME/j % | cw
function! ToggleTagList()
    let old_last_winnr = winnr('$')
    cclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        TagList
    endif
endfunction
nmap td :call ToggleTagList()<CR>

" incremental search
set incsearch
" highlighted search results
set hlsearch
" case insensitive search
set ignorecase
set smartcase

" no annoying beeps anymore...
set vb
set t_vb=

" support 256 colors
set t_Co=256 "

" use F2 as pastetoggle
set pastetoggle=<F2>

" mouse support
set ttyfast
if has('mouse')
    set mouse=a
endif

" clipboard support
if has('clipboard')
    set clipboard=unnamed
endif

" nvim vs vim stuffs
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
set shortmess+=c
set wrap
set nu
"set rnu
"set foldmethod=indent
"set foldenable
set autoindent
"set cursorline

" personal key mappings
nmap <CR><CR> o<Esc>
imap <C-]> <C-o>l
"nmap ;l  :res +10<CR>
"nmap ;s  :res -10<CR>
nmap ;vl :vertical res +10<CR>
nmap ;vs :vertical res -10 <CR>
noremap ,, <Esc>:bnext<CR>
noremap ,. <Esc>:bprevious<CR>
inoremap ;; <Esc>
inoremap ;, ;<Esc>
vnoremap ;; <Esc>
inoremap ,, <End>
inoremap ,. <Esc>I
vnoremap // y/<C-R>"<CR> 
vnoremap <C-c> "+y
nnoremap <F3> :NeoCompleteToggle<CR>
