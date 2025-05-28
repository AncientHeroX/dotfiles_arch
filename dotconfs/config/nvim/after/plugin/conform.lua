require("conform").setup({
    formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        go = { "gofmt" },
    },
    format_on_save = {
        timeout_ms = 500,
    },
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
        require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
        })
    end, { desc = "Format file or range (in visual mode)" })
})
