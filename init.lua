-- ----------------------------------------------------------------------------
-- START PACKAGE MANAGER CALLS ------------------------------------------------
-- ----------------------------------------------------------------------------

vim.pack.add({
    {
        src = 'https://github.com/catppuccin/nvim',
        version = 'main'
    },

})
vim.pack.add({
    {
        src = 'https://github.com/nvim-lua/plenary.nvim',
        version = 'master'
    }
})
vim.pack.add({
    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter',
        version = 'master'
    }
})
-- required packages ripgrep and fd
vim.pack.add({
    {
        src = 'https://github.com/nvim-telescope/telescope.nvim',
        version = 'master'
    },
    {
        src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim',
        version = 'master'
    }
})
vim.pack.add({
    {
        src = 'https://github.com/nvim-tree/nvim-web-devicons',
        version = 'master'

    },
    {
        src = 'https://github.com/ryanoasis/vim-devicons',
        version = 'master'

    }
})
vim.pack.add({
    {
        src = 'https://github.com/nvim-lualine/lualine.nvim',
        version = 'master'
    }
})
vim.pack.add({
    {
        src = 'https://github.com/echasnovski/mini.icons',
        version = 'master'

    },
    {
        src = 'https://github.com/goolord/alpha-nvim',
        version = 'main'
    }
})
vim.pack.add({
    {
        src = 'https://github.com/MunifTanjim/nui.nvim',
        version = 'main'

    },
    {
        src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
        version = 'main'
    }

})
vim.pack.add{
    { 
        src = 'https://github.com/neovim/nvim-lspconfig',
        version = 'main'
    },
    { 
      src = 'https://github.com/mason-org/mason.nvim',
      version = 'main'
    },
    { 
      src = 'https://github.com/mason-org/mason-lspconfig.nvim',
      version = 'main'
    }
}
vim.pack.add{
    { 
        src = 'https://github.com/rachartier/tiny-code-action.nvim',
        version = 'main'
    }
}
vim.pack.add{
    { 
        src = 'https://github.com/ibhagwan/fzf-lua',
        version = 'main'
    }
}
vim.pack.add{
    { 
        src = 'https://github.com/L3MON4D3/LuaSnip',
        version = 'master'
    },
    { 
        src = 'https://github.com/Saghen/blink.cmp',
        version = 'main'
    }
}
vim.pack.add {
    { 
        src = 'https://github.com/akinsho/toggleterm.nvim',
        version = 'main'
    }
}
vim.pack.add {
    { 
        src = 'https://github.com/nvimtools/none-ls.nvim',
        version = 'main'
    }
}
vim.pack.add {
    { 
        src = 'https://github.com/mfussenegger/nvim-dap',
        version = 'master'
    },
    { 
        src = 'https://github.com/igorlfs/nvim-dap-view',
        version = 'main'
    },
    {
        src = 'https://github.com/jay-babu/mason-nvim-dap.nvim',
        version = 'main'
    }

}
vim.pack.add {
    -- { 
        -- src = 'https://github.com/anuvyklack/hydra.nvim',
        -- version = 'master'
    -- }
    { 
        src = 'https://github.com/nvimtools/hydra.nvim',
        version = 'main'
    }
}
vim.pack.add {
    { 
        src = 'https://github.com/SmiteshP/nvim-navic',
        version = 'master'
    }
}
vim.pack.add {
    {
        src = 'https://github.com/RRethy/vim-illuminate',
        version = 'master'
    }
}

-- ----------------------------------------------------------------------------
-- END PACKAGE MANAGER CALLS --------------------------------------------------
-- ----------------------------------------------------------------------------

-- ############################################################################
-- ############################################################################
-- ############################################################################
-- ############################################################################
-- ############################################################################

-- ----------------------------------------------------------------------------
-- START NXVIM API  -----------------------------------------------------------
-- ----------------------------------------------------------------------------

local nXvim = { api = {} }
nXvim.api.KEY_MAP_DATA = {}

-- library function do not use it
function nXvim.api.MapAddTableData(map, key, data)
    local clean_key = key:gsub('<CR>', '')
    if not map[clean_key] then
        map[clean_key] = {}
    end
    table.insert(map[clean_key], data)
end

