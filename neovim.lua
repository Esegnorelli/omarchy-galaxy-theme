-- Claude Eye of God — Neovim (base16, no external colorscheme repo needed)
return {
  {
    "RRethy/base16-nvim",
    priority = 1000,
    config = function()
      require("base16-colorscheme").setup({
        base00 = "#0d1417", base01 = "#18211f", base02 = "#233330", base03 = "#5a6e6c",
        base04 = "#8aa39e", base05 = "#dde6e3", base06 = "#eef4f1", base07 = "#f0f4f0",
        base08 = "#d9674a", base09 = "#e0935a", base0A = "#e6b15a", base0B = "#5cba94",
        base0C = "#1fd4ee", base0D = "#4593bf", base0E = "#ab7fb0", base0F = "#e88060",
      })
    end,
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "base16" } },
}
