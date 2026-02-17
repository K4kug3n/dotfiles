  -- { -- You can easily change to a different colorscheme.
  --   -- Change the name of the colorscheme plugin below, and then
  --   -- change the command in the config to whatever the name of that colorscheme is.
  --   --
  --   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  --   'folke/tokyonight.nvim',
  --   priority = 1000, -- Make sure to load this before all the other start plugins.
  --   config = function()
  --     ---@diagnostic disable-next-line: missing-fields
  --     require('tokyonight').setup {
  --       styles = {
  --         comments = { italic = false }, -- Disable italics in comments
  --       },
  --     }

  --     -- Load the colorscheme here.
  --     -- Like many other themes, this one has different styles, and you could load
  --     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
  --     vim.cmd.colorscheme 'tokyonight-night'
  --   end,
  -- },
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('everforest').setup {
        background = 'hard',
      }
    end,
  },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = 'hard' -- value: 'hard', 'medium', 'soft'
      vim.g.gruvbox_material_foreground = 'material' -- value: 'material', 'mix, 'original'
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  -- {
  --   'sainnhe/edge',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Optionally configure and load the colorscheme
  --     -- directly inside the plugin declaration.
  --     vim.g.edge_enable_italic = true
  --     vim.g.edge_style = 'aura' -- value: 'default', 'aura', 'neon'
  --     vim.cmd.colorscheme 'edge'
  --   end,
  -- },

