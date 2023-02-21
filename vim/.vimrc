call plug#begin()

"Themes
"Plug 'morhetz/gruvbox'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/lsp-colors.nvim'
" Plug 'savq/melange'
" Plug 'EdenEast/nightfox.nvim'
" Plug 'arcticicestudio/nord-vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

"nvim core
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

"file explorer
Plug 'nvim-telescope/telescope.nvim'

"lines 
Plug 'akinsho/bufferline.nvim'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'vim-airline/vim-airline'
Plug 'nvim-lualine/lualine.nvim'
"Syntax tree highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Color highlight
Plug 'https://github.com/chrisbra/Colorizer'

"completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/nvim-cmp'

"snippets
Plug 'L3MON4D3/LuaSnip'

Plug 'onsails/lspkind-nvim'

"Auto pairs
"Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-autopairs'

"Commenting out shortcut
Plug 'b3nj5m1n/kommentary'

"indent line 
Plug 'lukas-reineke/indent-blankline.nvim'

" File explorer
" Plug 'preservim/nerdtree'
call plug#end()

set title
set clipboard=unnamedplus
set backspace=indent,eol,start
set mouse=a
set cursorcolumn
set number
set relativenumber
set backspace=indent,eol,start 	    	" Ensure backspace always works
set scrolloff=30
set smarttab
set autoindent
set exrc
set copyindent
set expandtab			            	" Use spaces
set hidden
set softtabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set signcolumn=yes
set splitright
set splitbelow
set incsearch
set pumheight=20

"set smartindent

set background=dark

set termguicolors

" Avoid showing message extra message when using completion
set shortmess+=c

"undo search highlight
nnoremap <ESC> <cmd>nohlsearch<CR>

nnoremap <C-w> <Nop>
nnoremap <SPACE> <Nop>
let mapleader=" "

nnoremap <C-w> <cmd>:bd<CR>
nnoremap <Leader>h <cmd>bprev<CR>
nnoremap <Leader>l <cmd>bnext<CR>

"chad tree
"vnoremap <Leader>o <cmd>:Vexplore<CR>

" Go To Def using lsp
nnoremap <gd> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <gD> <cmd>lua vim.lsp.buf.declaration()<CR>

nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv

nnoremap <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<cr>
" Vim V Split
"nnoremap <leader>v <cmd>:vsp<cr>
" Vim H Split
"nnoremap <leader>i <cmd>:sp<cr>

" function! CleverTab()
"    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
"       return "\<Tab>"
"    else
"       return "\<C-N>"
"    endif
" endfunction
" inoremap <Tab> <C-R>=CleverTab()<CR>

syntax enable

" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
"imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
"inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

"snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
"snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#9AACCE

filetype plugin indent on

lua << EOF
  local lsp_installer = require('nvim-lsp-installer')
  require('nvim-autopairs').setup()
  require('lualine').setup()
  local cmp = require'cmp'
  local lspkind = require('lspkind')
  cmp.setup({
    completion = {
      completeopt = 'menu,menuone,noinsert'
    },
    experimental = {
      ghost_text = true,
    },
    formatting = {
      format = require('lspkind').cmp_format({
        with_text = true,
        menu = {
          nvim_lsp = '[lsp]',
          luasnip = '[luasnip]',
          nvim_lua = '[lua]',
          path = '[path]',
          buffer = '[buffer]',
        },
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      }),
    },
    window = {
      documentation = {
        border = "rounded",
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 50,
        min_width = 50,
        max_height = math.floor(vim.o.lines * 0.4),
        min_height = 3,
      },
    },
    matching = {
      disallow_fuzzy_matching = false,
    },
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's', 'c' }),
      ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's', 'c' }),
      ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's', 'c' }),
      ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's', 'c' }),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<tab>'] = cmp.mapping(cmp.mapping.confirm({ select = false }), { 'i', 's', 'c'}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<cr>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
      --['<TAB>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'path' },
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = cmp.config.sources({
      { name = 'nvim_lsp_document_symbol' },
    }, {
      { name = 'buffer' },
    }),
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
  --local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  lsp_installer.on_server_ready(function (server) 
    local opts = {
      capabilities = capabilities,
    }
    server:setup(opts)
  end)

  --lsp diagnostics config
  vim.diagnostic.show()

  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    float = {
      show_header = true,
      source = 'if_many',
      border = 'rounded',
      focusable = false,
    },
  })

  -- custom signs for lsp diagnostics
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
  --tree sitter
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
    },
  }

  --bufferline (vim tabs with icons and titles)
  require'bufferline'.setup {}

EOF
colorscheme catppuccin