-- function that creates a keymap and stores extra data for the user shortcut helper (HYDRA)
-- mode - the vim mode eg. 'n' for normal
-- key - the keymap eg. <leader>ce
-- cmd -- the command eg. :e $MYVIMRC<CR>
-- desc -- the description of the command eg. 'Edit the init.lua file'. Will be visible in the user shortcut helper
-- group -- the group of the keymap eg. 'Generic'. Keymap with the same group will be visible in the same user shortcut helper list
function nXvim.api.KeyMap(mode, key, cmd, desc, group, remap)
    if remap == nil then
        remap = true
    end
    vim.api.nvim_set_keymap(mode, key, cmd, { noremap = remap, silent = true, desc = desc } )
    local data = { mode = mode, key = key, cmd = cmd, desc = desc }
    nXvim.api.MapAddTableData(nXvim.api.KEY_MAP_DATA, group, data)
end

-- function that creates a keymap for a specific buffer and stores extra data for the user shortcut helper (HYDRA)
-- buffer - the buffer number
-- mode - the vim mode eg. 'n' for normal
-- key - the keymap eg. <leader>ce
-- cmd -- the command eg. :e $MYVIMRC<CR>
-- desc -- the description of the command eg. 'Edit the init.lua file'. Will be visible in the user shortcut helper
-- group -- the group of the keymap eg. 'Generic'. Keymap with the same group will be visible in the same user shortcut helper list
function nXvim.api.KeyMapBuffer(buffer, mode, key, cmd, desc, group, remap)
    if remap == nil then
        remap = true
    end
    vim.api.nvim_buf_set_keymap(buffer, mode, key, cmd, { noremap = remap, silent = true, desc = desc } )
    local data = { mode = mode, key = key, cmd = cmd, desc = desc }
    nXvim.api.MapAddTableData(nXvim.api.KEY_MAP_DATA, group, data)
end

-- function for presenting internal vim commands in the user shortcut helper
-- arguments are same with KeyMap
function nXvim.api.HelpMap(key, desc, group)
    local data = { mode = '', key = key, cmd = key, desc = desc }
    nXvim.api.MapAddTableData(nXvim.api.KEY_MAP_DATA, group, data)
end

-- library function do not use it
function nXvim.api.HydraHead(group)
    local head = {}
    local hint = ''

    if nXvim.api.KEY_MAP_DATA[group] then
        local data = nXvim.api.KEY_MAP_DATA[group]
        for key, value in pairs(data) do
            local head_data = {value.key, value.cmd, {desc = value.desc}}
            table.insert(head, head_data)
        end
    end
    table.insert(head, {'<Esc>', nil, { exit = true, nowait = true, desc = 'Exit' }})
    return head;
end


function nXvim.api.HydraHint(group)
    local hint = ''

    if nXvim.api.KEY_MAP_DATA[group] then
        local data = nXvim.api.KEY_MAP_DATA[group]
        for key, value in pairs(data) do
            hint = hint .. '_' .. value.key .. '_' .. ': ' .. value.desc .. '\n'
        end
    end
    hint = hint .. '_<Esc>_: Exit' .. '\n'
    print(hint)
    return hint;
end

-- function that creates a HYDRA for the user shortcut helper
function nXvim.api.HydraTemplate(name, cmd_str, group)
    local hydra = require('hydra')
    local cmd = require('hydra.keymap-util').cmd

    local templ_hydra = hydra({
        name = name,
        hint = nXvim.api.HydraHint(group),
        config = {
            color = 'teal',
            invoke_on_body = true,
            hint = {
                type = 'window',
                position = 'bottom-right',
                border = 'rounded',
            },
        },
        mode = 'n',
        body = cmd_str,
        heads = nXvim.api.HydraHead(group)
    })

    return templ_hydra
end

-- ----------------------------------------------------------------------------
-- END NXVIM API --------------------------------------------------------------
-- ----------------------------------------------------------------------------

-- ############################################################################
-- ############################################################################
-- ############################################################################
-- ############################################################################
-- ############################################################################

-- ----------------------------------------------------------------------------
-- START OPTIONS --------------------------------------------------------------
-- ----------------------------------------------------------------------------

