return {
  "stevearc/conform.nvim",
  event = "BufWritePre", -- uncomment for format on save
  config = function()
    local options = {
      formatters_by_ft = {
        lua = { "stylua" },

        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
      },

      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 1500,
        lsp_fallback = true,
      },
    }

    require("conform").setup(options)
  end,
}
