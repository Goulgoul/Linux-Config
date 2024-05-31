local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities
local util = require("lspconfig.util")
local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities
})

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})

local root_files = {
  '.clangd',
  '.clang-tidy',
  '.clang-format',
  'compile_commands.json',
  'compile_flags.txt',
  'configure.ac', -- AutoTools
}

lspconfig.asm_lsp.setup({
  on_attach = on_attach,
  -- cmd = { 'asm-lsp' },
  filetypes = { 'asm', 'vmasm' },
  root_dir = function(fname)
    return util.root_pattern(table.unpack(root_files))(fname) or util.find_git_ancestor(fname)
  end,
  capabilities = capabilities,
})

local html_root_files = {
  'html'
}

lspconfig.html.setup({
  filetypes = {"html", "xhtml"},
  init_options = {
    configurationSection = {"html", "css", "javascript"},
    embeddedLanguages = {
      css = true,
      javascript = true
    }
  },
  root_dir = function (fname)
    return util.root_pattern(table.unpack(root_files))(fname)
  end,
  settings = {}
})
