{
  imports = [
    ./hardware-configuration.nix

    ../../modules/services/caddy.nix
    ../../modules/services/uptime-kuma.nix
  ];
  networking.hostName = "sip-minipc";
  time.timeZone = "Europe/London";
  system.stateVersion = "26.05";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
