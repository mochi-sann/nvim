local null_ls = require('null-ls')

require("null-ls").setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.diagnostics.eslint_d,
            null_ls.builtins.formatting.prettier.with({
        filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "graphql", "handlebars", "toml" , "svelte" },
    }),

        -- null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.formatting.rustfmt,
        		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.shfmt,

    },
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
        end
    end,

})

-- vim.cmd([[nnoremap mg      :vim.lsp.buf.formatting_sync()<CR>]])
