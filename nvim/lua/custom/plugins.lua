local plugins = {
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    ft = { "python", "cpp" },
    opts = function()
      return require("custom.configs.null-ls")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "yamatsum/nvim-cursorline",
    event = "VeryLazy",
    config = function ()
      require("custom.configs.nvim-cursorline")
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "asmfmt",
        "asm-lsp",
        "blue",
        "clangd",
        "clang-format",
        "codelldb",
        "lua-language-server",
        "mypy",
        "pyright",
        "ruff",
      }
    }
  },
}

return plugins
