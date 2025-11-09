# xghost.nvim

A vibrant, warm Neovim colorscheme with rich syntax highlighting. Beautiful colors that are easy on the eyes while maintaining excellent contrast and readability.

## Features

- **Multiple Styles**: Currently ships with `default` (vibrant/warm), with additional variants coming soon
- **Rich Colors**: Vibrant syntax highlighting with carefully chosen colors for optimal readability
- **Plugin Support**: First-class support for popular plugins
  - TreeSitter (enhanced syntax highlighting)
  - LSP (diagnostics, references, inlay hints)
  - Telescope (fuzzy finder)
  - GitSigns/vim-gitgutter (git integration)
  - NvimTree/NeoTree (file explorers)
  - Bufferline, Lualine, and more
- **Customizable**: Extensive configuration options
- **Performance**: Optimized for fast loading
- **Clean Codebase**: Modular architecture makes it easy to extend

## Installation

### lazy.nvim

```lua
{
  "qdrtech/xghost.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("xghost").setup({
      -- your configuration here (optional)
    })
    vim.cmd([[colorscheme xghost]])
  end,
}
```

### packer.nvim

```lua
use {
  "qdrtech/xghost.nvim",
  config = function()
    require("xghost").setup({
      -- your configuration here (optional)
    })
    vim.cmd([[colorscheme xghost]])
  end
}
```

### vim-plug

```vim
Plug 'qdrtech/xghost.nvim'

" Then in your init.vim or init.lua:
lua << EOF
require("xghost").setup()
vim.cmd([[colorscheme xghost]])
EOF
```

## Configuration

### Default Configuration

```lua
require("xghost").setup({
  -- Theme style: "default", "dark", "light", "warm" (more coming soon)
  style = "default",

  -- Enable/disable transparent background
  transparent = false,

  -- Style options
  italic_comments = true,
  italic_keywords = false,
  bold_keywords = true,

  -- UI options
  hide_inactive_statusline = false,
  darker_sidebar = true,

  -- Override specific highlight groups
  overrides = {},

  -- Plugin integrations (all enabled by default)
  plugins = {
    treesitter = true,
    lsp = true,
    telescope = true,
    gitsigns = true,
    nvim_tree = true,
    neo_tree = true,
    bufferline = true,
    lualine = true,
    indent_blankline = true,
  },
})
```

### Example Configurations

#### Transparent Background

```lua
require("xghost").setup({
  transparent = true,
})
```

#### Custom Overrides

```lua
require("xghost").setup({
  overrides = {
    -- Make comments more visible
    Comment = { fg = "#8e8e93", italic = true },

    -- Custom function color
    ["@function"] = { fg = "#0a84ff", bold = true },
  },
})
```

#### Minimal Plugin Support

```lua
require("xghost").setup({
  plugins = {
    treesitter = true,
    lsp = true,
    telescope = false,
    gitsigns = false,
    nvim_tree = false,
    neo_tree = false,
    bufferline = false,
    lualine = false,
    indent_blankline = false,
  },
})
```

## Usage

### Basic Usage

```lua
-- In your init.lua or init.vim
vim.cmd([[colorscheme xghost]])
```

### Switch Styles at Runtime

```lua
-- Change to a different style (when available)
require("xghost").set_style("dark")
require("xghost").set_style("light")
require("xghost").set_style("warm")
```

### Get Available Styles

```lua
local styles = require("xghost").get_styles()
print(vim.inspect(styles))
```

### Get Current Colors

```lua
local colors = require("xghost").get_colors()
-- Use colors in your own config
print(colors.blue) -- #61afef
```

## Color Palette (Default Style)

The default style features vibrant, warm colors with excellent contrast.

### Base Colors

| Color | Hex | Usage |
|-------|-----|-------|
| Background | `#282c34` | Editor background |
| Foreground | `#abb2bf` | Primary text |
| Comment | `#5c6370` | Comments |
| Selection | `#3e4451` | Visual selection |

### Syntax Colors

| Color | Hex | Usage |
|-------|-----|-------|
| Blue | `#61afef` | Functions, methods |
| Cyan | `#56b6c2` | Special strings, escape sequences |
| Green | `#98c379` | Strings, success, git additions |
| Yellow | `#e5c07b` | Classes, types, warnings |
| Orange | `#d19a66` | Numbers, constants |
| Red | `#e06c75` | Errors, git deletions |
| Magenta | `#c678dd` | Keywords, control flow |

## Supported Plugins

xghost.nvim includes highlight groups for popular plugins:

- **Syntax**: TreeSitter, LSP Semantic Tokens
- **LSP**: Diagnostics, References, Inlay Hints, Code Lens
- **Git**: GitSigns, vim-gitgutter, Neogit, Diffview
- **Files**: NvimTree, NeoTree
- **UI**: Telescope, WhichKey, Notify
- **Statusline**: Lualine, Bufferline
- **Indent**: indent-blankline

## Development Roadmap

- [x] Default vibrant/warm style
- [ ] Monochrome variant
- [ ] Light variant
- [ ] High contrast variant
- [ ] Additional plugin support
- [ ] Theme generator/customizer
- [ ] Lualine theme integration
- [ ] Terminal emulator themes

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT

## Credits

Created by qdrtech

Inspired by popular warm color schemes and the Neovim community
