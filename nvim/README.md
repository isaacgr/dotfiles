# Neovim Configuration

A modular Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

## Structure

```
nvim/
├── init.lua                 # Entry point, loads config module
├── lua/config/
│   ├── init.lua             # Main config loader
│   ├── set.lua              # Core Vim options
│   ├── remap.lua            # Key mappings
│   ├── lazy_init.lua        # lazy.nvim bootstrap
│   └── lazy/                # Plugin specs (auto-loaded)
```

## Core Settings (`set.lua`)

| Setting | Value |
|---------|-------|
| Leader key | `;` |
| Line numbers | Relative |
| Tab width | 4 spaces |
| Color column | 80 |
| Swap file | Disabled |
| Undo | Persistent (`~/.vim/undodir`) |
| Mouse | Disabled |
| Search highlight | Off (incremental only) |
| Scroll offset | 8 lines |
| WSL clipboard | Auto-detected |

## Key Mappings (`remap.lua`)

### Navigation & Editing
| Key | Mode | Action |
|-----|------|--------|
| `<leader>pv` | n | Open netrw |
| `J` / `K` | v | Move selection up/down |
| `<C-d>` / `<C-u>` | n | Half-page scroll (centered) |
| `n` / `N` | n | Search next/prev (centered) |
| `<C-k>` / `<C-j>` | n | Quickfix next/prev |
| `<leader>k` / `<leader>j` | n | Location list next/prev |

### Clipboard & Registers
| Key | Mode | Action |
|-----|------|--------|
| `<leader>p` | x | Paste without overwriting register |
| `<leader>y` / `<leader>Y` | n, v | Yank to system clipboard |
| `<leader>d` | n, v | Delete to black hole register |

### Search & Replace
| Key | Mode | Action |
|-----|------|--------|
| `<leader>s` | n | Search/replace word under cursor |
| `<C-g>` | n | Grep exact word (opens quickfix) |
| `<C-h>` | n | Grep partial symbol |

### Utilities
| Key | Mode | Action |
|-----|------|--------|
| `<leader>f` | n | Format buffer (conform or LSP) |
| `<leader>x` | n | Make file executable |
| `<leader>rm` | n | Remove `^M` carriage returns |
| `<leader>J` | n | Pretty print JSON |
| `<leader>ft` | n | Terminal at project root |
| `<leader>fT` | n | Terminal at current buffer |
| `<leader>sh` | n | Execute shell command |
| `<C-f>` | n | Launch tmux-sessionizer |
| `Q` | n | Disabled (Ex mode) |
| Arrow keys | n, i, v | Disabled |

## Plugins

