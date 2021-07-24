""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-commentary'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'posva/vim-vue'
Plug 'djoshea/vim-autoread'
Plug 'slim-template/vim-slim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-python/python-syntax'
Plug 'cohama/lexima.vim'
Plug 'mattn/emmet-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'uiiaoo/java-syntax.vim'
Plug 'udalov/kotlin-vim'
Plug 'fatih/vim-go'
Plug 'Quramy/tsuquyomi'
Plug 'prettier/vim-prettier', {
			\ 'do': 'yarn install',
			\ 'for': ['javascript', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'peitalin/vim-jsx-typescript'
Plug 'eslint/eslint'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rescript-lang/vim-rescript'
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'rust-lang/rust.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

call plug#end()
"""""""""""""""""""""""""""""

autocmd! GUIEnter * set vb t_vb=
set fileformat=unix
set nocompatible
set noswapfile
set number
set relativenumber

set wildmenu
set wildmode=list:longest

set mouse=a
set expandtab
set backspace=indent,eol,start
set clipboard+=unnamed
set hidden

set syntax=on
set nowrap
set tabstop=2
set noexpandtab
set shiftwidth=2
set nocindent

set ttyfast
set lazyredraw
set fileencodings=utf8

" Theme
set background=dark
" set termguicolors
colorscheme dracula
set guifont=DejaVu_Sans_Mono_for_Powerline:h12

" Language
set langmenu=en_US.UTF-8
language messages en_US.UTF-8

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='dracula'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=${SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" Vue
let g:vue_pre_processors = ['pug', 'scss']

function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Coc
let g:coc_global_extensions = [
			\ 'coc-tsserver'
			\ ]

let t:is_transparent=0
hi Normal guibg=NONE ctermbg=NONE
function! Toggle_transparent_background()
  if t:is_transparent == 0
    hi Normal guibg=#444444 ctermbg=black
    let t:is_transparent=1
  else
    hi Normal guibg=NONE ctermbg=NONE
    let t:is_transparent=0
  endif
endfunction

" Close buffer properly with NERDtree
let g:bclose_multiple=0
function! s:Bclose(bang, buffer)
	if empty(a:buffer)
		let btarget = bufnr('%')
	elseif a:buffer =~ '^\d\+$'
		let btarget = bufnr(str2nr(a:buffer))
	else
		let btarget = bufnr(a:buffer)
	endif
	if btarget < 0
		call s:Warn('No Matching buffer for '.a:buffer)
	return
	endif
	if empty(a:bang) && getbufvar(btarget, '&modified')
		call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
		return
	endif
	" Numbers of windows that view target buffer which we will delete.
	let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
	if !g:bclose_multiple && len(wnums) > 1
		call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
		return
	endif
	let wcurrent = winnr()
	for w in wnums
		execute w.'wincmd w'
		let prevbuf = bufnr('#')
		if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
			buffer #
		else
			bprevious
		endif
		if btarget == bufnr('%')
			let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
			let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
			let bjump = (bhidden + blisted + [-1])[0]
			if bjump > 0
				execute 'buffer '.bjump
			else
				execute 'enew'.a:bang
			endif
		endif
	endfor
	execute 'bdelete'.a:bang.' '.btarget
	execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose('<bang>', '<args>')
nnoremap <silent> <Leader>bd :Bclose<CR>
nnoremap <silent> <Leader>bD :Bclose!<CR>

" Chain vimgrep and copen
augroup qf
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l*    cwindow
  autocmd VimEnter        *     cwindow
augroup END

" Change cursor appearance depending on the current mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Python Syntax
let g:python_highlight_all=1

" HTML Syntax
let g:user_emmet_leader_key=','

" Cpp function Syntax
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

" Java AutoImport Plugin
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" vim-go settings
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" typescript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" haskell
filetype plugin indent on
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1

" tabs
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype typescript setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype typescriptreact setlocal expandtab tabstop=2 shiftwidth=2

autocmd Filetype haskell setlocal expandtab tabstop=2 shiftwidth=2

autocmd Filetype dart setlocal expandtab tabstop=2 shiftwidth=2

""""""""""""""""""""""""""""""""
" Custom bindings
""""""""""""""""""""""""""""""""

" Browse  tabs
:nnoremap <C-p> :bnext<CR>
:nnoremap <C-o> :bprevious<CR>

nnoremap <tab> <c-w>w
nnoremap <S-tab> <c-w>W

" Map Control S for save
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C> :update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" Comment block
vnoremap <silent> <C-k> :Commentary<cr>

" Close current window
nnoremap <silent> <C-q> :q<cr>

" Toggle Nerdtree
noremap <silent> <C-f> :NERDTreeToggle<CR>
noremap <silent> <Leader>r :NERDTreeRefreshRoot<CR>

" Select all
map <C-a> <esc>ggVG<CR>

" Toggle Transparent Background
nnoremap <C-x><C-t> :call Toggle_transparent_background()<CR>

" Movement in i mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" Mapping ESC
imap qq <Esc>
imap jk <Esc>
imap kj <Esc>

" Mapping Enter & Backspace to new line & Erase
nnoremap <CR> o<Esc>
nnoremap <BS> X

" Golang Keymappings
map <F5> :GoRun<CR>

" Typescript Keymappings
autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
autocmd FileType typescript nmap <buffer> <Leader>E <Plug>(TsuquyomiRenameSybolC)
noremap <silent> <Leader>ti :TsuImport<CR>

" Prettier
nnoremap <Leader>ff :Prettier<CR>

" Rust
nnoremap <Leader>rr :RustRun<CR>
nnoremap <Leader>rf :RustFmt<CR>
