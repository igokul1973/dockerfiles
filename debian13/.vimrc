"============== INITIAL SETTINGS ==============="

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" required for Vundle
filetype off         
" The default Leader is \, but a comma is much better
let mapleader = ','
" Show the line numbers
set number
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Create no backup files
autocmd FileType crontab setlocal nowritebackup
set nobackup
" Set 4 spaces for each indentation level. Tabs are not used."
set softtabstop=4 shiftwidth=4 expandtab

set history=100		" keep 100 lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands

if has("gui_macvim") 
    " In MacVim one can use Alt as Meta key 
    set macmeta
endif

"================== PLUGINS ==================="

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Keeping plugins and their settings in a separate file
source ~/.vim/plugins.vim

call vundle#end()




"================== VISUALS ==================="

" Setting up the font
set guifont=Monaco:h13
" Setting up the line space
set linespace=2

" Setting color scheme
" set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
"colorscheme solarized
colorscheme desert

"============== SPLIT MANAGEMENT =============="

" Obviously adds split windows and places
" cursor below or to the right respectively
set splitbelow
set splitright

" Map splitting to simpler shortcut
" Move between windows
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>



"====================== SEARCH ======================="

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set incsearch
endif


"==================== MAPPINGS ======================"

" Open .vimrc in vim (default editor) in a new vertical split
" (Insert *:tabedit* instead of *:vsp* if you want to open the
" file in a new tab)
nmap ,ev :vsp $MYVIMRC<CR>
" ';' symbol at the end of line in insert mode
inoremap <Leader>; <Esc><S-a>;
" ';' symbol at the end of line in command mode
nnoremap <Leader>; <S-a>;<Esc>
" ',' symbol at the end of line in insert mode
inoremap <Leader>, <Esc><S-a>,
" ',' symbol at the end of line in command mode
nnoremap <Leader>, <S-a>,<Esc>
" '.' symbol at the end of line in insert mode
inoremap <Leader>. <Esc><S-a>.
" '.' symbol at the end of line in command mode
nnoremap <Leader>. <S-a>.<Esc>

" Move to the end of line in Insert mode
inoremap <C-E> <C-o>$
" Move to the end of line in Normal mode
noremap <C-E> $

" Escape to Normal mode
imap jj <Esc>

" Resize windows
noremap <C-M>u <C-W>+ " up
noremap <C-M>d <C-W>- " down
noremap <C-M>r <C-W>< " right
noremap <C-M>l <C-W>> " left
" Make all windows equal
noremap <C-M>e <C-W>=

" Jump over the character in insert mode
inoremap <S-Enter> <Esc>la

if has("gui_macvim") 
      " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
      " the right side. Ctrl-Shift-Tab goes the other way.
      noremap <C-Tab> :tabnext<CR>
      noremap <C-S-Tab> :tabprev<CR>

      " Switch to specific tab numbers with Command-number
      noremap <D-1> :tabn 1<CR>
      noremap <D-2> :tabn 2<CR>
      noremap <D-3> :tabn 3<CR>
      noremap <D-4> :tabn 4<CR>
      noremap <D-5> :tabn 5<CR>
      noremap <D-6> :tabn 6<CR>
      noremap <D-7> :tabn 7<CR>
      noremap <D-8> :tabn 8<CR>
      noremap <D-9> :tabn 9<CR>
      " Command-0 goes to the last tab
      noremap <D-0> :tablast<CR>
endif

" Insert line when Enter key is presse
" nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Toggle NerdTree
" nmap <Leader><Leader> :NERDTreeToggle<cr>
nmap <Leader>m :NERDTreeToggle<cr>

" CtrlP mappings
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
" Go to any symbol in the file
nmap <Leader>as :CtrlPBufTag<CR>
" Go to 'most recently used' files
nmap <Leader>e :CtrlPMRUFiles<CR>




"================= AUTO-COMMANDS ================"
"
" Automatically source the Vimrc file on save.
" Add group so that saving didn't take too long
if has("autocmd")
	augroup autosourcing
		autocmd!
		autocmd BufWritePost .vimrc source %
	augroup END
endif





"=============== MISCELLANEOUS +==============="

" Get out of quotes, brackets and parentheses

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif


" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
	  au!

	  " For all text files set 'textwidth' to 78 characters.
	  autocmd FileType text setlocal textwidth=78

	  " When editing a file, always jump to the last known cursor position.
	  " Don't do it when the position is invalid or when inside an event handler
	  " (happens when dropping a file on gvim).
	  " Also don't do it when the mark is in the first line, that is the default
	  " position when opening a file.
	  autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


