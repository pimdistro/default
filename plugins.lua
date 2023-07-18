return {
  "numToStr/Comment.nvim",

  {
    "filipdutescu/renamer.nvim",
    config = function()
      require("renamer").setup({})
    end,
  },

  {
    "vimlab/split-term.vim",
    config = function()
      vim.cmd("set splitbelow")
    end,
  },

  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup()
    end,
  },

  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require("custom.config.alpha")
    end,
  },

  -- nvim-tree (https://github.com/nvim-tree/nvim-tree.lua)
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
    end,
  },
  "nvim-tree/nvim-web-devicons",

  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup({
        virtual_lines = false,
      })

      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },

  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
      require("barbecue").setup()
    end,
  },

  require("custom.theme"),
  require("custom.config.null_ls"),
}