vim.api.nvim_set_option_value('expandtab'           , true                              , {})   -- expand tab input with spaces characters
vim.api.nvim_set_option_value('encoding'            , 'UTF-8'                           , {})   -- set encoding
vim.api.nvim_set_option_value('mouse'               , ''                                , {})   -- disable mouse popup menu
vim.api.nvim_set_option_value('number'              , true                              , {})   -- show line number
vim.api.nvim_set_option_value('relativenumber'      , false                             , {})   -- show relative line number
vim.api.nvim_set_option_value('signcolumn'          , 'yes'                             , {})   -- set a column for the LSD signs
vim.api.nvim_set_option_value('cursorline'          , true                              , {})   -- highlight current line
vim.api.nvim_set_option_value('wrap'                , false                             , {})   -- wrap lines
vim.api.nvim_set_option_value('scrolloff'           , 5                                 , {})   -- visible lines above and below durins scroll
vim.api.nvim_set_option_value('sidescroll'          , 5                                 , {})   -- visible lines left and right durins scroll
vim.api.nvim_set_option_value('tabstop'             , 4                                 , {})   -- num of space characters per tab, 
vim.api.nvim_set_option_value('shiftwidth'          , 4                                 , {})   -- spaces per indentation level
vim.api.nvim_set_option_value('softtabstop'         , 4                                 , {})   -- syntax aware indentations for newline inserts
vim.api.nvim_set_option_value('smartindent'         , true                              , {})   -- syntax aware indentations for newline inserts
vim.api.nvim_set_option_value('expandtab'           , true                              , {})   -- spaces instead of tabs
vim.api.nvim_set_option_value('autoindent'          , true                              , {})   -- copy current line indent
vim.api.nvim_set_option_value('incsearch'           , true                              , {})   -- highlight while typing in search
vim.api.nvim_set_option_value('ignorecase'          , false                             , {})   -- case insensitive search
vim.api.nvim_set_option_value('smartcase'           , false                             , {})   -- case senditive if capital letter in search
vim.api.nvim_set_option_value('hlsearch'            , true                              , {})   -- highlight search result


vim.api.nvim_set_option_value('backup'              , false                             , {})   -- do not create backup file
vim.api.nvim_set_option_value('writebackup'         , false                             , {})   -- do not create backup file before writig
vim.api.nvim_set_option_value('swapfile'            , true                              , {})   -- do not create swap files
vim.api.nvim_set_option_value('undofile'            , false                             , {})   -- persistent undo
vim.api.nvim_set_option_value('undodir'             , vim.fn.expand('$MYVIMRC/undodir') , {})   -- undo file location
vim.api.nvim_set_option_value('autoread'            , false                             , {})   -- auto reload file if changed autoside vim
vim.api.nvim_set_option_value('autowrite'           , false                             , {})   -- auto reload file if changed autoside vim




-- set vim diagnostic options
vim.diagnostic.config(
    {
        underline = true,
        virtual_text = {
            spacing = 2,
            prefix = '●',
        },
        update_in_insert = false,
        severity_sort = true,
        signs = {
            text = {
                -- Alas nerdfont icons don't render properly on Medium!
                [vim.diagnostic.severity.ERROR] = ' ', 
                [vim.diagnostic.severity.WARN]  = ' ',
                [vim.diagnostic.severity.HINT]  = '',
                [vim.diagnostic.severity.INFO]  = ' ',
            },
        },
    }
)

-- set colorscheme
vim.api.nvim_cmd({cmd = 'colorscheme',args = {'catppuccin-frappe'}}, {}) -- latte, frappe, macchiato, mocha

-- set the global window border option
vim.o.winborder = 'rounded'

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- ----------------------------------------------------------------------------
-- END OPTIONS --------------------------------------------------------------
-- ----------------------------------------------------------------------------

-- ############################################################################
-- ############################################################################
-- ############################################################################
-- ############################################################################
-- ############################################################################

-- ----------------------------------------------------------------------------
-- START KEYMAPS --------------------------------------------------------------
-- ----------------------------------------------------------------------------

vim.g.mapleader='\\'


nXvim.api.KeyMap('n', '<leader>ce'   , ':e $MYVIMRC<CR>'    , 'Edit init.lua'   , 'Configure')
nXvim.api.KeyMap('n', '<leader>cs'   , ':source %<CR>'      , 'Source init lua' , 'Configure')

nXvim.api.KeyMap("n", "<leader>/c"   , ':nohlsearch<CR>'    , 'Clear search highlights', 'Generic')

