local null_ls = require("null-ls")

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			--          apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = { noremap = true, silent = true }
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
				return not (utils.has_file({ ".prettierrc", ".prettierrc.js" }))
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
		-- null_ls.builtins.formatting.prettier,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.formatting.clang_format,
		-- null_ls.builtins.diagnostics.codespell,
		null_ls.builtins.formatting.markdownlint,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.formatting.gofmt,
		-- LuaFormatter on
	},
	on_attach = on_attach,
})
