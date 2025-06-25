return {
{
  "folke/trouble.nvim",
  cmd = "Trouble",
    opts={icons_enabled= false},
  keys = {
    {
      "<leader>tt",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>[t",
      "<cmd>Trouble diagnostics next skip_groups=true jump=true<cr>",
      desc = "Next Diagnostic (Trouble)",
    },
    {
      "<leader>[T",
      "<cmd>Trouble diagnostics prev skip_groups=true jump=true<cr>",
      desc = "Previous Diagnostic (Trouble)",
    },
  },
}}