-- keys telescope
nXvim.api.KeyMap('n', '<leader>ff'   , ':Telescope find_files<CR>'      , 'Telescope find files'            , 'Search')
nXvim.api.KeyMap('n', '<leader>fg'   , ':Telescope live_grep<CR>'       , 'Telescope live grep'             , 'Search')
nXvim.api.KeyMap('n', '<leader>fb'   , ':Telescope buffers<CR>'         , 'Telescope find in buffers '      , 'Search')
nXvim.api.KeyMap('n', '<leader>fh'   , ':Telescope help_tags<CR>'       , 'Telescope help tags'             , 'Search')

nXvim.api.KeyMap('n', '<leader>td'   , ':Telescope diagnostics<CR>'             , 'Telescope diagnostics'                   , 'Code')
nXvim.api.KeyMap('n', '<leader>tr'   , ':Telescope lsp_references<CR>'          , 'Telescope references'                    , 'Code')
nXvim.api.KeyMap('n', '<leader>tin'  , ':Telescope lsp_incoming_calls<CR>'      , 'Telescope incoming calls'                , 'Code')
nXvim.api.KeyMap('n', '<leader>tou'  , ':Telescope lsp_outgoing_calls<CR>'      , 'Telescope outgoing calls'                , 'Code')
nXvim.api.KeyMap('n', '<leader>tdb'  , ':Telescope lsp_document_symbols<CR>'    , 'Telescope document symbols in buffer'    , 'Code')
nXvim.api.KeyMap('n', '<leader>tdw'  , ':Telescope lsp_worspace_symbols<CR>'    , 'Telescope document symbols in workspace' , 'Code')
nXvim.api.KeyMap('n', '<leader>ti'   , ':Telescope lsp_implementations<CR>'     , 'Telescope goto implementation'           , 'Code')
nXvim.api.KeyMap('n', '<leader>tdf'  , ':Telescope lsp_definitions<CR>'         , 'Telescope goto definition'               , 'Code')
nXvim.api.KeyMap('n', '<leader>tdt'  , ':Telescope lsp_type_definitions<CR>'    , 'Telescope goto type definition'          , 'Code')

-- keys neotree
nXvim.api.KeyMap('n', '<leader>b'    , ':Neotree reveal toggle<CR>'  , 'Neotree open browser and highlight current and toogle'  , 'File Browser')

-- code actions
nXvim.api.KeyMap('n', '<leader>cf'   , ':lua require("tiny-code-action").code_action()<CR>', 'Tesecope code actions', 'Code')

-- commenting
nXvim.api.KeyMap('n', '<leader>cc', 'gcc', 'Comment line toggle', 'Code', false)  -- FIXME find a way to put the comment in the first column

-- diagnostics
nXvim.api.KeyMap('n', '<leader>de'       , ':lua vim.diagnostic.open_float()<CR>'                                                                   , 'LSP diagnostics floating window' , 'Code')
nXvim.api.KeyMap('n', '<leader>dl'       , ':lua vim.diagnostic.setloclist()<CR>'                                                                   , 'LSP diagnostics list'            , 'Code')
nXvim.api.KeyMap('n', '<leader>dn'       , ':lua vim.diagnostic.jump({ count = 1, float = true })<CR>'                                              , 'LSP goto to next issue'          , 'Code')
nXvim.api.KeyMap('n', '<leader>dne'      , ':lua vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.ERROR })<CR>'    , 'LSP goto to next ERROR'          , 'Code')
nXvim.api.KeyMap('n', '<leader>dnw'      , ':lua vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.WARN })<CR>'     , 'LSP goto to next WARNING'        , 'Code')
nXvim.api.KeyMap('n', '<leader>dni'      , ':lua vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.INFO })<CR>'     , 'LSP goto to next INFO'           , 'Code')
nXvim.api.KeyMap('n', '<leader>dnh'      , ':lua vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.HINT })<CR>'     , 'LSP goto to next HINT'           , 'Code')
nXvim.api.KeyMap('n', '<leader>dp'       , ':lua vim.diagnostic.jump({ count = -1, float = true })<CR>'                                             , 'LSP goto to previous issue'      , 'Code')
nXvim.api.KeyMap('n', '<leader>dpe'      , ':lua vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.ERROR })<CR>'   , 'LSP goto to previous ERROR'      , 'Code')
nXvim.api.KeyMap('n', '<leader>dpw'      , ':lua vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.WARN })<CR>'    , 'LSP goto to previous WRNING'     , 'Code')
nXvim.api.KeyMap('n', '<leader>dpi'      , ':lua vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.INFO })<CR>'    , 'LSP goto to previous INFO'       , 'Code')
nXvim.api.KeyMap('n', '<leader>dph'      , ':lua vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.HINT })<CR>'    , 'LSP goto to previous HINT'       , 'Code')

