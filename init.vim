" plugins
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'chrisbra/Colorizer'
    Plug 'joshdick/onedark.vim'
    Plug 'sainnhe/everforest'
    Plug 'vim-airline/vim-airline'
    Plug 'ap/vim-buftabline'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-sensible'
    Plug 'tommcdo/vim-fugitive-blame-ext'
    Plug 'scrooloose/nerdcommenter'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'w0rp/ale'
    Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --rust-completer'}
    Plug 'tmhedberg/SimpylFold'
    Plug 'rust-lang/rust.vim'
    Plug 'Raimondi/delimitMate'
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-context'
    Plug 'echasnovski/mini.nvim'
call plug#end()

" style
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif
syntax on
set title
set number
set laststatus=2
set splitbelow
set previewheight=15

set colorcolumn=80
highlight ColorColumn ctermbg=8

let g:buftabline_indicators=1
let g:buftabline_separators=0

colorscheme everforest
highlight Normal guibg=none
highlight NonText guibg=none
highlight NormalNC guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight NormalNC ctermbg=none

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

" spaces instead of tabs
set tabstop=4
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4

" misc
set showcmd
set autoindent
set undolevels=1000
set incsearch                                   " incremental search
set hlsearch                                    " highlight search
set hidden                                      " keep buffer undo history
set ignorecase                                  " case insensitive search
set smartcase                                   " case insensitive search if all lower case

" display unncessary whitespace & tabs
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

function! Runfile()
    if &filetype == 'python'
        !chmod +x %
        20split term://./%
        call feedkeys("\<CR>a")
    elseif &filetype == 'rust'
        20split term://cargo run
        call feedkeys("a")
    endif
endfunction

function! Formatfile()
    if &filetype == 'python'
        ALEFix ruff_format
    elseif &filetype == 'rust'
        ALEFix rustfmt
    endif

endfunction

nnoremap <Space> @m
vnoremap <Space> <C-\><C-o>@m
inoremap <C-Space> <C-\><C-o>@m
vnoremap <C-Space> <C-\><C-o>@m
nnoremap <C-Space> @m

" F4 executes the current file
inoremap <silent> <F4> <ESC>:call Runfile()<CR>
nnoremap <silent> <F4> <ESC>:call Runfile()<CR>
" F3 runs `blue` to reformat python code
inoremap <silent> <F3> <ESC>:call Formatfile()<CR>a
nnoremap <silent> <F3> <ESC>:call Formatfile()<CR>
" switch tabs
inoremap <silent> <C-PageUp>    <ESC>:bp!<CR>
nnoremap <silent> <C-PageUp>    <ESC>:bp!<CR>
inoremap <silent> <C-PageDown>  <ESC>:bn!<CR>
nnoremap <silent> <C-PageDown>  <ESC>:bn!<CR>



" switch windows
inoremap <silent> <M-Down>  <ESC><C-w>j
inoremap <silent> <M-Up>    <ESC><C-w>k
inoremap <silent> <M-Left>  <ESC><C-w>h
inoremap <silent> <M-right> <ESC><C-w>l
nnoremap <silent> <M-Down>  <ESC><C-w>j
nnoremap <silent> <M-Up>    <ESC><C-w>k
nnoremap <silent> <M-Left>  <ESC><C-w>h
nnoremap <silent> <M-right> <ESC><C-w>l
tnoremap <silent> <M-Down>  <C-\><C-o><C-w>j
tnoremap <silent> <M-Up>    <C-\><C-o><C-w>k
tnoremap <silent> <M-Left>  <C-\><C-o><C-w>h
tnoremap <silent> <M-right> <C-\><C-o><C-w>l

"NvimTree
"inoremap <silent> <Tab><Tab> <ESC>:NvimTreeFocus<CR>
vnoremap <silent> <Tab><Tab> <ESC>:NvimTreeFocus<CR>
tnoremap <silent> <Tab><Tab> <ESC>:NvimTreeFocus<CR>
nnoremap <silent> <Tab><Tab> <ESC>:NvimTreeFocus<CR>

" YCM commands
inoremap <silent> <leader>g <C-\><C-o>:YcmCompleter GoTo<CR>
nnoremap <silent> <leader>g :YcmCompleter GoTo<CR>
inoremap <silent> <leader>t <C-\><C-o>:YcmCompleter GetType<CR>
nnoremap <silent> <leader>t :YcmCompleter GetType<CR>
inoremap <silent> <leader>d <C-\><C-o>:YcmCompleter GetDoc<CR>
nnoremap <silent> <leader>d :YcmCompleter GetDoc<CR>
inoremap <leader>r <C-\><C-o>:YcmCompleter RefactorRename 
nnoremap <leader>r :YcmCompleter RefactorRename 
inoremap <silent> <leader>c <C-\><C-o>:%bd\|e#\|bd#<CR>
nnoremap <silent> <leader>c :%bd\|e#\|bd#<CR>

inoremap <silent> <leader>h <C-\><C-o>:nohls<CR>
vnoremap <silent> <leader>h <C-\><C-o>:nohls<CR>
nnoremap <silent> <leader>h :nohls<CR>

" Folding options
let g:SimpylFold_docstring_preview = 1
set foldlevel=8
set foldmethod=syntax


" ALE options
let g:ale_echo_msg_error_str = 'ERROR'
let g:ale_echo_msg_warning_str = 'WARNING'
let g:ale_echo_msg_format = '%linter%: [%code%] %s [%severity%]'

let g:ale_use_neovim_diagnostics_api = 1
let g:ale_virtualtext_prefix = ' ■ %linter%: [%code%] '
let g:ale_virtualtext_delay = 0
let g:ale_virtualtext_single = 0
"rust specific
let g:ale_rust_cargo_use_clippy = 1
let g:ale_rust_rustfmt_options = 'run nightly -- rustfmt --edition 2018 --'
let g:ale_rust_rustfmt_executable = 'rustup'



" lua code for additional configuration
lua <<EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.diagnostic.config({
    virtual_text = {
        source = false,
        prefix = '■',
        format =    function(diagnostic)
                        if diagnostic.code == nil then
                            return string.format(
                                "[%s] %s",
                                diagnostic.source,
                                diagnostic.message
                            )
                        else
                            return string.format(
                                "[%s] %s [%s]",
                                diagnostic.source,
                                diagnostic.message,
                                diagnostic.code
                            )
                        end
                    end
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'if_many',
        header = '',
        prefix = '',
    },
})

local function nvimtreemappings(bufnr)
  local api = require "nvim-tree.api"
  local function opts(desc)
    return { 
      desc = "nvim-tree: " .. desc, 
      buffer = bufnr, 
      noremap = true, 
      silent = true, 
      nowait = true,
    }
  end
  local function unfocus()
    vim.cmd("wincmd l")
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<Tab><Tab>', unfocus,                opts('Unfocus'))
  vim.keymap.set('n', '<Tab>',      api.node.open.edit,     opts('Open'))
  vim.keymap.set('n', '<C-e>',      api.tree.close,         opts('Close'))
end

require('nvim-tree').setup {
  on_attach = nvimtreemappings
}

require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "rust" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}


require('treesitter-context').setup{
  enable = true,
  max_lines = 0,
  min_window_height = 0,
  line_numbers = true,
  multiline_threshold = 20,
  trim_scope = 'outer',
  mode = 'cursor',
  separator = nil,
  zindex = 20,
  on_attach = nil,
}

local map = require('mini.map')
map.setup({
    symbols = {
        encode = map.gen_encode_symbols.dot('4x2'),
        scroll_line = '▓',
        scroll_view = '░',
    },
})
map.open()

EOF
