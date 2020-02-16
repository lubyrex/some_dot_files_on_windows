" set autochdir
set nowrap
set langmenu=en_US
let $LANG = 'en_US'
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
set nofixendofline


" VUNDLE REQUIRED??
set nocompatible              " be iMproved, required 
filetype off                  " required

" Experimental control-c to esc:
" vnoremap <C-c> <Esc>
inoremap <C-c> <Esc>

" Experimental command line options
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
" nvim
cnoremap <A-b> <S-Left>
cnoremap <A-f> <S-Right>

    " if !has('nvim')
    " endif
    
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" set :find to run recursively
set path+=**
" set relative and absolute line number also lose rnu after losing focus
set nu rnu
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set ff=unix
set ffs=unix,dos
" paste to system clip board "
" set clipboard+=unnamedplus
" set clipboard^=unnamed,unnamedplus
set foldmethod=marker
set colorcolumn=79
" call dasung#Dasung() 
" color eink
autocmd CompleteDone * pclose

" auto complete like bash but more
set wildmode=longest,list,full
set wildmenu

" set hlsearch
set hlsearch

" windows clipboard
" if has('windows')
" augroup Yank
" autocmd!
" autocmd TextYankPost * :call system('clip.exe ',@")
" augroup END
" endif

if has('nvim')"{{{
    " all of coc:
	" if hidden is not set, TextEdit might fail.
	set hidden

	" Some servers have issues with backup files, see #649
	set nobackup
	set nowritebackup

	" Better display for messages
	set cmdheight=2

	" You will have bad experience for diagnostic messages when it's default 4000.
	set updatetime=300

	" don't give |ins-completion-menu| messages.
	set shortmess+=c

	" always show signcolumns
	set signcolumn=yes

	" Map <tab> to trigger completion and navigate to the next item: >{{{
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    inoremap <silent><expr> <TAB>
		  \ pumvisible() ? "\<C-n>" : 
		  \ <SID>check_back_space() ? "\<TAB>" :
		  \ coc#refresh()"}}}

	" " let g:coc_snippet_next = '<tab>'

	" Use <c-space> to trigger completion.
	inoremap <silent><expr> <c-space> coc#refresh()

	" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
	" Coc only does snippet and additional edit on confirm.
	" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	" Or use `complete_info` if your vim support it, like:
	" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"


	" " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
	" nmap <silent> <C-d> <Plug>(coc-range-select)
	" xmap <silent> <C-d> <Plug>(coc-range-select)

	" Use `:Format` to format current buffer
	command! -nargs=0 Format :call CocAction('format')

	" Use `:Fold` to fold current buffer
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	" use `:OR` for organize import of current buffer
	command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

	" Add status line support, for integration with other plugin, checkout `:h coc-status`
    set statusline^=\ youle\ %f

	set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')} 
    " set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}

    

	" Using CocList
	" Show all diagnostics
	nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
	" Manage extensions
	nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
	" Show commands
	nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
	" Find symbol of current document
	nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
	" Search workleader symbols
	" nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
	" Show Files
	nnoremap <silent> <leader>f  :<C-u>CocList files<cr>
    " Show mru
    nnoremap <silent> <leader>m  :<C-u>CocList --normal mru<cr>
    " Show grep
    nnoremap <silent> <leader>g  :<C-u>CocList grep<cr>

	" Do default action for next item.
	nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
	" Do default action for previous item.
	nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
	" Resume latest coc list
	nnoremap <leader>p  :<C-u>CocListResume<CR>

    " (diagnostic-info)
    nmap <silent> gh <Plug>(coc-diagnostic-info)

    " GIT RELATED
	" Use `[c` and `]c` to navigate diagnostics{{{
	" nmap  [c <Plug>(coc-git-prevchunk)
	" nmap  ]c <Plug>(coc-git-nextchunk)

    " show chunk diff at current position
    nmap gs <Plug>(coc-git-chunkinfo)
    " show commit contains current position
    " nmap gc <Plug>(coc-git-commit)
    " create text object for git chunks
    omap ig <Plug>(coc-git-chunk-inner)
    xmap ig <Plug>(coc-git-chunk-inner)
    omap ag <Plug>(coc-git-chunk-outer)
    xmap ag <Plug>(coc-git-chunk-outer)"}}}

	" Use `[g` and `]g` to navigate diagnostics
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

	" Remap keys for gotos
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

    " show diagnostics on current line
    nmap <silent> gh <Plug>(coc-diagnostic-info)

	" Use K to show documentation in preview window
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
	  if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	  else
		call CocAction('doHover')
	  endif
	endfunction

	" Highlight symbol under cursor on CursorHold
	autocmd CursorHold * silent call CocActionAsync('highlight')

	" Remap for rename current word
	nmap <leader>rn <Plug>(coc-rename)

	" " Remap for format selected region
	" xmap <leader>f  <Plug>(coc-format-selected)
	vmap <leader>f  <Plug>(coc-format-selected)

	augroup mygroup
	  autocmd!
	  " Setup formatexpr specified filetype(s).
	  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	  " Update signature help on jump placeholder
	  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
      " set fold format
      autocmd FileType typescript setl foldmethod=syntax foldnestmax=2
	augroup end

	" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
	xmap <leader>a  <Plug>(coc-codeaction-selected)
	nmap <leader>a  <Plug>(coc-codeaction-selected)

	" Remap for do codeAction of current line
	nmap <leader>ac  <Plug>(coc-codeaction)
	" Fix autofix problem of current line
	nmap <leader>qf  <Plug>(coc-fix-current)

	" " Create mappings for function text object, requires document symbols feature of languageserver.
	" xmap if <Plug>(coc-funcobj-i)
	" xmap af <Plug>(coc-funcobj-a)
	" omap if <Plug>(coc-funcobj-i)
	" omap af <Plug>(coc-funcobj-a)

    " PLUGINS{{{
    " call plug#begin(stdpath('data') . '/plugged')
    " call plug#begin(stdpath('config') . '/plugged')
    call plug#begin()
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'tpope/vim-fugitive'
    " colors plugs:
    Plug 'chriskempson/base16-vim'
    Plug 'reedes/vim-colors-pencil'
    Plug 'kisom/eink.vim'
    Plug 'https://git.sr.ht/~romainl/vim-bruin'
    " Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-repeat'
    Plug 'justinmk/vim-sneak'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    call plug#end()

    " Add status line support, for integration with other plugin, checkout `:h coc-status`
    set statusline^=\ youle\ %f

    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')} 
    

    " Using CocList
    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Show Files
    nnoremap <silent> <space>f  :<C-u>CocList files<cr>
 
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <space>p  :<C-u>CocListResume<CR>

    " easymotion/vim-easymotion
    " map <leader> <Plug>(easymotion-prefix)
    let g:EasyMotion_smartcase = 1
    let g:EasyMotion_use_upper = 1
    let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
    map <leader>s <Plug>(easymotion-bd-f2)
    map <leader>w <Plug>(easymotion-bd-w)

    " justinmk/vim-sneak
    " s and S for search double
    map f <Plug>Sneak_f
    map F <Plug>Sneak_F
    map t <Plug>Sneak_t
    map T <Plug>Sneak_T


    " colorschems:
    "
    " pencil:
    " colorscheme pencil
    set background=dark
    " let g:pencil_higher_contrast_ui = 0   " 0=low (def), 1=high
    ""
    " base16:
    set termguicolors
    " colorscheme base16-grayscale-light
    colorscheme pencil
    map <C-n> :NERDTreeToggle<CR>

    autocmd FileType json syntax match Comment +\/\/.\+$+
    " set completeopt=longest,menuone

    " terminal esc to escape temrinal mode
    tnoremap <Esc> <C-\><C-n>

"    " floating window color fix 
"    hi Pmenu guibg=White guifg=Black
"    hi CocInfoSign guifg=Black
"
"    " highlight
"    " GitGutterDeleteIntraLine	GitGutterDeleteIntraLine
"    " CocUnderline	CocUnderline CocErrorHighlight CocWarningHighlight CocInfoHighlight CocHintHighlight
"    " CocErrorSign	CocErrorSign CocErrorFloat CocErrorVirtualText
"    " CocWarningSign	CocWarningSign CocWarningFloat CocWarningVirtualText
"    " CocInfoSign	CocInfoSign CocInfoFloat CocInfoVirtualText
"    " CocHintSign	CocHintSign CocHintFloat CocHintVirtualText
"    let g:gitgutter_highlight_linenrs = 1
endif"}}}
set ignorecase
set smartcase

" windows configurations

" leader key to space bar
map <SPACE> <leader>
map <SPACE><SPACE> <leader><leader>
" nnoremap <SPACE> <Nop>
" let mapleader=" "
" Cocextensions
" coc-git
" coc-list
