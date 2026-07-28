return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp", -- optional, for completion capabilities
    },
    config = function()
      require("mason").setup()

      -- Shared config applied to every server
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(
          vim.lsp.protocol.make_client_capabilities()
        ),
      })

      -- Per-server overrides (optional)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      vim.lsp.config("pyright", {
        -- example override
      })

      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright" }, -- add the servers you want
        automatic_enable = true, -- auto-calls vim.lsp.enable() for installed servers
      })

      -- Keymaps on LSP attach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local opts = { buffer = bufnr }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        end,
      })
    end,
  },
}
