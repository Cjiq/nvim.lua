require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
      "html",
      "htmx",
      "lua_ls",
      "rust_analyzer",
      "templ",
      "texlab",
      "tailwindcss",
      "vimls",
      "cssls",
      "tsserver",
    },
}
