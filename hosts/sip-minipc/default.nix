{
  imports = [
    ./hardware-configuration.nix

    ./modules/services/caddy.nix
    ./modules/services/jellyfin.nix
  ];
  networking.hostName = "sip-minipc";
  time.timeZone = "Europe/London";
  system.stateVersion = "26.05";
}
