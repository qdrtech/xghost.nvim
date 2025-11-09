<a name="top"></a>

# xghost.nvim

Warm, modern Neovim colors inspired by macOS system palettes. xghost delivers punchy accents, soft neutrals, and carefully tuned UI surfaces so long sessions stay easy on the eyes without sacrificing contrast.

## Highlights

- **Cohesive palettes** – `default` (warm/neutral) and `warm` (sunset) palettes are hand-designed from the same spec, with additional variants on the roadmap.
- **Mac-first feel** – Status lines, popups, tabs, and diagnostics mimic macOS tooling so Neovim looks at home on Aqua desktops.
- **Plugin coverage out of the box** – Treesitter, built-in LSP, Telescope, Git integrations, file explorers, Bufferline, Lualine, Snacks, Oil, indent guides, WhichKey, Notify, and more.
- **Smart ergonomics** – Subtle search highlights, legible diff colors, virtual text backgrounds, and configurable transparency keep busy UIs readable.
- **Tweak-friendly** – Toggle italics/bold, sidebar contrast, transparent windows, or override any highlight group in code.
- **Lightweight implementation** – Pure Lua highlight definitions; no runtime dependencies; loads instantly during startup.

---

## Requirements

- Neovim **0.9+** (uses `vim.api.nvim_set_hl` and modern highlight groups).
- Terminal with true-color (`termguicolors`) support.
- Plugin manager of your choice (`lazy.nvim`, `packer.nvim`, `vim-plug`, etc.).

---

## Installation

### lazy.nvim

```lua
{
  "qdrtech/xghost.nvim",
  priority = 1000,     -- make sure it's applied before other UI plugins
  opts = {
    -- configuration table (see below)
  },
  config = function(_, opts)
    require("xghost").setup(opts)
    vim.cmd.colorscheme("xghost")
  end,
}
```

### packer.nvim

```lua
use({
  "qdrtech/xghost.nvim",
  config = function()
    require("xghost").setup()
    vim.cmd.colorscheme("xghost")
  end,
})
```

### vim-plug

```vim
Plug 'qdrtech/xghost.nvim'

lua << EOF
require("xghost").setup()
vim.cmd.colorscheme("xghost")
EOF
```

---

## Quick Start

```lua
require("xghost").setup()  -- accept sane defaults
vim.cmd.colorscheme("xghost")
```

`setup()` automatically loads the theme, so calling `vim.cmd.colorscheme("xghost")` afterwards is optional but keeps the intent explicit.

---

## Configuration Reference

```lua
require("xghost").setup({
  style = "default",            -- or "warm"
  transparent = false,          -- keep background or inherit terminal
  italic_comments = true,
  italic_keywords = false,
  bold_keywords = true,
  hide_inactive_statusline = false,
  darker_sidebar = true,        -- darker NvimTree / Telescope backgrounds
  overrides = {},               -- function or table with highlight overrides
  plugins = {
    treesitter = true,
    lsp = true,
    telescope = true,
    gitsigns = true,
    nvim_tree = true,
    neo_tree = true,
    bufferline = true,
    lualine = true,
    snacks = true,
    oil = true,
    indent_blankline = true,
  },
})
```

| Option                                                | Description                                                                                    |
| ----------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| `style`                                               | Palette to load (`default`, `warm`). Unsupported styles fall back to `default` with a warning. |
| `transparent`                                         | Removes window backgrounds so the terminal or GUI background shows through.                    |
| `italic_comments`, `italic_keywords`, `bold_keywords` | Toggle common stylistic emphases.                                                              |
| `hide_inactive_statusline`                            | Dim status lines in unfocused windows.                                                         |
| `darker_sidebar`                                      | Use sidebar-specific background for file explorers, Telescope, etc.                            |
| `overrides`                                           | Table (or function returning a table) of highlight definitions merged last.                    |
| `plugins`                                             | Fine-grained switches for each integration module (disable if you prefer plugin defaults).     |

---

## Recipes

**Transparent editing surface**

```lua
require("xghost").setup({
  transparent = true,
  overrides = {
    NormalFloat = { bg = "none" },
    FloatBorder = { bg = "none" },
  },
})
```

**Switch palette on the fly**

