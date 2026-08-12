return {
  {
    "savq/melange-nvim",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme("melange")
    end,
  },
  "folke/neodev.nvim",
  "folke/which-key.nvim",
  "wellle/context.vim",
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")
      ts.setup()
      local langs = { "lua", "vim", "vimdoc", "query", "bash", "python", "javascript", "typescript", "json", "yaml", "markdown", "java", "sql" }
      ts.install(langs)
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("ts-highlight", { clear = true }),
        pattern = langs,
        callback = function() pcall(vim.treesitter.start) end,
      })
    end,
  },
  { "folke/neoconf.nvim", cmd = "Neoconf" },
}
