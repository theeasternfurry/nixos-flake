local lspconfig = require('lspconfig')

-- Auto completion config
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Add the server that troubles you here
local language_servers = { 'gopls', 'nixd' }
if not language_servers then
  print 'You have not defined a server name, please edit minimal_init.lua'
end

for _, value in pairs(language_servers) do
    lspconfig[value].setup{
        capabilities = capabilities,
    }
end