### Color Schemes
| Plugin | Config |
|--------|--------|
| [rose-pine](https://github.com/rose-pine/neovim) | **Active** (`rose-pine-moon`), italics disabled |
| [gruvbox](https://github.com/ellisonleao/gruvbox.nvim) | No italics, terminal colors enabled |
| [tokyonight](https://github.com/folke/tokyonight.nvim) | Storm style, transparent background |
| [onedark](https://github.com/navarasu/onedark.nvim) | Darker style |
| [everforest](https://github.com/sainnhe/everforest) | Hard background |
| [arctic](https://github.com/rockyzhang24/arctic.nvim) | Default |

Transparent background applied via `ColorMyPencils()` function.

### LSP & Completion (`lsp.lua`)

**Core:**
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [mason.nvim](https://github.com/williamboman/mason.nvim) + mason-lspconfig
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + cmp-nvim-lsp
- [fidget.nvim](https://github.com/j-hui/fidget.nvim) (LSP progress UI)

**Auto-installed servers:** `lua_ls`, `gopls`, `ts_ls`, `pyright`, `clangd`, `html`, `cssls`, `tailwindcss`, `graphql`

**Server-specific settings:**

| Server | Settings |
|--------|----------|
| `lua_ls` | 2-space indent |
| `pyright` | Strict type checking, `./localvenv/bin/python` |
| `ts_ls` | 2-space tabs, source actions command |
| `clangd` | platformio.ini root detection |
| `html` | Document formatting disabled |

**Formatters (conform.nvim):**
| Filetype | Formatter | Options |
|----------|-----------|---------|
| Python | autopep8 | — |
| HTML, CSS, SCSS, JSON | prettier | 4-space tabs, 80 width |
| GraphQL | prettier | GraphQL parser |
| C, C++ | clang-format | Style from file |

**Completion keymaps:**
- `<C-p>` / `<C-n>` — Select prev/next
- `<Tab>` — Confirm selection
- `<C-Space>` — Trigger completion

### Treesitter (`treesitter.lua`)

- **Parsers:** vimdoc, javascript, typescript, c, lua, rust, jsdoc, bash, go, python, templ
- **Features:** Auto-install, indent, context (nvim-treesitter-context)
- **Disabled for:** HTML, files >100KB

### Telescope (`telescope.lua`)

| Key | Action |
|-----|--------|
| `<leader>pf` | Find files |
| `<C-p>` | Git files |
| `<leader>pws` | Grep word under cursor |
| `<leader>pWs` | Grep WORD under cursor |
| `<leader>ps` | Grep with prompt |
| `<leader>vh` | Help tags |

### Harpoon 2 (`harpoon.lua`)

| Key | Action |
|-----|--------|
| `<leader>a` | Add file to list |
| `<C-e>` | Toggle quick menu |
| `<C-h>` / `<C-t>` / `<C-n>` / `<C-s>` | Jump to file 1-4 |
| `<C-S-P>` / `<C-S-N>` | Previous/next in list |

### Git Integration

**Fugitive (`fugitive.lua`):**
| Key | Mode | Action |
|-----|------|--------|
| `<leader>gs` | n | Open Git status |
| `<leader>p` | n (fugitive buffer) | Git push |
| `<leader>P` | n (fugitive buffer) | Git pull --rebase |
| `<leader>t` | n (fugitive buffer) | Push to origin (set upstream) |
| `gu` / `gh` | n | Diffget //2 or //3 |

**Gitsigns (`gitsigns.lua`):**
| Key | Mode | Action |
|-----|------|--------|
| `]c` / `[c` | n | Next/prev hunk |
| `<leader>hs` | n, v | Stage hunk |
| `<leader>hr` | n, v | Reset hunk |
| `<leader>hS` / `<leader>hR` | n | Stage/reset buffer |
| `<leader>hp` | n | Preview hunk |
| `<leader>hb` | n | Blame line |
| `<leader>hd` / `<leader>hD` | n | Diff index / last commit |
| `<leader>tb` | n | Toggle line blame |

**LazyGit (`lazygit.lua`):**
- `<leader>gg` — Open LazyGit

### Diagnostics

**Trouble (`trouble.lua`):**
| Key | Action |
|-----|--------|
| `<leader>tt` | Toggle diagnostics |
| `<leader>[t` | Next diagnostic |
| `<leader>[T` | Previous diagnostic |

**Undotree (`undotree.lua`):**
- `<leader>u` — Toggle undotree

### UI Plugins

| Plugin | Description |
|--------|-------------|
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | Dashboard with tree ASCII art |
| [lualine](https://github.com/nvim-lualine/lualine.nvim) | Statusline (mode, branch, diff, diagnostics, LSP progress) |
| [bufferline](https://github.com/akinsho/bufferline.nvim) | Buffer tabs (slant style), active window dimming |
| [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides (scope disabled) |
| [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua) | Color highlighting in code |

### Snippets

- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) v2 with [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

### Editing Utilities

| Plugin | Description |
|--------|-------------|
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets |
| [splitjoin.vim](https://github.com/AndrewRadev/splitjoin.vim) | Split/join code blocks (`gS`/`gJ`) |

**Splitjoin config:** Python brackets on separate lines, trailing commas enabled.

### Markdown

| Plugin | Description |
|--------|-------------|
| [markdown-toc.nvim](https://github.com/hedyhli/markdown-toc.nvim) | Generate TOC (`:Mtoc`) |
| [peek.nvim](https://github.com/toppair/peek.nvim) | Markdown preview (`:PeekOpen`/`:PeekClose`) — requires Deno |

### Embedded Development

- [nvim-platformio.lua](https://github.com/anurag3301/nvim-platformio.lua) — PlatformIO integration

## Inspecting Keymaps

| Command | Shows |
|---------|-------|
| `:map` | All mappings (normal, visual, operator) |
| `:nmap` | Normal mode only |
| `:imap` | Insert mode only |
| `:vmap` | Visual mode only |
| `:map <leader>` | All leader mappings |
| `:Telescope keymaps` | Searchable list of all keymaps |
| `:verbose nmap <key>` | Where a specific mapping was defined |

## Installation

1. Clone to your Neovim config directory:
   ```bash
   git clone <repo> ~/.config/nvim
   ```

2. Start Neovim — lazy.nvim will bootstrap and install plugins automatically.

3. Run `:Mason` to verify LSP servers are installed.
