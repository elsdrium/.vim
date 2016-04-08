set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set encoding=utf-8
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()        " required

Plugin 'VundleVim/Vundle.vim' " required

"Plugin 'ervandew/supertab'
Plugin 'tpope/vim-repeat'
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'Lokaltog/powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
Plugin 'majutsushi/tagbar'
"Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
"Plugin 'garbas/vim-snipmate'
Plugin 'SirVer/ultisnips'
"Plugin 'MarcWeber/vim-addon-mw-utils'  " dependency of snipmate
Plugin 'kien/tabman.vim'
"Plugin 'edkolev/tmuxline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'fisadev/vim-ctrlp-cmdpalette'
Plugin 'tpope/vim-surround'
Plugin 'Townk/vim-autoclose'
"Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/neocomplete.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 't9md/vim-choosewin'
Plugin 'elsdrm/Conque-Shell'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'godlygeek/tabular'

" Javascript
"Plugin 'pangloss/vim-javascript'

" LaTeX
"Plugin 'LaTeX-Box-Team/LaTeX-Box'
"Plugin 'gerw/vim-latex-suite'
"Plugin 'xuhdev/vim-latex-live-preview'

" Python
"Plugin 'klen/python-mode'  " Confilict with jedi-vim
"Plugin 'elsdrm/vim-debug'  " It's awesome, but shortcut keys conflict to other plugins...
"Plugin 'ivanov/vim-ipython'
Plugin 'davidhalter/jedi-vim'

" Git
Plugin 'mhinz/vim-signify'
"Plugin 'motemen/git-vim'
Plugin 'tpope/vim-fugitive'

" Vim enhancement
Plugin 'IndexedSearch'
Plugin 'matchit.zip'
Plugin 'YankRing.vim'

call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" plugins' settings
""" vim-easymotion
let g:EasyMotion_leader_key = '\'
nmap <Leader>v <Plug>(easymotion-bd-w)

""" vim-airline
let g:airline_powerline_fonts = 0
let g:airline_theme = 'zenburn'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''

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
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
    ""return neocomplete#close_popup() . "\<CR>"
    "" For no inserting <CR> key.
    "return pumvisible() ? "\<C-n>": "\<CR>"
"endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
            "\ <SID>check_back_space() ? "\<TAB>" :
            "\ neocomplete#start_manual_complete()
"function! s:check_back_space() "{{{
    "let col = col('.') - 1
    "return !col || getline('.')[col - 1]  =~ '\s'
"endfunction"}}}
" <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
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


""" ultisnips
let g:UltiSnipsExpandTrigger=",us"
let g:UltiSnipsJumpForwardTrigger="<C-g>"
let g:UltiSnipsJumpBackwardTrigger="<C-t>"


""" vim-choosewin
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1


""" Autoclose
" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}


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


""" nerdtree
" toggle nerdtree display
nmap ,t :NERDTreeToggle<CR>
" open nerdtree with the current file selected
map ,q :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


""" vim-signify
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <Plug>(signify-next-hunk)
nmap <leader>sp <Plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227


""" ctrlp.vim
" file finder mapping
let g:ctrlp_map = ',F' " very slow, not recommended.............
" tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,L :CtrlPLine<CR>
" recent files finder mapping
nmap ,M :CtrlPMRUFiles<CR>
" commands finder mapping
"nmap ,c :CtrlPCmdPalette<CR> " Not support Python3
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default
" text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wl :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
            \ 'file': '\.pyc$\|\.pyo$',
            \ }


""" vim-surround
"autocmd FileType tex let b:surround_108 = "\\begin{\1environment: \1}\r\\end{\1\r}.*\r\1}"

""" syntastic
" show list of errors and warnings on the current file
nmap ,e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 1
" custom icons (enable them if you use a patched font, and enable the previous setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '☢'
let g:syntastic_style_warning_symbol = '☣'

let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '--std=c++11'


"""" python-mode
"" don't use linter, we use syntastic for that
"let g:pymode = 1
"let g:pymode_lint_on_write = 0
"let g:pymode_lint_signs = 0
"" don't fold python code on open
"let g:pymode_folding = 0
"" don't load rope by default. Change to 1 to use rope
"let g:pymode_rope = 0
"" open definitions on same window, and custom mappings for definitions and
"" occurrences
"let g:pymode_rope_goto_definition_bind = ',d'
"let g:pymode_rope_goto_definition_cmd = 'e'
"nmap ,D :tab split<CR>:PymodePython rope.goto()<CR>
"nmap ,o :RopeFindOccurrences<CR>


""" tabular
let mapleader=','
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> ,<Tab> <Bar><Esc>:call <SID>align()<CR>a 
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


""" vim-latex-suite
let g:tex_flavor='latex'
imap <C-d> <Plug>IMAP_JumpForward
imap <C-l> <Plug>Tex_LeftRight


""" jedi-vim
"let g:jedi#force_py_version = 3
let g:jedi#completions_command = '<C-k>'


""" minibufexpl.vim
nnoremap ,l :MBEToggleAll<CR>:MBEFocus<CR>
let g:miniBufExplorerAutoStart = 0


""" YankRing.vim
nnoremap <silent> ,y :YRShow<CR>


""" LaTeX-Box
nnoremap <Leader>la :w<CR>:LatexmkClean<CR>:Latexmk<CR>:LatexView<CR>

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
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" toogle relativenumber
"function! RNUToggle()
    "if(&relativenumber == 1)
        "set relativenumber!
    "else
        "set relativenumber
    "endif
"endfunc

"nnoremap ,r :call RNUToggle()<cr>

" incremental search
set incsearch
" highlighted search results
set hlsearch

" no annoying beeps anymore...
set vb
set t_vb=

" fold codes based on syntax(indent is nice for python)
set foldmethod=indent
set foldenable
set autoindent

" general settings
syntax on
colo elflord
set cul
"set cuc
set history=1000
set wrap
set nu
"set rnu

" personal key mappings
nmap <CR><CR> o<Esc>
imap <C-]> <C-o>l
nmap ;l  :res +10<CR>
nmap ;s  :res -10<CR>
nmap ;vl :vertical res +10<CR>
nmap ;vs :vertical res -10 <CR>
noremap ,, <Esc>:bnext<CR>
noremap ,. <Esc>:bprevious<CR>
inoremap ;; <Esc>
vnoremap ;; <Esc>
inoremap ,, <End>
vnoremap // y/<C-R>"<CR> 
