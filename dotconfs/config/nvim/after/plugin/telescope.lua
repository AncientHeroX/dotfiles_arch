require('telescope').setup{
    defaults = {
        file_ignore_patterns = {"node_modules"},
        -- preview = false
    };
}

local utils = require('telescope.utils')
local builtin = require('telescope.builtin')

local project_files = function()
    local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
    if ret == 0 then
        builtin.git_files()
    else
        builtin.find_files()
    end
end

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', project_files, {})
vim.keymap.set('n', '<leader>ps', function()
    vim.ui.input({ prompt = "Grep > " }, function(input)
    if input and input ~= "" then
      builtin.grep_string({ search = input })
    end
  end)
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
