return {
  'nvim-java/nvim-java',
  dependencies = {
    'JavaHello/spring-boot.nvim',
    'MunifTanjim/nui.nvim',
    'mfussenegger/nvim-dap',
  },
  config = function()
    require('java').setup()
    vim.lsp.enable('jdtls')
  end,
}
