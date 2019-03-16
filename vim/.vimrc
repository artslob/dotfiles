"*** BASIC ***
set nocompatible  "Turn of compatibility with vi
set background=dark  " Assume a dark background

"*** CUSTOM ***
let mapleader=" "  "Extra key combinations with <leader>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>r :so ~/.vim/vimrc<cr>

"*** MISCELLANEOUS ***
set showcmd       "Show (partial) command in status line
set confirm       "Display a confirmation dialog when closing an unsaved file.
set history=500   "Increase the undo limit
set showmatch     "Show matching brackets
set autoread      "Automatically re-read files if unmodified inside Vim
set hidden        "Hide files in the background instead of closing them.
filetype on

"Vim jump to last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


"*** USER INTERFACE OPTIONS ***
set laststatus=2  "Always display the status bar.
set ruler         "Always show cursor position.
set wildmenu      "Display command line’s tab complete options as a menu.
set tabpagemax=50 "Maximum number of tab pages that can be opened from the command line.
set cursorline    "Highlight the line currently under cursor.
set number        "Show line numbers on the sidebar.
"set relativenumber "Show line number on the current line and relative numbers on all other lines
set noerrorbells  "Disable beep on errors.
set visualbell    "Flash the screen instead of beeping on errors.
set mouse=a       "Enable mouse for scrolling and resizing.
set title         "Set the window’s title, reflecting the file currently being edited.

"*** TEXT RENDERING***
syntax on         "Enable syntax highlighting.
set wrap          "Enable line wrapping.
set encoding=utf-8  "Use an encoding that supports unicode.
set linebreak     "Avoid wrapping a line in the middle of a word.
"let g:PaperColor_Theme_Options = {
\   'theme': {
\       'default': {
\           'transparent_background': 1,
\           'allow_bold': 1,
\       },
\       'default.dark': {
\           'transparent_background': 0,
\           'override': {
\               'color00': ['', 0],
\               'color03': ['', 222],
\               'color06': ['', 121],
\               'color07': ['', 15],
\               'color09': ['', 154],
\               'color10': ['', 196],
\               'color11': ['', 39],
\               'color12': ['', 211],
\               'color13': ['', 27],
\               'color14': ['', 154],
\               'color15': ['', 211],
\               'color16': ['', 214],
\               'cursorline': ['', 235],
\           }
\       }
\   },
\   'language': {
\       'python': {
\           'highlight_builtins': 1
\       }
\   },
\}
"color PaperColor
"let g:badwolf_darkgutter = 1
"color badwolf
if (has("autocmd")) && !has("gui_running")
    augroup colorextend
        autocmd!
        autocmd ColorScheme * call onedark#extend_highlight("Normal", {"bg": {"cterm": 0, "cterm16": 0}})
    augroup END
endif
colorscheme onedark

"*** INDENTION ***"
set autoindent    "New lines inherit the indentation of previous lines.
set expandtab     "Convert tabs to spaces.
filetype plugin indent on  " Automatically detect file types.
set shiftround    "When shifting lines, round the indentation to the nearest multiple of 'shiftwidth.'
set shiftwidth=4  "When shifting, indent using four spaces.
set smarttab      "Insert 'tabstop' number of spaces when the 'tab' key is pressed.
set tabstop=4     "Indent using four spaces

"*** SEARCH OPTIONS ***"
set hlsearch      "Enable search highlighting.
set ignorecase    "Ignore case when searching.
set incsearch     "Incremental search that shows partial matches.
set smartcase     "Automatically switch search to case-sensitive when search query contains an uppercase letter.

