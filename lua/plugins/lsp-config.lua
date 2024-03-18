return {
  {
    'williamboman/mason.nvim',
     dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup{
         ensure_installed = {"lua_ls", "clangd", "gopls"},
      }
      local lsp_conf = require('lspconfig')
      lsp_conf.lua_ls.setup({})
      lsp_conf.clangd.setup({})
      lsp_conf.gopls.setup({})
      local opts = {}
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<leader>H', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {} )
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

    end
  },
}
