{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaConfig = ''
      ${builtins.readFile ../dotfiles/nvim/settings.lua}
      ${builtins.readFile ../dotfiles/nvim/keymap.lua}

      ${builtins.readFile ../dotfiles/nvim/plugins/telescope-nvim.lua}
      ${builtins.readFile ../dotfiles/nvim/plugins/autotag.lua}
      ${builtins.readFile ../dotfiles/nvim/plugins/bufferline.lua}
      ${builtins.readFile ../dotfiles/nvim/plugins/catppuccin.lua}
      ${builtins.readFile ../dotfiles/nvim/plugins/fzf-lua.lua}
      ${builtins.readFile ../dotfiles/nvim/plugins/gitsigns.lua}
      ${builtins.readFile ../dotfiles/nvim/plugins/lualine.lua}
      ${builtins.readFile ../dotfiles/nvim/plugins/nvim-cmp.lua}
      ${builtins.readFile ../dotfiles/nvim/plugins/nvim-lspconfig.lua}
      ${builtins.readFile ../dotfiles/nvim/plugins/nvim-tree.lua}
      ${builtins.readFile ../dotfiles/nvim/plugins/presence-nvim.lua}
    '';
    plugins = with pkgs.vimPlugins; [
      # plugins written in VimScript 
      vim-nix

      # Colorscheme
      cyberdream-nvim
      catppuccin-nvim
      monokai-pro-nvim

      # plugins written in Lua
      bufferline-nvim
      nvim-cmp          # Auto completion
      cmp-buffer        # Auto completion for buffer
      cmp-nvim-lsp      # Auto completion language server
      cmp-path          # Auto completion project path
      cmp_luasnip       # Luasnip for auto completion
      fzf-lua           # Fzf
      gitsigns-nvim     # Tracking git file status
      luasnip           # Snippet for auto completion when choosing
      nvim-lspconfig    # Language server
      nvim-tree-lua     # File manager
      nvim-treesitter
      nvim-ufo          # Neovim fold
      nvim-web-devicons # Icons

      lualine-nvim    # Status line
      nvim-ts-autotag # Closing tags html

      telescope-nvim # Finder, Filter
      presence-nvim  # Discord display neovim status
    ];
  };

  xdg.configFile = {
    "nvim" = {
      source = ../dotfiles/nvim;
      recursive = true;
    };
  };
}
