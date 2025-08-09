{
  programs.fish = {
    enable = true;
    shellInit = ''
      function fish_prompt
        powerline-go -error $status -jobs (count (jobs -p)) -newline -cwd-max-depth 4
      end
    '';
    shellAliases = {
      ls = "lsd";
    };
  };
}
