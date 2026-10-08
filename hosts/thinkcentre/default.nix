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
#  services.jellyfin = {
#    enable = true;
#    openFirewall = false;
#  };
#
#  services.caddy = {
#    enable = true;
#
#    virtualHosts."jellyfin.armaku.fyi".extraConfig = ''
#      reverse_proxy localhost:8096
#      request_body {
#        max_size 20MB
#      }
#    '';
#  };

  # Fluxer config
  virtualisation.docker.enable = true;
  users.users.admin.extraGroups = [ "docker" ];
  environment.systemPackages = with pkgs; [
    curl
    openssl
  ];
  networking = {
    firewall.allowedTCPPorts = [ 22 80 443 7881 ];
    firewall.allowedUDPPorts = [ 443 7882 ];
  };
  services.ddns-updater = {
    enable = true;
    environment = {
      SERVER_ENABLED = "no";
      PERIOD = "1m";
      CONFIG_FILEPATH = "/etc/ddns-updater/config.json";
    };
  };
}
