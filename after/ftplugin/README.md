# Neovim Filetype Settings (`after/ftplugin/`)

- This directory contains Lua configuration files loaded by NeoVim After the
  default plugins have been loaded.

## Purpose

- To set buffer-local options (like indentation rules) on a per-language basis,
  overriding NeoVim defaults. This controls how Neovim behaves **while you are
  editing** (e.g., pressing Enter or Tab).

## How it Works

1. Neovim detects the filetype (e.g., `lua`, `php`, `typescript`).
2. It looks for a matching `.php` file here (e.g., `php.lua`).
3. If found, it runs the Lua code, applying settings (using `vim.opt_local`) to
   the current buffer only.

## Important Distinction

- These settings configure Neovim's **internal indentation behavior**. They are
  separate from **external formatters** (like those used by `conform.nvim`,
  e.g., `stylua`, `prettier`). External formatters reformat the _entire file_
  based on their own rules (often configured via `conform.nvim`'s `formatters`
  table or files like `.prettierrc`). For consistency, ensure your `ftplugin`
  settings match your external formatter's configuration.

## Usage

- Settings are applied automatically when opening a matching file. No action needed.

## Extending

- **Finding the Filetype Name:** Before creating a file, open a file of the
  target language in Neovim and run `:set filetype?`. The output (e.g.,
  `filetype=python`) gives you the exact name to use for your `.lua` file
  (e.g., `python.lua`). Alternatively, use `:lua print(vim.bo.filetype)`.

1. **Add a new language (e.g., Python):**

   - Create `after/ftplugin/python.lua`.
   - Add buffer-local settings inside, e.g.:

     ```lua
     vim.opt_local.shiftwidth = 4
     vim.opt_local.tabstop = 4
     vim.opt_local.expandtab = true
     -- etc.
     ```

2. **Modify existing settings:**
   - Edit the relevant file (e.g., `typescript.lua`).
   - Change or add `vim.opt_local` settings as needed.

---
