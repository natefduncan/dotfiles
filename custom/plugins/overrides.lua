local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "typescript",
	"toml", 
	"sql", 
	"regex", 
	"markdown", 
	"json", 
	"javascript",
	"gitignore", 
	"bash", 
    "c",
	"rust", 
	"python"
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
	"r-languageserver",
	"rust-analyzer", 
	"pyright", 
	"markdownlint", 
	"json-lsp", 
	"grammarly-languageserver", 
	"bash-language-server", 

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
