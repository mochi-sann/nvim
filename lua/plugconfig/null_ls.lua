local null_ls = require("null-ls")

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(clients)
      -- filter out clients that you don't want to use
      return vim.tbl_filter(function(client)
        return client.name ~= "tsserver"
      end, clients)
    end,
    bufnr = bufnr,
  })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

null_ls.setup({
  sources = {
    -- LuaFormatter off
    -- null_ls.builtins.completion.spell,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.deno_fmt.with({
      condition = function(utils)
        return not (utils.has_file({ ".prettierrc", ".prettierrc.js", "deno.json", "deno.jsonc" }))
      end,
    }),
    null_ls.builtins.formatting.prettier.with({
      condition = function(utils)
        return utils.has_file({ ".prettierrc", ".prettierrc.js" })
      end,
      prefer_local = "node_modules/.bin",
    }),

    -- rust-analyzer
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.diagnostics.golangci_lint,
    --null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.diagnostics.shellcheck,
    -- null_ls.builtins.diagnostics.codespell,
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.code_actions.gitsigns,
    -- LuaFormatter on
  },
  on_attach = on_attach,
})