-- buffer resize
nXvim.api.KeyMap('n', '<C-Left>'     , ':vertical resize +1<CR>'     ,  'Window increase verical +1'    , 'Window')
nXvim.api.KeyMap('n', '<C-Right>'    , ':vertical resize -1<CR>'     ,  'Window decrease vertical -1'   , 'Window')
nXvim.api.KeyMap('n', '<C-Up'        , ':horizontal resize +1<CR>'   ,  'Window increase horizontal +1' , 'Window')
nXvim.api.KeyMap('n', '<C-Down>'     , ':horizontal resize -1<CR>'   ,  'Window decrease horizontal -1' , 'Window')

--toggleterm
nXvim.api.KeyMap('n', '<leader>tt'   , ':ToggleTerm<CR>'                     , 'Toogle terminal window'             , 'Terminal')
nXvim.api.KeyMap('n', '<leader>tf'   , ':ToggleTerm direction=float<CR>'     , 'Toogle floating terminal window'    , 'Terminal')
nXvim.api.KeyMap('n', '<leader>ts'   , ':TermSelect<CR>'                     , 'Select terminal'                    , 'Terminal')
nXvim.api.KeyMap('n', '<leader>tn'   , ':TermNew<CR>'                        , 'New terminal'                       , 'Terminal')
nXvim.api.KeyMap('n', '<leader>tnf'  , ':TermNew direction=float<CR>'        , 'New floating terminal'              , 'Terminal')

-- Blink autocompletion
nXvim.api.HelpMap('Enter'               , 'Accept'                          , 'Auto Completion')
nXvim.api.HelpMap('Tab'                 , 'Select next'                     , 'Auto Completion')
nXvim.api.HelpMap('Shift + Tab'         , 'Select previous'                 , 'Auto Completion')
nXvim.api.HelpMap('Control + Space'     , 'Show/hide auto completion'       , 'Auto Completion')
nXvim.api.HelpMap('Control + k'         , 'Show signature'                  , 'Auto Completion')

-- DAP
vim.api.nvim_create_user_command('DapStart', function()
  vim.cmd('DapNew')
  vim.cmd('DapViewOpen')
end, {})

vim.api.nvim_create_user_command('DapEnd', function()
  vim.cmd('DapTerminate')
  vim.cmd('DapViewClose')
end, {})

nXvim.api.KeyMap('n', '<leader>ds'   , ':DapStart<CR>'                   , 'Start debugger'     , 'Debug')
nXvim.api.KeyMap('n', '<leader>db'   , ':DapToggleBreakpoint<CR>'        , 'Toggle breakpoint'  , 'Debug')
nXvim.api.KeyMap('n', '<leader>dc'   , ':DapContinue<CR>'                , 'Continue'           , 'Debug')
nXvim.api.KeyMap('n', '<leader>di'   , ':DapStepInto<CR>'                , 'Step Into'          , 'Debug')
nXvim.api.KeyMap('n', '<leader>do'   , ':DapStepOut<CR>'                 , 'Step Out'           , 'Debug')
nXvim.api.KeyMap('n', '<leader>dn'   , ':DapStepOver<CR>'                , 'Step Over'          , 'Debug')
nXvim.api.KeyMap('n', '<leader>de'   , ':DapEnd<CR>'                     , 'Start debugger'     , 'Debug')

-- ----------------------------------------------------------------------------
-- END KEYMAPS ----------------------------------------------------------------
-- ----------------------------------------------------------------------------


-- had to install fzf executable
-- had to install hack patched https://github.com/source-foundry/Hack

-- ----------------------------------------------------------------------------
-- START CONFIG FUNCTIONS -----------------------------------------------------
-- ----------------------------------------------------------------------------

function LuaLineConfig()
    require('lualine').setup()
end

function TreeSitterConfig()
    require('nvim-treesitter.configs').setup({
        ensure_installed = { 'markdown', 'vim', 'vimdoc' },
        auto_install = true
    })
end

