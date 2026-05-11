-- lua/plugins/lang.lua
-- Custom language support specs.
-- LazyVim extras are imported separately in extras.lua.
-- Node/npm avoided intentionally — using pacman-installed LSPs where possible.

return {

  -- ── Treesitter parsers ──────────────────────────────────────────────────────

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "lua",
        "python",
        "markdown",
        "markdown_inline",
        "toml",
        "yaml",
        "json",
        "jsonc", -- waybar config, tsconfig etc.
        "ini", -- systemd unit files, pacman config
      })
    end,
  },

  -- ── Mason tools ─────────────────────────────────────────────────────────────
  -- Node/npm-based tools excluded. Install via pacman instead:
  --   python-lsp-server  → pylsp (Python LSP)
  --   bash-language-server has no good non-Node alternative;
  --   shellcheck + shfmt cover linting and formatting for shell.

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "shellcheck", -- shellmason-org linting (bash + zsh)
        "shfmt", -- shell formatting
        "stylua", -- Lua formatter
        "taplo", -- TOML LSP + formatter (Rust binary, no Node)
      },
    },
  },

  -- ── LSP servers ─────────────────────────────────────────────────────────────
  -- pylsp installed via: sudo pacman -S python-lsp-server
  -- taplo installed via Mason above

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        taplo = {}, -- TOML, Mason-managed
      },
    },
  },

  -- Tell mason-lspconfig not to auto-install pylsp
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = {
        exclude = { "pylsp" },
      },
    },
  },
}
