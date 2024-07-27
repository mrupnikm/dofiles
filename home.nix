{pkgs, config, ...}: {
    home.username = "mrupnik";
    home.homeDirectory = "/home/mrupnik";
    home.stateVersion = "24.05";
    programs.home-manager.enable = true;

    # for unfree software licences(?)

    # enable zsh
    programs.zsh = {
    enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
          ll = "ls -l";
          update = "sudo nixos-rebuild switch --flake";
          lg = "lazygit";
          ld = "lazydocker";
        };
        oh-my-zsh = {
          enable = true;
          plugins = [ "git" "thefuck" "docker" "kubectl" "sudo" "starship" "zoxide"];
          theme = "robbyrussell";
        };
        history = {
          size = 10000;
          path = "${config.xdg.dataHome}/zsh/history";
        };
    };

    # zsh binaries for plugins
    programs.atuin.enable = true;
    programs.atuin.enableZshIntegration = true;
    programs.starship.enable = true;
    programs.starship.enableZshIntegration = true;
    programs.zoxide.enable = true;
    programs.zoxide.enableZshIntegration = true;
    programs.thefuck.enable = true;
    programs.thefuck.enableZshIntegration = true;

    programs.neovim.enable = true;
    xdg.configFile."nvim" = {
        source = ./lazyvim;
        recursive = true;
    };

    programs.git = {
        enable = true;
        userEmail = "matic.rupnik@x.si";
        userName = "Matic Rupnik";
    };

    programs.k9s.enable = true;

    home.packages = [
        pkgs.lazygit
        pkgs.lazydocker
        #pkgs.lens
        #pkgs.jetbrains.idea-ultimate

        #pkgs.spotify
        pkgs.freetube

        pkgs.brave
        pkgs.firefox
        pkgs.chromium

        pkgs.ollama

    ];

}