function LspConfig()
    require('mason').setup()
    require('mason-lspconfig').setup({
        ensure_installed = {'clangd', 'lua_ls@3.15.0'},
    })

    vim.lsp.config('clangd', {
        root_markers = {
            'compile_commands.json',
            'compile_flags.txt',
            'Makefile',
            'configure.ac',
            'configure.in',
            'config.h.in',
            'meson.build',
            'meson_options.txt',
            'build.ninja',
            '.git',
        },

        cmd = {
            'clangd',
            '--background-index',
            '--clang-tidy',
            '--header-insertion=never',
            '--fallback-style=llvm',
            '--completion-style=bundled',
            '--function-arg-placeholders=true'
        },
        filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'cxx', 'hpp' },
    })
    vim.lsp.enable('clangd')
    

-- add lua language server to path
    vim.lsp.config('lua_ls', {
        root_markers = { '.luarc.json', '.git' },
        cmd = { 'lua-language-server' },
        settings = {
            Lua = {
                runtime = { 
                    version = 'LuaJIT' 
                },
                diagnostics = {
                    globals = {'vim'} 
                }
            },
        },
        filetypes = { 'lua' },
    })
    vim.lsp.enable('lua_ls')

-- if you need a linter or extra formating use none-ls plugin

end

function TinyCodeActionsConfig()
    require('tiny-code-action').setup({
        picker = {
            'telescope',
            opts = {
                hotkeys         = true,                 -- Enable hotkeys for quick selection of actions
                hotkeys_mode    = 'text_diff_based',    -- Modes for generating hotkeys
                auto_preview    = false,                -- Enable or disable automatic preview
                auto_accept     = false,                -- Automatically accept the selected action
                position        = 'cursor',             -- Position of the picker window
                winborder       = 'single',             -- Border style for picker and preview windows
                custom_keys = {
                    { key = 'm', pattern = 'Fill match arms' },
                    { key = 'r', pattern = 'Rename.*' },        -- Lua pattern matching
                },
            },
        },
    })
end

function TelescopeConfig()
    require('telescope').setup {
        extensions = {
            ['ui-select'] = {
                require('telescope.themes').get_dropdown {
                }
            }
        }
    }
    require('telescope').load_extension('ui-select')
end

function AlphaSplashConfig()
    -- alpha nvim setup
    -- https://patorjk.com/software/taag/ for creating new logos
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    dashboard.section.header.val = {
        '           ░██    ░██            ░██                   ',
        '            ░██  ░██                                   ',
        '░████████    ░██░██   ░██    ░██ ░██░█████████████     ',
        '░██    ░██    ░███    ░██    ░██ ░██░██   ░██   ░██    ',
        '░██    ░██   ░██░██    ░██  ░██  ░██░██   ░██   ░██    ',
        '░██    ░██  ░██  ░██    ░██░██   ░██░██   ░██   ░██    ',
        '░██    ░██ ░██    ░██    ░███    ░██░██   ░██   ░██    ',
        '                                                       ',
    }

    dashboard.section.buttons.val = {
        dashboard.button( 'n', '  New file'    , ':ene <BAR> startinsert <CR>'),
        dashboard.button( 'f', '  Find file'   , ':Telescope find_files<CR>'),
        dashboard.button( 'r', '  Recent'      , ':Telescope oldfiles<CR>'),
        dashboard.button( 's', '  Settings'    , ':e $MYVIMRC<CR>'),
        dashboard.button( 'q', '  Quit'        , ':qa<CR>'),
    }

    -- config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[
       autocmd FileType alpha setlocal nofoldenable
    ]])
end


function BlinkConfig()
    local blink = require('blink.cmp')

    blink.setup({
        fuzzy = {
            implementation = "lua",
        },
        completion = {
            menu = {
                auto_show = false,
            },
            documentation = {
                auto_show = false,
                auto_show_delay_ms = 500
            }
        },
        signature = { 
            enabled = true 
        },
        snippets = {
            preset = "luasnip"
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        keymap = {
            preset = "default",   -- optional, but good starting point

            ['<CR>']      = { 'accept', 'fallback' },
            ['<Tab>']     = { 'select_next', 'fallback' },
            ['<S-Tab>']   = { 'select_prev', 'fallback'},

--            The default settings
--            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
--            ['<C-e>'] = { 'hide', 'fallback' },
--            ['<C-y>'] = { 'select_and_accept', 'fallback' },
--            ['<Up>'] = { 'select_prev', 'fallback' },
--            ['<Down>'] = { 'select_next', 'fallback' },
--            ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
--            ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
--            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
--            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
--            ['<Tab>'] = { 'snippet_forward', 'fallback' },
--            ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
--            ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },

        },
    })
