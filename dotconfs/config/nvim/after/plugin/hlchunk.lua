require('hlchunk').setup({
  chunk = {
    enable = true,
    priority = 15,
    style = {
      { fg = "#ac92d1", underline = false },
      { fg = "#c21f30", underline = false },
    },
    use_treesitter = true,
    chars = {
      horizontal_line = "─",
      vertical_line = "│",
      left_top = "╭",
      left_bottom = "╰",
      right_arrow = ">",
    },
    textobject = "ic",
    max_file_size = 1024 * 1024,
    error_sign = true,
    -- animation related
    duration = 100,
    delay = 0,
  },
  indent = {
    enable = true,
    priority = 10,
    chars = {
      "│",
    },
    style = {
      "#6e6a86",
    },
    use_treesitter = true,
    ahead_lines = 5,
    delay = 100,
  },
  line_num = {
    enable = true,
    style = "#ac92d1",
  },
})
