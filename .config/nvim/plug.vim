if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

  " Convenience
  Plug 'tpope/vim-fugitive'                                   "> Git wrapper
  Plug 'tpope/vim-rhubarb'                                    "> GitHub extension
  Plug 'machakann/vim-highlightedyank'                        "> More apparent yanked region
  Plug 'mhinz/vim-startify'                                   "> Fancy start screen
  " Text editing
  Plug 'tpope/vim-commentary'                                 "> Comment stuff out
  Plug 'godlygeek/tabular'                                    "> Alignment
  Plug 'tpope/vim-repeat'                                     "> enable repeating supported plugin
  Plug 'tpope/vim-surround'                                   "> quoting/parenthesizing
  " Lsp and IDE features
  Plug 'neovim/nvim-lspconfig'                                "> LSP client
  Plug 'hrsh7th/nvim-compe'                                   "> Auto completion
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "> Language parsers, syntax coloring and other
  " Navigation
  Plug 'nvim-telescope/telescope.nvim'                        "> Find, Filter, Preview
  Plug 'nvim-lua/popup.nvim'                                  "> telescope.nvim dependency
  Plug 'nvim-lua/plenary.nvim'                                "> telescope.nvim dependency
  Plug 'rbgrouleff/bclose.vim'                                "> Buffer fix for previaus plugin
  Plug 'kevinhwang91/rnvimr'                                  "> Ranger file manager integration
  " Looks
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'overcache/NeoSolarized'

call plug#end()
 
"-----------------------------------------------------
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}'
" Plugin graveyard (unused plugins)
" Plug 'nvim-lua/completion-nvim'
" Plug 'cohama/lexima.vim'
" Plug 'nvim-lua/popup.nvim'
" Plug 'francoiscabrol/ranger.vim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'altercation/vim-colors-solarized'
" Plug 'jiangmiao/auto-pairs'
