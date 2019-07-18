""""""""""""""""""""""""""""""""""""""
"""""""""""ZhiyuanZhao's vimrc""""""""
""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""
""""""""""""""""READ.ME"""""""""""""""
"""""""""""""""""""""""""""""""""""""" 
" 0.pip install yapf (for auto format) 
"   sudo apt-get install ctags (or exuberant-ctags
" 1.git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" 3.cp ./.vimrc ~/.vimrc
" 4.run ":BundleInstall" in vim
" 5.cd ~/.vim/bundle/YouCompleteMe
"   ./install.sh --clang-completer (cmake needed)
" 6.enjoy your vim

""""""""""""""""""""""""""""""""""""""
"""""""""""""" GLOBAL_CONFIG""""""""""
""""""""""""""""""""""""""""""""""""""
if has("syntax")   				 " syntax on
    syntax on
endif
filetype on  					 " filetype on 
filetype plugin indent on 		 " filetype can use
set nocompatible				 " out of vi compatible mode
"set shell=git
set shell=/bin/bash

let g:mapleader="," 			 " leader key
set t_Co=256                     " 256 color
set backspace=2     	         " use backspace delete
set nobackup					 " No autogenerate backup file
set nowritebackup
set noswapfile   				 
set history=50					 " history commend stored	
set ruler         				 " show the cursor position all the time
set showcmd       				 " display incomplete commands
set showmode					 " display current mode
set incsearch    				 " do incremental searching
set hlsearch					 " highlight search result
set ignorecase				 	 " ignore case while searching if input lower-case
set smartcase					 " search upper-case if input upper-case
set laststatus=2  				 " Always display the status line
set autowrite     				 " Automatically :write before running commands
set confirm       				 " Need confrimation while exit
set fileencodings=utf-8,gb18030,gbk,big5 " file encodings
set encoding=utf-8               " encoding
set autoindent					 " auto indent
set smartindent
set foldlevelstart=99            " close auto fold
set tabstop=4					 " tab stop width
set softtabstop=4				 " softtabstop width
set shiftwidth =4			 	 " auto indent width
set shiftround 			     	 " auto align when input << or >>
set expandtab 					 " auto trans tab into space
set fileformat=unix
set showmatch					 " show match parentheses
set linebreak					 " show whole word when linebreak
set whichwrap=b,s,<,>,[,]		 " cursor can change line when reach the end
" set mouse=a					     " enable mouse usage
set number					     " show line number
" set relativenumber				 " show relative number
set numberwidth=4                " number width

colorscheme desert	             " /usr/share/vim/vim73/colors
au WinLeave * set nocursorline nocursorcolumn    " Highlight current line
au WinEnter * set cursorline cursorcolumn
set cursorline 
highlight CursorLine     cterm=NONE ctermbg=grey ctermfg=black guibg=NONE guifg=NONE
set cursorcolumn
highlight CursorColumn   cterm=NONE ctermbg=grey ctermfg=black guibg=NONE guifg=NONE
highlight PMenu ctermfg=0 ctermbg=250 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=250 ctermbg=8 guifg=darkgrey guibg=black
                                 " set highlight menu color

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>			  
nnoremap <C-h> <C-w>h 			 " use control+hjkl replace control+w+hjkl to change window
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l            
                                 " remind me not to use direction keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

vmap "+y :w !pbcopy<CR><CR>      " use "+y to coppy
nmap "+p :r !pbpaste<CR><CR>     " use "+p to paste
""""""""""""""""""""""""""""""""""""""
"""""""""""""" VUNDLE_CONFIG""""""""""
""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

""""""""""""""""""""""""""""""""""""""
""""""""""""""" BUNDLE_LIST"""""""""""
""""""""""""""""""""""""""""""""""""""
Plugin 'gmarik/vundle'			 " manage all bundles		
Plugin 'scrooloose/nerdtree'     " browse dir and file
Plugin 'Valloric/YouCompleteMe'	 " auto complete and syntastic check
Plugin 'kien/ctrlp.vim'			 " ctrlp-too complex,hah,study later 
Plugin 'Lokaltog/vim-powerline'  " powerline to show many things
Plugin 'Raimondi/delimitMate'    " automatic closing of quotes, parenthesis, brackets, etc  
Plugin 'Yggdroot/indentLine'     " show indent space 
Plugin 'kien/rainbow_parentheses.vim' " rainbow parentheses
Plugin 'Chiel92/vim-autoformat'  " auto format
Plugin 'klen/python-mode'        " report all python character-<leader>r to run <leader>b to breakpoint 
Plugin 'easymotion/vim-easymotion' " use <leader><leader>motion(wbjklhs)to jump 
Plugin 'taglist.vim'

