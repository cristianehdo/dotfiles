
let vimdir = '~/.config/nvim/'
let was_installed = 1

if !filereadable(expand(vimdir . "autoload/plug.vim"))
  call system('curl -fLo ' . vimdir . 'autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  execute 'source ' . vimdir . 'autoload/plug.vim'
  let was_installed = 0
endif

call plug#begin('~/.vim/plugged')
" lint and fixer
Plug 'dense-analysis/ale'
" Airline for the tabs
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'honza/vim-snippets'
" Comment in/out stuff easily
Plug 'tomtom/tcomment_vim'
" Auto close pairs
Plug 'jiangmiao/auto-pairs'
" " Ctags
" Plug 'ludovicchabant/vim-gutentags'
" Unpaired
Plug 'tpope/vim-unimpaired'
" Git Diff
Plug 'airblade/vim-gitgutter'
" Show lines changed
Plug 'airblade/vim-gitgutter'
" Multple cursors is hot
Plug 'terryma/vim-multiple-cursors'
""" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
" CoolIcons
Plug 'ryanoasis/vim-devicons'
" Polyglot
Plug 'sheerun/vim-polyglot'
" Ruby
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-cucumber'
Plug 'janko-m/vim-test'
" Multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Change background of inactive windows
Plug 'blueyed/vim-diminactive'

" Colorschemes/themes
Plug 'morhetz/gruvbox'
" solarized
" Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'

" Display indent steps
Plug 'Yggdroot/indentLine'
" Add end to ruby blocks automatically
Plug 'tpope/vim-endwise'
" Make . work with surround (and other plugins)
Plug 'tpope/vim-repeat'
" Git
Plug 'tpope/vim-fugitive'
" Easily change delimiters
Plug 'tpope/vim-surround'
" Highlight colors
Plug 'ap/vim-css-color'
" Automatically change dir when opening files
Plug 'airblade/vim-rooter'
" Many handy text objects
Plug 'wellle/targets.vim'
" Ruby blocks text object
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
"whitespace
Plug 'ntpeters/vim-better-whitespace'
" JS highlighting and indent support. Sometimes buggy, but has support for
" " jsdocs and flow
Plug 'pangloss/vim-javascript', { 'for': ['javascript']}
"buffer files
Plug 'Shougo/denite.nvim'
" splitjoin
Plug 'AndrewRadev/splitjoin.vim'
" using ctrl + h/j/k/l on tmux
Plug 'christoomey/vim-tmux-navigator'
" utils
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'

" autocomplete
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'neovim/nvim-lspconfig'
Plug 'prabirshrestha/vim-lsp'
Plug 'overcache/NeoSolarized'
Plug 'preservim/nerdtree'
Plug 'APZelos/blamer.nvim'
Plug 'numkil/ag.nvim'

call plug#end()


if !was_installed
  PlugInstall
endif

set encoding=utf8

let g:mapleader=","
let mapleader=","

set number
set relativenumber
set autoread
set ruler

syntax enable
" colorscheme solarized8_high
colorscheme NeoSolarized
" colorscheme gruvbox

set termguicolors
set background=dark
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/
set cursorline!
set wrap
set textwidth=99
set formatoptions=tcqrn1
set noshiftround
set lazyredraw

set hidden
set mouse=a

" set diff options
set diffopt=filler,vertical

" Status bar
set laststatus=2

" turn on syntax highlighting
" syntax on
" highlight to vim-clojure-static
filetype plugin indent on

" Turn off swap and backup files
set noswapfile
set nobackup
set nowb

" Indentation
set autoindent
set smartindent
set smartcase

" Last line
set showmode
set showcmd

" Share the clipboard outside of macvim
set clipboard+=unnamedplus

" Highlight search results
" set hlsearch
set nohlsearch

" Disable bloated stuff that is on by default.
let g:loaded_2html_plugin = 1
let g:loaded_gzip = 1
let g:loaded_tarPlugin = 1 " May cause problems with fireplace
let g:loaded_zipPlugin = 1
let g:loaded_netrwPlugin = 1

" airline
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
let g:tmuxline_preset = 'full'
" install nerd font

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" ale configs
" use rubocop
let g:ale_fixers = {
      \   'ruby': ['rubocop', 'trim_whitespace', 'remove_trailing_lines'],
      \   'javascript': ['prettier', 'eslint']
      \}

let g:ale_linters = {
      \   'ruby': ['rubocop', 'solargraph', 'ruby'],
      \   'javascript': ['eslint']
      \}

" Lint Ruby files with binstub
let g:ale_ruby_rubocop_executable = 'bin/rubocop'
let g:ale_ruby_solargraph_executable = 'solargraph'
let g:ale_ruby_solargraph_options = {}
let g:ale_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1


" Tune linter's error and warning signs
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" Let's leave a column for the signs so that the left side of the window doesn't move
let g:ale_sign_column_always = 1

let g:ruby_host_prog = '~/.rbenv/versions/2.6.1/bin/neovim-ruby-host'

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" update time to refresh gitgutter
set updatetime=100

" indentLine config
set conceallevel=1
let g:indentLine_conceallevel=1

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Make it obvious where 80 characters is
" at deco we use 100
set textwidth=99
set colorcolumn=+1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

so ~/.config/nvim/mappings.vim

let @" = expand("%:p")

nnoremap <leader>/ :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

set switchbuf+=usetab,newtab
