local lsp_config = require("lspconfig")

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup({
  automatic_enable ={
    exclude = {
      "ts_ls"
    }
  }
})

lsp_config.emmet_ls.setup({})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-group', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('lsp-group', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})
require('lspconfig').clangd.setup({
  flags = {
    allow_incremental_sync = true,
  },
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

lsp_config.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true,
        experimental = {
          enable = true,
        },
      },
    },
  },
})
lsp_config.denols.setup {
  on_attach = on_attach,
  root_dir = lsp_config.util.root_pattern("deno.json", "deno.jsonc"),
}
lsp_config.ts_ls.setup {
  on_attach = on_attach,
  root_dir = function(fname) 
    if lsp_config.util.root_pattern('deno.json', 'deno.jsonc')(fname) then
      return nil
    end
    return lsp_config.util.root_pattern('package.json', 'tsconfig.json', '.git')(fname)
  end,
  single_file_support = false
}


vim.diagnostic.config({
  virtual_text = false,
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250

vim.api.nvim_create_autocmd({ 'CursorHold','InsertLeave' }, {pattern = nil, callback = function() 
  	local opts = {
		focusable = false,
		scope = 'cursor',
		close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
	}
	vim.diagnostic.open_float(nil, opts)
end})