filetype on
"""""""""""""""""""""""""""""""""""""
"""""""""""BUNDLE_CONFIG"""""""""""""
"""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""
" nerdTree-|,nt|hjkl|ctrl+hjkl|o|x|i|s|t|P|p|K|J|?|
let NERDChristmasTree=0
let NERDTreeWinSize=40
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
autocmd vimenter * if !argc() | NERDTree | endif 
                                 " Automatically open a NERDTree if no files where specified
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 
						         " Close vim if the only window left open is a NERDTree
nnoremap <leader>f :NERDTreeToggle<cr>		 " use <leader>nt call nerdtree
"""""""""""""""""""""""""""""""""""""
" YouCompleteMe-|,d|C-o|C-i|
"""""""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_complele_in_strings=1
let g:ycm_seed_identifiers_with_symtax=1
set completeopt=menu,menuone
" let g:ycm_python_binary_path = '/home/zhiyuan/.conda/envs/pytorchSource/bin/python'
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_max_num_candidates=10
let g:ycm_max_num_identifier_candidates=5
let g:ycm_show_diagnostics_ui=0  " close the auto analysis
let g:ycm_add_previed_to_completeopt = 0
                                 " do not show the previed to completeopt
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
                                 " support python
let g:ycm_auto_trigger=1
let g:ycm_filetype_whitelist={
                        \ "c":1,
                        \ "cpp":1,
                        \ "objc":1,
                        \ "python":1,
                        \ "sh":1,
                        \ "zsh":1,
                        \ "php":1,
                        \ "java":1,
                        \ "cs":1,
                        \ }
nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>
nnoremap <leader>de :YcmCompleter GoToDefinitionElseDeclaration<CR>
						         "go to definition or declaration
                                 "
" autoformat
au BufWrite *.py :Autoformat            " autoformat when bufwrite *.py
let g:formatter_yapf_style='pep8'     " or google, facebook, chromium
let g:formatdef_allman='"astyle --style=allman --pad-oper"'
let g:formatters_cpp=['allman']
let g:formatters_c=['allman']
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_verbosemode=0
let g:autoformat_remove_trailing_spaces = 0
            

"""""""""""""""""""""""""""""""""""""
" taglist
let Tlist_Use_Right_Window = 1 
let Tlist_File_Fold_Auto_Close = 1 
let Tlist_Show_One_File = 1 
let Tlist_Sort_Type ='name'
let Tlist_GainFocus_On_ToggleOpen = 1 
let Tlist_Exit_OnlyWindow = 1 
let Tlist_WinWidth = 32 
let Tlist_Ctags_Cmd ='/usr/bin/ctags'
nnoremap <leader>t :TlistToggle<CR>


"""""""""""""""""""""""""""""""""""""
" ctrlp ctrl |j|k|x|v|t
set wildignore+=*/tmp/*,*.so,*.swp,*.zip         " MacOSX/Linux"
set laststatus=2 				 " Always display the status line
" use leader c search cur dir
let g:ctrlp_map = '<Leader>C'    
let g:ctrlp_cmd = 'CtrlP'
" use leader m search most recently used
nmap <Leader>M :CtrlPMRUFiles<CR>
" use leader f search buffer file
nmap <Leader>B :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_max_height = 15
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_mruf_max = 500
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 0
let g:ctrlp_line_prefix = '♪ '

" delimitMate

"""""""""""""""""""""""""""""""""""""
" indentLine
let g:indentLine_color_term=239  " mark color
let g:indentLine_char='┆'          " use  ¦ or ┆  to mark indent space   
let g:indentLine_concealcursor='inc'
let g:indentLine_conceallevel =2 
"let g:indentLine_enable=0

"""""""""""""""""""""""""""""""""""""
" rainbow parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max=16
let g:rbpt_loadcmd_toggle=0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"""""""""""""""""""""""""""""""""""""
" powerline
let g:powerline_sumbols='fancy'
set nocompatible


"""""""""""""""""""""""""""""""""""""
" easy motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)

"""""""""""""""""""""""""""""""""""""
"python mode
let g:pymode_rope=0               " turn off the rope
let g:pymode_warnings=0
let g:pymode_options_max_line_length=129
let g:pymode_options_colorcolumn=0
let g:pymode_lint_cwindow = 0


"""""""""""""""""""""""""""""""""""""
" auto add head info for .py file
function HeaderPython()
    call append(1, "")
    call append(1, "")
    call setline(1, "# -*- coding: utf-8 -*-")
    call append(1, "# ------------------------- #")
    call append(1, "# Stay foolish, stay hungry.#")
    call append(1, "#   Auther: William Zhao    #")
    normal G
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()
