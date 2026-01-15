# nxvim
An opinionated Neovim distribution that tries to implement the KISS principle.

A single configuration file that uses a minimal API, which can be ignored. It tries to keep things
simple by using the native Neovim API, with a preference for the vim.api interface over Lua.
It aims to use as much built-in functionality as possible instead of relying on plugins.

Ready for Lua and C/C++ development.


The main plugins are:

+ Theme:
[catppuccin](https://github.com/catppuccin/nvim)  

+ Syntax:
[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)  

+Searching:
[Telescope](https://github.com/nvim-telescope/telescope.nvim)  

+ Status line:
[LuaLine](https://github.com/nvim-lualine/lualine.nvim)  

+ Icons:
[WebDevicons](https://github.com/nvim-tree/nvim-web-devicons)  
[VimDevicons](https://github.com/ryanoasis/vim-devicons)  
[Mini Icons](https://github.com/nvim-mini/mini.icons)  

+ Greeter:
[Alpha](https://github.com/goolord/alpha-nvim)  

+ File Browser:
[Neo Tree](https://github.com/nvim-neo-tree/neo-tree.nvim)  

+ LSP manager:
[Mason](https://github.com/mason-org/mason.nvim)  
[Mason - LSP](https://github.com/mason-org/mason-lspconfig.nvim)  

+ Coding:
[Blink](https://github.com/saghen/blink.cmp)  
[Illuminate](https://github.com/RRethy/vim-illuminate)  
[Navic](https://github.com/SmiteshP/nvim-navic)  

+ Terminal:
[ToggleTerm](https://github.com/akinsho/toggleterm.nvim)  

+ Debugging:
[Nvim dap](https://github.com/mfussenegger/nvim-dap)  
[Mason dap](https://github.com/jay-babu/mason-nvim-dap.nvim)  
[Dap view](https://github.com/igorlfs/nvim-dap-vie)  

+ Key help:
[Hydra](https://github.com/nvimtools/hydra.nvim)  

+ AI:
[Avante](https://github.com/yetone/avante.nvim)  

+ Dependencies & Helper plugins:
[Plenary](https://github.com/nvim-lua/plenary.nvim)  
[Telescope UI select](https://github.com/nvim-telescope/telescope-ui-select.nvim)  
[Nui](https://github.com/MunifTanjim/nui.nvim)  
[Tiny Code actions](https://github.com/rachartier/tiny-code-action.nvim)  
[fzf lua](https://github.com/ibhagwan/fzf-lua)  
[LuaSnip](https://github.com/L3MON4D3/LuaSnip)  



The nXvim API is used primarily to define key mappings.

Namespace
nXvim.api

Libraryfunctions should not be used directly; they are helper functions intended for implementing other features.
nXvim.api.MapAddTableData
nXvim.api.HydraHead
nXvim.api.HydraHint
nXvim.api.HydraTemplate

User-space functions can be used for further configuration by the user.
nXvim.api.KeyMap
nXvim.api.KeyMapBuffer
nXvim.api.HelpMap

These functions are used to map keys to the Hydra. The functions are well documented inside the configuration file.



















