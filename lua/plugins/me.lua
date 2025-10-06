-- ~/.config/nvim/lua/plugins/me.lua
return {
  -- Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        filesystem = {
          follow_current_file = { enabled = true },
          hijack_netrw_behavior = "open_default",
        },
        window = {
          position = "left",
          width = 35,
        },
      })
    end,
  },

  -- Transparent background
  {
    'xiyaowong/transparent.nvim',
    lazy = false,
    config = function()
      require('transparent').setup({
        groups = {
          'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
          'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
          'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
          'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
          'EndOfBuffer',
        },
        extra_groups = {
          'NeoTreeNormal',
          'NeoTreeNormalNC',
          'NeoTreeVertSplit',
          'NeoTreeWinSeparator',
          'NeoTreeEndOfBuffer',
        },
        exclude_groups = {},
      })
    end,
  },

  {
  'Exafunction/windsurf.vim',
  lazy = false,
  config = function()
    -- Initialize Windsurf with default settings
    vim.g.codeium_no_map_tab = false
    vim.g.codeium_manual = false
    vim.g.codeium_enable_cmp_source = true
  end,
  },

  -- CoC.nvim with all language servers
  {
    'neoclide/coc.nvim',
    branch = 'release',
    lazy = false,
    config = function()
      -- Add your language servers here
      vim.g.coc_global_extensions = {
        'coc-json',       -- JSON
        'coc-tsserver',   -- JavaScript / TypeScript
        'coc-html',       -- HTML
        'coc-css',        -- CSS / SCSS / Less
        'coc-python',     -- Python
        'coc-clangd',     -- C / C++
        'coc-java',       -- Java
        'coc-go',         -- Go
        'coc-rust-analyzer', -- Rust
        'coc-godot',      -- Godot GDScript
        'coc-sumneko-lua', -- Lua
        'coc-eslint',     -- ESLint
        'coc-prettier',   -- Prettier formatter
        'coc-yaml',       -- YAML
        'coc-docker',     -- Dockerfile
        'coc-sh',         -- Shell scripting
      }
    end,
  },
}
