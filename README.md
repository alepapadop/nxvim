![nxvim_image](https://github.com/alepapadop/nxvim/blob/main/nxvim_intro.png)

# nXvim - Next Vim

An opinionated Neovim distribution that tries to implement the KISS principle.

A single configuration file that uses a minimal API, which can be ignored. It tries to keep things
simple by using the native Neovim API, with a preference for the vim.api interface over Lua.
It aims to use as much built-in functionality as possible instead of relying on plugins.

Ready for Lua and C/C++ development.

## Installation
+ Prerequisites  
  - Neovim 0.12 or higher  
  - Lua language installed  
  - Clangd (C++ LSP)  
  - GCC (Compiler)  
  - Fonts: Install the 0xProto Nerd Font.
        Check if your distribution has a font management tool or search your package manager.
        If unavailable, download it from nerdfonts.com.
        Extract the ZIP content into /usr/share/fonts/ (system-wide) or ~/.local/share/fonts/ (user-specific). If your distro uses a different directory, place them accordingly.

+ Installation Steps
  - Create the configuration directory if it doesn't exist: mkdir -p ~/.config/nvim/
  - Place the init.lua file inside that directory.
  - Launch Neovim by typing nvim in your terminal.
  - In your terminal settings, change the display font to 0xProto Nerd Font.
  - Restart the terminal and launch nvim again.
  - You are ready to go!

+ Post-Installation / Troubleshooting  
  - Your distribution may be missing some required executables. Run :checkhealth inside Neovim to see a list of warnings or errors. Common dependencies include:
    gcc, lua, clangd, fzf, treesitter, rg (ripgrep), fd (fd-find)
  - If a package misbehaves, you can lock it to a specific version. In Packer, use the following syntax: `version = vim.version.range("^18.0.0")`.  
    Similarly, for the Mason language server manager, use: `ensure_installed = {'clangd', 'lua_ls@3.15.0'}`.
 

## Plugins

+ **Theme**

  | Plugin | Location |
  | --- | --- |
  | Catppuccin | https://github.com/catppuccin/nvim  |  

+ **Syntax**
  | Plugin | Location |
  | --- | --- |
  | Treesitter | https://github.com/nvim-treesitter/nvim-treesitter  |  

+ **Searching**
  
  | Plugin | Location |
  | --- | --- |  
  | Telescope | https://github.com/nvim-telescope/telescope.nvim  |  

+ **Status line**
  
  | Plugin | Location |
  | --- | --- |  
  | LuaLine | https://github.com/nvim-lualine/lualine.nvim  |  

+ **Icons**
  
  | Plugin | Location |
  | --- | --- |  
  | WebDevicons | https://github.com/nvim-tree/nvim-web-devicons  |
  | VimDevicons | https://github.com/ryanoasis/vim-devicons  |
  | Mini Icons | https://github.com/nvim-mini/mini.icons  |  

+ **Greeter**
  
  | Plugin | Location |
  | --- | --- |  
  | Alpha | https://github.com/goolord/alpha-nvim  |  

+ **File Browser**
  
  | Plugin | Location |
  | --- | --- |  
  | Neo Tree | https://github.com/nvim-neo-tree/neo-tree.nvim  |  

+ **LSP manager**
  
  | Plugin | Location |
  | --- | --- |  
  | Mason | https://github.com/mason-org/mason.nvim  |
  | Mason - LSP | https://github.com/mason-org/mason-lspconfig.nvim  |

+ **Coding**
  
  | Plugin | Location |
  | --- | --- |  
  | Blink | https://github.com/saghen/blink.cmp  |
  | Illuminate | https://github.com/RRethy/vim-illuminate  |
  | Navic | https://github.com/SmiteshP/nvim-navic  |

+ **Terminal**
  
  | Plugin | Location |
  | --- | --- |  
  | ToggleTerm | https://github.com/akinsho/toggleterm.nvim  |  

+ **Debugging**
  
  | Plugin | Location |
  | --- | --- |  
  | Nvim dap | https://github.com/mfussenegger/nvim-dap  |
  | Mason dap | https://github.com/jay-babu/mason-nvim-dap.nvim  |
  | Dap view | https://github.com/igorlfs/nvim-dap-vie  | 

+ **Key help**
  
  | Plugin | Location |
  | --- | --- |  
  | Hydra | https://github.com/nvimtools/hydra.nvim  |

+ **AI**
  
  | Plugin | Location |
  | --- | --- |  
  | Avante | https://github.com/yetone/avante.nvim  |  

+ **Dependencies & Helper plugins**
  
  | Plugin | Location |
  | --- | --- |  
  | Plenary | https://github.com/nvim-lua/plenary.nvim  |
  | Telescope UI select | https://github.com/nvim-telescope/telescope-ui-select.nvim  |
  | Nui | https://github.com/MunifTanjim/nui.nvim  |
  | Tiny Code actions | https://github.com/rachartier/tiny-code-action.nvim  |
  | fzf lua | https://github.com/ibhagwan/fzf-lua  |
  | LuaSnip | https://github.com/L3MON4D3/LuaSnip  |

## nXvim API

The nXvim API is used primarily to define key mappings.

+ **Namespace**  
`nXvim.api`

+ **Libraryfunctions should not be used directly; they are helper functions intended for implementing other features**  
`nXvim.api.MapAddTableData`  
`nXvim.api.HydraHead`  
`nXvim.api.HydraHint`  
`nXvim.api.HydraTemplate`  

+ **User-space functions can be used for further configuration by the user**  
`nXvim.api.KeyMap`  
`nXvim.api.KeyMapBuffer`  
`nXvim.api.HelpMap`  

These functions are used to map keys to the Hydra. The functions are well documented inside the configuration file.

## Configuration Structure ##
The configuration file is well-structured. The start and end of each section are marked with a multi-line comment and a header.   
The configuration sections are as follows:   
+ Package manager calls
+ nXvim API
+ nvim builtin options
+ Key mapping
+ Plugin configuration functions
+ Auto commands
+ Plugin configuraton function call section

Each plugin is configured in a dedicated function, and at the end of the file, the plugin configuration functions are called  

## AI configuration ##
Currently, the Avante plugin is used to provide AI assistance. To configure the AI, an API key is required; the plugin's documentation page contains detailed instructions.   
For Google Gemini, you can obtain a free API key at https://aistudio.google.com/app/api-keys. Afterward, add the following to your `.bashrc` file:  
`export GEMINI_API_KEY="your_key_here"` (be sure to keep the quotes)  
Right now, Gemini's free plan is a good option, as it offers a large token capacity. Of course, this doesn't mean that it is the best option.  

## Key Mappings

Users can find all custom key mappings by pressing `<leader>h`. The Hydra plugin will then present a menu with the key mappings categorized by action type

+ **Leader**  
  The leader key is `\`   

+ **Configuration**
  
| Key | Function |
| --- | --- |
| `<leader>cs` | Source init lua file |
| `<leader>ce` | Edit init lua file |

+ **Search**
  
| Key | Function |
| --- | --- |
| `<leader>ff` | Telescope find files |
| `<leader>fg` | Telescope live grep |
| `<leader>fb` | Telescope find in buffers |
| `<leader>fh` | Telescope help tags |

+ **Code**  

| Key | Function |
| --- | --- |
| `<leader>td` | Telescope diagnostics |
| `<leader>tr` | Telescope references |
| `<leader>tin` | Telescope incoming calls |
| `<leader>tou` | Telescope outgoing calls |
| `<leader>tdb` | Telescope document symbols in buffer |
| `<leader>tdw` | Telescope document symbols in workspace |
| `<leader>ti` | Telescope goto implementation |
| `<leader>tdf` | Telescope goto definition |
| `<leader>tdt` | Telescope goto type definition |
| `<leader>cf` | Telescope code action |
| `<leader>de` | LSP diagnostics floating window |
| `<leader>dl` | LSP diagnostics list |
| `<leader>dn` | LSP goto next issue |
| `<leader>dne` | LSP goto next issue ERROR |
| `<leader>dnw` | LSP goto next issue WARNING |
| `<leader>dni` | LSP goto next issue INFO |
| `<leader>dnh` | LSP goto next issue HINT |
| `<leader>dpe` | LSP goto previous issue ERROR |
| `<leader>dpw` | LSP goto previous issue WARNING |
| `<leader>dpi` | LSP goto previous issue INFO |
| `<leader>dph` | LSP goto previous issue HINT |
| `<leader>gD` | LSP goto declaration |
| `<leader>K` | LSP info |
| `<leader>gd` | LSP goto definition |
| `<leader>gi` | LSP goto implementation |
| `<leader>gs` | LSP signature help |
| `<leader>wa` | LSP add workspace |
| `<leader>wl` | LSP workspaces |
| `<leader>D` | LSP goto type definition |
| `<leader>rn` | LSP rename |
| `<leader>ca` | LSP code action |
| `<leader>gr` | LSP references |

+ **File Browser**

| Key | Function |
| --- | --- |
| `<leader>b` | Neotree toggle file browser |


+ **Comments**

| Key | Function |
| --- | --- |
| `<leader>cc` | Comment line toggle |



+ **Window**  

| Key | Function |
| --- | --- |
| `Control + Left` | Vertical resize +1 |
| `Control + Right` | Vertical resize -1 |
| `Control + Up` | Horizontal resize +1 |
| `Control + Down` | Horizontal resize -1 |

+ **Terminal**  

| Key | Function |
| --- | --- |
| `<leader>tt` | Toogle terminal window |
| `<leader>tf` | Toogle floating terminal window |
| `<leader>ts` | Select terminal |
| `<leader>tn` | New terminal |
| `<leader>tnf` | New floating terminal |

+ **Auto Completion**
  
| Key | Function |
| --- | --- |
| `Enter` | Accept |
| `Tab` | Select Next |
| `Shift + Tab` | Select previous |
| `Control + Space` | Show/Hide auto completion |
| `Control + k` | Show signature |

+ **Debug**
  
| Key | Function |
| --- | --- |
| `<leader>ds` | Start debugger |
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continue |
| `<leader>di` | Step Into |
| `<leader>do` | Step Out |
| `<leader>dn` | Step Over |
| `<leader>de` | Stop debugger |

+ **AI**
  
| Key | Function |
| --- | --- |
| `<leader>a` | Avante toggle |
  

+ **Help**
  
| Key | Function |
| --- | --- |
| `<leader>h` | Show Hydra help window |

