end

function ToggletermConfig()
    require('toggleterm').setup{}
end

function HydraGenericHelpConfig(hydras)
    local hydra = require('hydra')
    local cmd = require('hydra.keymap-util').cmd

    local head = {}
    local hint = ''

    for key, value in pairs(hydras) do
        local hydra_tmp = nXvim.api.HydraTemplate(value.name, '<leader>h' .. value.cmd, value.group)
        local head_data = {value.cmd, function() hydra_tmp:activate() end, { desc = value.name }}
        table.insert(head, head_data)
        hint = hint .. '_' .. value.cmd .. '_' .. ': ' .. value.name .. '\n'
    end
    table.insert(head, {'<Esc>', nil, { exit = true, nowait = true, desc = 'Exit' }})
    hint = hint .. '_<Esc>_: Exit' .. '\n'

    local hydra_config = hydra({
        name = 'Help',
        hint = hint,
        config = {
            color = 'teal',
            invoke_on_body = true,
            hint = {
                type = 'window',
                position = 'bottom-right',
                border = 'rounded',
            },
        },
        mode = 'n',
        body = '<Leader>h',
        heads = head
    })
end

function HydraConfig()

    local hydras = {}

    hydras = {
        {
            name = 'Search help',
            group = 'Search',
            cmd = 's',
        },
        {
            name = 'Generic help',
            group = 'Generic',
            cmd = 'g',
        },
        {
            name = 'Configure help',
            group = 'Configure',
            cmd = 'x',
        },
        {
            name = 'Code help',
            group = 'Code',
            cmd = 'c',
        },
        {
            name = 'File Browser help',
            group = 'File Browser',
            cmd = 'f',
        },
        {
            name = 'Window help',
            group = 'Window',
            cmd = 'w',
        },
        {
            name = 'Terminal help',
            group = 'Terminal',
            cmd = 't',
        },
        {
            name = 'Auto Completion help',
            group = 'Auto Completion',
            cmd = 'a',
        },
        {
            name = 'Debug Help',
            group = 'Debug',
            cmd = 'd',
        }
    }

    HydraGenericHelpConfig(hydras);
end


function DapConfig()
    local dap = require('dap')
    local mason_dap = require('mason-nvim-dap')

    mason_dap.setup({
        ensure_installed = { 'cppdbg' },
        automatic_installation = true,
        handlers = {
            function(config)
                require('mason-nvim-dap').default_setup(config)
            end,
        },
    })

    dap.configurations.cpp = {
        {
            name = 'Launch file',
            type = 'cppdbg',
            request = 'launch',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopAtEntry = true,
        },
        {
            name = 'Attach to gdbserver :1234',
            type = 'cppdbg',
            request = 'launch',
            MIMode = 'gdb',
            miDebuggerServerAddress = 'localhost:1234',
            miDebuggerPath = '/usr/bin/gdb',
            cwd = '${workspaceFolder}',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
        },
    }

    dap.configurations.c = dap.configurations.cpp

    require('dap-view').setup()

end

function IlluminateConfig()
    require('illuminate')
end

function NavicConfig()
    local navic = require("nvim-navic")

