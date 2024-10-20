return {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local nvimlsp = require('lspconfig')
      nvimlsp.denols.setup {
        on_attach = on_attach,
        root_dir = nvimlsp.util.root_pattern("deno.json", "deno.jsonc")
      }
    end,
}
