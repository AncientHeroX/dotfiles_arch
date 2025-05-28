-- Key mappings
vim.keymap.set("n", "<leader>-", "<cmd>Yazi<cr>",
{ noremap = true, desc = "Open yazi at the current file" })
vim.keymap.set("n", "<leader>cw", "<cmd>Yazi cwd<cr>",
{ noremap = true, desc = "Open the file manager in nvim's working directory" })
vim.keymap.set("n", "<c-up>", "<cmd>Yazi toggle<cr>",
{ noremap = true, desc = "Resume the last yazi session" })

-- Configuration for yazi
require("yazi").setup({
  open_for_directories = true,
  keymaps = {
    show_help = "<f8>",
  },
})

-- Disable netrw plugin if needed
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
