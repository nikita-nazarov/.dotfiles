return {
  -- Telescope fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Colorschemes
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        styles = { italic = false },
      })
    end,
  },

  {
    "Shatur/neovim-ayu",
    config = function()
      require("ayu").setup({
        mirage = false,
        overrides = {},
      })
    end,
  },

  -- Treesitter (master branch = old stable, uses pre-compiled parsers, no tree-sitter-cli needed)
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "rust", "javascript", "scala", "go", "typescript", "java", "jsonnet" },
        highlight = { enable = true },
        auto_install = false,
      })
    end,
  },

  -- Harpoon for file navigation
  "theprimeagen/harpoon",

  -- Undo tree
  "mbbill/undotree",

  -- Git integration
  "tpope/vim-fugitive",

  -- Git signs in the gutter
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Commenting
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
      local api = require("Comment.api")
      vim.keymap.set("n", "<leader>c", api.toggle.linewise.current)
      vim.keymap.set("v", "<leader>c", "<Plug>(comment_toggle_linewise_visual)")
    end,
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Scala LSP
  {
    "scalameta/nvim-metals",
    dependencies = { "mfussenegger/nvim-dap" },
    ft = { "scala", "sbt", "java" },
  },
}
