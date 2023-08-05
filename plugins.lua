return {
  "numToStr/Comment.nvim",

  {
    "filipdutescu/renamer.nvim",
    config = function()
      require("renamer").setup({})
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "desdic/telescope-rooter.nvim",
    config = function()
      require("telescope").load_extension("rooter")
    end,
  },

  {
    "vimlab/split-term.vim",
    config = function()
      vim.cmd("set splitbelow")
      vim.cmd(":au BufEnter * if &buftype == 'terminal' | :startinsert | endif")
    end,
  },

  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup()
    end,
  },

  {
    "willothy/flatten.nvim",
    config = true,
    lazy = false,
    priority = 1001,
  },

  {
    "simrat39/rust-tools.nvim",
    config = function()
      local tools = require("rust-tools")

      tools.setup({
        server = {
          on_attach = function(_, bufnr)
            vim.keymap.set("n", "<C-space>", tools.hover_actions.hover_actions, { buffer = bufnr })
            vim.keymap.set("n", "<Leader>a", tools.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
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
      require("lsp_lines").setup()

      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },

  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  require("custom.theme"),
  require("custom.config.null_ls"),
}
