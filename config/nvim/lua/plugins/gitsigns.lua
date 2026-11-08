-- Adds git related signs to the gutter, as well as utilities for managing changes

vim.pack.add { gh 'lewis6991/gitsigns.nvim' }
local gitsigns = require 'gitsigns'
gitsigns.setup {
  signs = {
    add = { text = '+' }, ---@diagnostic disable-line: missing-fields
    change = { text = '~' }, ---@diagnostic disable-line: missing-fields
    delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
    topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
    changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
  },
  -- gitsigns.nvim's recommended keymaps:
  on_attach = function(bufnr)
    -- Navigation
    vim.keymap.set('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal { ']c', bang = true }
      else
        gitsigns.nav_hunk 'next'
      end
    end, { desc = 'Jump to next git [c]hange', buf = bufnr })

    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal { '[c', bang = true }
      else
        gitsigns.nav_hunk 'prev'
      end
    end, { desc = 'Jump to previous git [c]hange', buf = bufnr })

    -- Visual mode actions
    vim.keymap.set('v', '<leader>Gs', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = '[s]tage hunk', buf = bufnr })
    vim.keymap.set('v', '<leader>Gr', function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = '[r]eset hunk', buf = bufnr })

    -- Normal mode actions
    vim.keymap.set('n', '<leader>Gsh', gitsigns.stage_hunk, { desc = '[h]unk', buf = bufnr })
    vim.keymap.set('n', '<leader>Gsb', gitsigns.stage_buffer, { desc = '[b]uffer', buf = bufnr })

    vim.keymap.set('n', '<leader>Grh', gitsigns.reset_hunk, { desc = '[h]unk', buf = bufnr })
    vim.keymap.set('n', '<leader>Grb', gitsigns.reset_buffer, { desc = '[b]uffer', buf = bufnr })

    vim.keymap.set('n', '<leader>Gph', gitsigns.preview_hunk, { desc = '[h]unk', buf = bufnr })
    vim.keymap.set('n', '<leader>Gpi', gitsigns.preview_hunk_inline, { desc = '[i]nline', buf = bufnr })

    vim.keymap.set('n', '<leader>Gb', function() gitsigns.blame_line { full = true } end, { desc = '[b]lame line', buf = bufnr })

    vim.keymap.set('n', '<leader>Gdi', gitsigns.diffthis, { desc = 'against [i]ndex', buf = bufnr })
    vim.keymap.set('n', '<leader>Gdc', function() gitsigns.diffthis '~' end, { desc = 'against last [c]ommit', buf = bufnr })

    vim.keymap.set('n', '<leader>Gqf', gitsigns.setqflist, { desc = 'this [f]ile)', buf = bufnr })
    vim.keymap.set('n', '<leader>Gqr', function() gitsigns.setqflist 'all' end, { desc = 'all files in [r]epo', buf = bufnr })

    -- Toggles
    vim.keymap.set('n', '<leader>Gtb', gitsigns.toggle_current_line_blame, { desc = '[b]lame line', buf = bufnr })
    vim.keymap.set('n', '<leader>Gtw', gitsigns.toggle_word_diff, { desc = 'intra-line [w]ord diff', buf = bufnr })

    -- Text object
    vim.keymap.set({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'text object [i]nside [h]unk', buf = bufnr })
  end,
}

