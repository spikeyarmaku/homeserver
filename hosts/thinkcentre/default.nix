{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];
  networking.hostName = "thinkcentre";
  time.timeZone = "Europe/Budapest";
  system.stateVersion = "26.05";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Services
  services.jellyfin = {
    enable = true;
    openFirewall = false;
  };

  services.caddy = {
    enable = true;

    virtualHosts = {
      "jellyfin.armaku.fyi" = {
        extraConfig = ''
          reverse_proxy localhost:8096
          request_body {
            max_size 20MB
          }
        '';
      };

      # A fluxer instance served from docker
      "chat.armaku.fyi" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:8080
        '';
      };

      # A foundry instance
      "foundry.armaku.fyi" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:30000
        '';
      };
    };
    
  };

  # Fluxer config
  virtualisation.docker.enable = true;
  users.users.admin.extraGroups = [ "docker" ];
  environment.systemPackages = with pkgs; [
    curl
    openssl
  ];

  networking = {
    firewall.allowedTCPPorts = [
      # SSH
      22
      # Fluxer
      80 443 7881
      # Foundry
      30000
    ];
    firewall.allowedUDPPorts = [
      # Fluxer
      443 7882
    ];
  };

  # Foundry-specific permission shenanigans
  systemd.tmpfiles.rules = [
    "d /home/admin/foundry/data 0755 1000 1000 -"
  ];

  # DDNS
  services.ddns-updater = {
    enable = true;
    environment = {
      SERVER_ENABLED = "no";
      PERIOD = "1m";
      CONFIG_FILEPATH = "/etc/ddns-updater/config.json";
    };
  };
}