```lua
local xghost = require("xghost")
xghost.set_style("warm")
```

**Targeted highlight overrides**

```lua
require("xghost").setup({
  overrides = {
    Comment = { fg = "#8E8E93", italic = true },
    ["@function.call"] = { fg = "#0A84FF", bold = true },
    LspInlayHint = { fg = "#B0B3BD", bg = "#2A2C31" },
  },
})
```

**Minimal plugin footprint**

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
    snacks = false,
    oil = false,
    indent_blankline = false,
  },
})
```

---

## Runtime Helpers

```lua
local xghost = require("xghost")

local available = xghost.get_styles()  -- { "default", "warm" }
local current = xghost.get_colors()    -- table with fg/bg/accent keys
xghost.set_style("default")            -- re-applies highlights immediately
```

These helpers are handy for keymaps, statusline components, or dynamic daylight/night toggles.

---

## Plugin Integrations

- **Treesitter** – Dedicated capture groups for function calls, fields, text objects, injected languages, etc.
- **Neovim LSP** – Diagnostics, inlay hints, code lens, signature help, references, floating windows, and sign columns.
- **Git tooling** – GitSigns, `diffview`, sign columns, diff/merge backgrounds.
- **Navigation** – Telescope, NvimTree, Neo-tree, Oil, Snacks (dashboard/pickers), Bufferline, Lualine.
- **UI polish** – WhichKey, Notify, indent-blankline/Ibl, `MatchParen`, pop-up menus, split separators, cursor line, tabs.

Everything is opt-in/out through the `plugins` table, so you can disable sections you do not use.

---

## Color Palette (Default Style)

The default palette (`lua/xghost/colors/default.lua`) pairs cool neutrals with a warm accent.

### Base surfaces

| Element | Hex | Usage |
| --- | --- | --- |
| `bg` | `#1E1F26` | Main editor background |
| `bg_sidebar` | `#191A22` | Sidebars, sign columns, gutters |
| `bg_visual` | `#343849` | Visual selection / block highlight |
| `bg_pmenu_sel` | `#343652` | Completion or popup selection rows |
| `fg` | `#F4F4F8` | Primary text |
| `fg_dim` | `#9FA6C1` | Comments, guides, muted UI |
| `border` | `#2F3140` | Window separators, floating borders |

### Accent & syntax

| Color | Hex | Typical usage |
| --- | --- | --- |
| Warm accent | `#F5A97F` | Line numbers, tabs, titles |
| Blue | `#82AAFF` | Functions, call signatures |
| Cyan | `#7DCFFF` | Identifiers, special strings |
| Purple | `#C099FF` | Keywords, flow control |
| Green | `#A8E07C` | Strings, success messages |
| Yellow | `#FFE08A` | Types, annotations, warnings |
| Orange | `#F2B482` | Numbers, constants |
| Red | `#FF6B81` | Errors, deletes |
| String accent | `#9FE8C6` | Inline strings, templates |

Switch to the `warm` palette (`lua/xghost/colors/warm.lua`) for deeper backgrounds and sunset accents.

---

## Troubleshooting

1. **Was `termguicolors` enabled?** xghost turns it on automatically when Neovim supports it, but some terminal multiplexers override colors—set `set termguicolors` in early config.
2. **Highlight override not applying?** Make sure `overrides` is a plain Lua table (not a list). If you need logic, wrap it in a function that returns a table after calling `require("xghost").setup`.
3. **Sidebar looks too dark?** Set `darker_sidebar = false` or target `NvimTreeNormal`/`NeoTreeNormal` via `overrides`.
4. **Statusline plugins look off?** Keep `priority = 1000` (lazy) or `after = "xghost.nvim"` (packer) so other UI plugins see the palette before drawing.

---

## Contributing

Bug reports, palette tweaks, and new plugin integrations are welcome. Suggested workflow:

1. Fork & clone, then create a topic branch.
2. Run `stylua lua` (config in `stylua.toml`) before opening a PR.
3. Add screenshots or palette references to `doc/references/` when shipping new styles.

---

Enjoy the theme! If you build something that pairs nicely with xghost (status lines, dashboards, etc.), let us know so we can highlight it here. <sub>[back to top](#top)</sub>

## License

MIT
