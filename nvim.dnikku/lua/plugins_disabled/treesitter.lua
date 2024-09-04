return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    local options = {
      ensure_installed = {
        "lua",
        "luadoc",
        "printf",
        "vim",
        "vimdoc",
        "html",
        "css",
      },

      highlight = {
        enable = true,
        use_languagetree = true,
      },

      indent = { enable = true },
    }

    require("nvim-treesitter.configs").setup(options)
  end,
}
