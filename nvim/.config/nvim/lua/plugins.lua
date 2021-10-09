-- Automatically install packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Required because packer is configured as 'opt'
vim.cmd[[packadd packer.nvim]]

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function() require('lsp') end,
    requires = {'kabouzeid/nvim-lspinstall'}
  }
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Autocompletion/Snippets
  use {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = function() require('plugins.cmp') end,
    requires = {
      {
        'L3MON4D3/LuaSnip',
        config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
        requires = {'rafamadriz/friendly-snippets'}
      },
      {
        'hrsh7th/cmp-nvim-lsp',
        after = 'nvim-cmp'
      },
      {
        'hrsh7th/cmp-buffer',
        after = 'nvim-cmp'
      },
      {
        'saadparwaiz1/cmp_luasnip',
        after = 'nvim-cmp'
      }
    }
  }

  -- Navigation
  use {
    'nvim-telescope/telescope.nvim',
    config = function() require('plugins.telescope') end,
    requires = {'nvim-lua/plenary.nvim'}
  }
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('nvim-tree').setup() end
  }

  -- Utilities
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.treesitter') end
  }
  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = function() require('plugins.autopairs') end
  }
  use {
    'abecodes/tabout.nvim',
    after = 'nvim-cmp',
    config = function() require('plugins.tabout') end,
  }
  use 'b3nj5m1n/kommentary'
  -- to restore neovim sessions with tmux-resurrect
  use 'rmagatti/auto-session'

  -- Visual
  use 'hoob3rt/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- Colorschemes
  use 'kyazdani42/blue-moon'
  use 'yashguptaz/calvera-dark.nvim'
  use 'shatur/neovim-ayu'
  use 'marko-cerovac/material.nvim'
end)
