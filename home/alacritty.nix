{ unstable-pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    package = unstable-pkgs.alacritty-graphics;
    settings = {
      terminal.shell = "fish";
      window = {
        decorations = "None";
        decorations_theme_variant = "Light";
        opacity = 0.64;
      };
      font = {
        normal = {
          family = "Jetbrains Mono Nerd Font";
          style = "Regular";
        };
      };
      colors = {
        # Default colors
        primary = {
          background = "#FFF5F8"; # Màu nền hồng phấn
          foreground = "#3A1C27"; # Nâu tím đậm (rõ nét, dễ đọc)
        };

        # Cursor colors
        cursor = {
          text = "#3A1C27";
          cursor = "#D64561"; # Cursor color
        };

        # Normal colors
        normal = {
          black = "#FFEFF1"; # Base
          red = "#E9365C"; # Red - dâu đỏ rực
          green = "#78C265"; # Green - lá nổi rõ
          yellow = "#F9A825"; # Yellow - vàng ấm, dễ thấy
          blue = "#F06292"; # Pink/Blue - nơ hồng đậm
          magenta = "#AB47BC"; # Magenta - ngọt + nổi
          cyan = "#00ACC1"; # Cyan - mát mắt nhưng nổi bật
          white = "#3A1C27"; # White (text-like)
        };

        # Bright colors
        bright = {
          black = "#FAD4DC"; # Bright black (backgroundish)
          red = "#FF5E7E"; # Bright red
          green = "#8BE28A"; # Bright green
          yellow = "#FFD54F"; # Bright yellow
          blue = "#FF80AB"; # Bright pink
          magenta = "#CE93D8"; # Bright magenta
          cyan = "#4DD0E1"; # Bright cyan
          white = "#2B0E19"; # Bright white (bold text)
        };

        # Selection colors
        selection = {
          text = "CellForeground";
          background = "#F06292"; # Using the pink color for selection
        };
      };
    };
  };
}
