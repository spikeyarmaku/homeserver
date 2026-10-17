{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/services/caddy.nix
    ../../modules/services/ddns-updater.nix
    ../../modules/services/fluxer.nix
    ../../modules/services/foundry.nix
    ../../modules/services/jellyfin.nix
    ../../modules/services/uptime-kuma.nix
  ];

  networking.hostName = "thinkcentre";
  time.timeZone = "Europe/Budapest";
  system.stateVersion = "26.05";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