--    vim.api.nvim_set_hl(0, "NavicIconsFile",          {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsModule",        {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsNamespace",     {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsPackage",       {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsClass",         {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsMethod",        {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsProperty",      {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsField",         {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsConstructor",   {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsEnum",          {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsInterface",     {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsFunction",      {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsVariable",      {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsConstant",      {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsString",        {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsNumber",        {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsBoolean",       {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsArray",         {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsObject",        {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsKey",           {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsNull",          {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsEnumMember",    {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsStruct",        {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsEvent",         {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsOperator",      {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicText",               {default = true, bg = "#000000", fg = "#ffffff"})
--    vim.api.nvim_set_hl(0, "NavicSeparator",          {default = true, bg = "#000000", fg = "#ffffff"})

    navic.setup{
        highlight = true
    }

    require('lspconfig').clangd.setup {
        on_attach = function(client, bufnr)
            navic.attach(client, bufnr)
        end
    }
end

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- ----------------------------------------------------------------------------
-- END CONFIG FUNCTIONS -------------------------------------------------------
-- ----------------------------------------------------------------------------

-- ############################################################################
-- ############################################################################
-- ############################################################################
-- ############################################################################
-- ############################################################################


-- ----------------------------------------------------------------------------
-- START AUTOCMD --------------------------------------------------------------
-- ----------------------------------------------------------------------------

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        nXvim.api.KeyMapBuffer(ev.buf, 'n', '<leader>gD'   , ':lua vim.lsp.buf.declaration()<CR>'                                  , 'LSP goto delcaration'         , 'Code' )
        nXvim.api.KeyMapBuffer(ev.buf, 'n', '<leader>K'    , ':lua vim.lsp.buf.hover({ border = "rounded"})<CR>'                   , 'LSP info'                     , 'Code' )
        nXvim.api.KeyMapBuffer(ev.buf, 'n', '<leader>gd'   , ':lua vim.lsp.buf.definition()<CR>'                                   , 'LSP goto definition'          , 'Code' )
        nXvim.api.KeyMapBuffer(ev.buf, 'n', '<leader>gi'   , ':lua vim.lsp.buf.implementation()<CR>'                               , 'LSP goto implementation'      , 'Code' )
        nXvim.api.KeyMapBuffer(ev.buf, 'n', '<leader>gs'   , ':lua vim.lsp.buf.signature_help()<CR>'                               , 'LSP signature help'           , 'Code' )
        nXvim.api.KeyMapBuffer(ev.buf, 'n', '<leader>wa'   , ':lua vim.lsp.buf.add_workspace_folder()<CR>'                         , 'LSP add workspace'            , 'Code' )
        nXvim.api.KeyMapBuffer(ev.buf, 'n', '<leader>wf'   , ':lua vim.lsp.buf.remove_workspace_folder()<CR>'                      , 'LSP remove workspace'         , 'Code' )
        nXvim.api.KeyMapBuffer(ev.buf, 'n', '<leader>wl'   , ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>'   , 'LSP worspaces'                , 'Code' )
        nXvim.api.KeyMapBuffer(ev.buf, 'n', '<leader>D'    , ':lua vim.lsp.buf.type_definition()<CR>'                              , 'LSP goto type definition'     , 'Code' )
        nXvim.api.KeyMapBuffer(ev.buf, 'n', '<leader>rn'   , ':lua vim.lsp.buf.rename()<CR>'                                       , 'LSP rename'                   , 'Code' )
        nXvim.api.KeyMapBuffer(ev.buf, 'n', '<leader>ca'   , ':lua vim.lsp.buf.code_action()<CR>'                                  , 'LSP code action'              , 'Code' )
        nXvim.api.KeyMapBuffer(ev.buf, 'n', '<leader>gr'   , ':lua vim.lsp.buf.references()<CR>'                                   , 'LSP references'               , 'Code' )
        nXvim.api.KeyMapBuffer(ev.buf, 'n', '<leader>f'    , ':lua vim.lsp.buf.format({ async = true })<CR>'                       , 'LSP format'                   , 'Code' )
    end,
})



-- Open the file at the last position
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = {'*'},
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.api.nvim_exec("normal! g'\"",false)
        end
    end
})

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand('~/.vim/undodir')
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end


-- ----------------------------------------------------------------------------
-- END AUTOCMD ----------------------------------------------------------------
-- ----------------------------------------------------------------------------

-- ############################################################################
-- ############################################################################
-- ############################################################################
-- ############################################################################
-- ############################################################################


-- ----------------------------------------------------------------------------
-- START CALL CONFIG FUNCTIONS ------------------------------------------------
-- ----------------------------------------------------------------------------

LuaLineConfig()
TreeSitterConfig()
LspConfig()
TinyCodeActionsConfig()
TelescopeConfig()
AlphaSplashConfig()
BlinkConfig()
ToggletermConfig()
HydraConfig()
DapConfig()
NavicConfig()
IlluminateConfig()



-- ----------------------------------------------------------------------------
-- END CALL CONFIG FUNCTIONS --------------------------------------------------
-- ----------------------------------------------------------------------------

-- ############################################################################
-- ############################################################################
-- ############################################################################
-- ############################################################################
-- ############################################################################

