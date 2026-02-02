# nXvim - Next Vim

An opinionated Neovim distribution that tries to implement the KISS principle.

A single configuration file that uses a minimal API, which can be ignored. It tries to keep things
simple by using the native Neovim API, with a preference for the vim.api interface over Lua.
It aims to use as much built-in functionality as possible instead of relying on plugins.

Ready for Lua and C/C++ development.


## Plugins

+ **Theme**  
Catppuccin : https://github.com/catppuccin/nvim  

+ **Syntax**  
Treesitter: https://github.com/nvim-treesitter/nvim-treesitter  

+ **Searching**    
Telescope: https://github.com/nvim-telescope/telescope.nvim  

+ **Status line**  
LuaLine: https://github.com/nvim-lualine/lualine.nvim  

+ **Icons**  
WebDevicons: https://github.com/nvim-tree/nvim-web-devicons  
VimDevicons: https://github.com/ryanoasis/vim-devicons  
Mini Icons: https://github.com/nvim-mini/mini.icons  

+ **Greeter**  
Alpha: https://github.com/goolord/alpha-nvim  

+ **File Browser**  
Neo Tree: https://github.com/nvim-neo-tree/neo-tree.nvim  

+ **LSP manager**  
Mason: https://github.com/mason-org/mason.nvim  
Mason - LSP: https://github.com/mason-org/mason-lspconfig.nvim  

+ **Coding**  
Blink: https://github.com/saghen/blink.cmp  
Illuminate: https://github.com/RRethy/vim-illuminate  
Navic: https://github.com/SmiteshP/nvim-navic  

+ **Terminal**
ToggleTerm: https://github.com/akinsho/toggleterm.nvim    

+ **Debugging**
Nvim dap: https://github.com/mfussenegger/nvim-dap  
Mason dap: https://github.com/jay-babu/mason-nvim-dap.nvim  
Dap view: https://github.com/igorlfs/nvim-dap-vie  

+ **Key help**  
Hydra: https://github.com/nvimtools/hydra.nvim  

+ **AI**  
Avante: https://github.com/yetone/avante.nvim  

+ **Dependencies & Helper plugins**  
Plenary: https://github.com/nvim-lua/plenary.nvim  
Telescope UI select: https://github.com/nvim-telescope/telescope-ui-select.nvim  
Nui: https://github.com/MunifTanjim/nui.nvim  
Tiny Code actions: https://github.com/rachartier/tiny-code-action.nvim  
fzf lua: https://github.com/ibhagwan/fzf-lua  
LuaSnip: https://github.com/L3MON4D3/LuaSnip  

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


## Key Mappings

The user can find all the custom key mappings by pressing <leader>h, the hydra plugin will present a menu with the key mappings
categorized per action type. 

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

  
  


  
##
Explain its plugin  
Check external packages  
Add support for Python, Rust, Html, JS, Carbon, Go  
Create Website  
















