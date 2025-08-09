{
  programs.fish = {
    enable = true;
    shellInit = ''
      function fish_prompt
        set -l prompt (powerline-go -error $status -jobs (count (jobs -p)) -cwd-max-depth 4)
        printf "%s\n" $prompt
      end

      function yazi_fm
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
      end

      # Launch Yazi in interactive sessions
      if status is-interactive
        yazi_fm
      end
    '';
    shellAliases = {
      ls = "lsd";
    };
  };
}
