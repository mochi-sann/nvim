local null_ls = require("null-ls")

-- require("mason-null-ls").setup({
--   ensure_installed = { "stylua", "jq", "prettier" , "rustfmt" },
--   automatic_installation = true
-- })
-- require("mason-null-ls").setup_handlers({
--   function(source_name, methods)
--     -- all sources with no handler get passed here
--
--     -- To keep the original functionality of `automatic_setup = true`,
--     -- please add the below.
--     require("mason-null-ls.automatic_setup")(source_name, methods)
--   end,
--   stylua = function(source_name, methods)
--     null_ls.register(null_ls.builtins.formatting.stylua)
--   end,
-- })

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		timeout_ms = 2000,
		filter = function(client)
			--          apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
-- local on_attach =
null_ls.setup({
	on_attach = function(client, bufnr)
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
	end,
	sources = {
		-- LuaFormatter off
		-- null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.black,

		null_ls.builtins.formatting.deno_fmt.with({
			condition = function(utils)
				return not (utils.has_file({ ".prettierrc", ".prettierrc.js", "package.json" }))
			end,
		}),
		null_ls.builtins.formatting.prettier.with({
			condition = function(utils)
				return utils.has_file({ ".prettierrc", ".prettierrc.js", "package.json" })
			end,
			prefer_local = "node_modules/.bin",
		}),

		-- rust-analyzer
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.diagnostics.golangci_lint,
		-- null_ls.builtins.formatting.stylua,

		-- null_ls.builtins.formatting.prettier,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.formatting.clang_format,
		-- null_ls.builtins.diagnostics.codespell,
		-- null_ls.builtins.formatting.markdownlint,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.formatting.gofmt,
		-- LuaFormatter on
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.php,
		null_ls.builtins.formatting.prismaFmt,
		null_ls.builtins.formatting.phpcbf,
	},
	-- on_attach = on_attach,
})
