-- Preferential adjusments of default keybinds:
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })
vim.keymap.set({ 'n', "i" }, '<leader>bd', '<Esc>:bd<CR>', { noremap = true })
vim.keymap.set({ "n", "i", "v" }, '<C-s>', '<Esc>:w<CR>', { noremap = true })
vim.keymap.set({ "n", "i", "v" }, '<leader>fq', '<Esc>:q!<CR>', { noremap = true })
vim.keymap.set("n", '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set("n", '<C-u>', '<C-u>zz', { noremap = true })

-- Buffers
vim.keymap.set("n", '<S-h>', ':bprev<CR>', { noremap = true })
vim.keymap.set("n", '<S-l>', ':bnext<CR>', { noremap = true })

-- Telescope keybinds:
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<C-f>o', telescope.find_files, {})
vim.keymap.set('n', '<leader>sg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>vr', telescope.registers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
vim.keymap.set('n', '<leader>fs', telescope.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>gs', telescope.git_stash, {})
vim.keymap.set('n', '<leader>gb', telescope.git_branches, {})
vim.keymap.set('n', '<leader>gc', telescope.git_commits, {})
vim.keymap.set('n', '<leader>bc', telescope.git_bcommits, {})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>dx', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', ':lua vim.diagnostic.goto_prev()<CR>zz', {})
vim.keymap.set('n', ']d', ':lua vim.diagnostic.goto_next()<CR>zz', {})
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        --	requires vim.opt.splitright = true
        vim.keymap.set('n', 'gd', ':vsp<cr> :lua vim.lsp.buf.definition()<CR> zz', opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

-- brackets
-- vim.keymap.set("n", '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set("i", "\"<tab>", "\"\"<Left>", { noremap = true })
vim.keymap.set("i", "'<tab>", "''<Left>", { noremap = true })
vim.keymap.set("i", "(<tab>", "()<Left>", { noremap = true })
vim.keymap.set("i", "{<tab>", "{}<Left>", { noremap = true })
vim.keymap.set("i", "[<tab>", "[]<Left>", { noremap = true })
vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O", { noremap = true })
vim.keymap.set("i", "(<CR>", "(<CR>)<Esc>O", { noremap = true })
