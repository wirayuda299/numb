# numb.nvim (Minimal Replacement)

A minimal Neovim plugin that previews the target line when using `:number` commands, inspired by [nacro90/numb.nvim](https://github.com/nacro90/numb.nvim).

## Features
- Highlights the line you would jump to with `:number` (e.g., `:42`) for a brief moment.
- Lightweight, pure Lua, no dependencies.

## Installation

**With [lazy.nvim](https://github.com/folke/lazy.nvim):**
```lua
{
  dir = '~/path/to/numb',
  config = function()
    require('numb').setup()
  end,
}
```

**With [packer.nvim](https://github.com/wbthomason/packer.nvim):**
```lua
use({ '~/path/to/numb' })
require('numb').setup()
```

## Configuration

You can customize the highlight group and duration:
```lua
require('numb').setup({
  hl_group = 'Visual', -- Highlight group to use
  duration = 300,      -- Duration in milliseconds
})
```

## Usage
Just type `:number` (e.g., `:42`) in normal mode. The plugin will highlight the target line briefly.

---
MIT License 