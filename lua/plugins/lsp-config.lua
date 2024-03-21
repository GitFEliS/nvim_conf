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
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc = "prev diagnostic"})
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc = "next diagnostic"})
      vim.keymap.set('n', '<leader>H', vim.lsp.buf.hover, {desc = "hover"})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc = "go to defenition"})
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {desc = "go to implementation"})
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, {desc = "type definition"})
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {desc = "rename"})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {desc = "code action"} )
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, {desc = "go to references"})

    end
  },
}
