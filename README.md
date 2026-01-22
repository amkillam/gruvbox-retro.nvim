# gruvbox-retro.nvim

A high-contrast, "Hard Dark" implementation of the classic Gruvbox palette.

## Features
- **Retro Feel:** Deep "dark-mode" background with the iconic warm earth tones.
- **Improved Hierarchy:** Specifically mapped for Treesitter to provide better visual distinction than standard retro ports.
- **Clean UI:** Muted split borders and status lines for a focused coding environment.

## Installation 

### (Lazy.nvim)
```lua
{
    "amkillam/gruvbox-retro.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        vim.cmd.colorscheme("gruvbox-retro")
    end
}
