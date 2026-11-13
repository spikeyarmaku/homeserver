{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/services/caddy.nix
    ../../modules/services/ddns-updater.nix
    ../../modules/services/fluxer.nix
    ../../modules/services/foundry.nix
    ../../modules/services/homepage-dashboard.nix
    ../../modules/services/jellyfin.nix
  ];

  networking.hostName = "thinkcentre";
  time.timeZone = "Europe/Budapest";
  system.stateVersion = "26.05";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Disable NIC offloading
  systemd.services.disable-nic-offloading = {
    description = "Disable NIC offloading";
  
    serviceConfig = {
      Type = "oneshot";
      User = "root";
      ExecStart = "${pkgs.ethtool}/bin/ethtool -K eno2 gso off gro off tso off tx off rx off rxvlan off txvlan off";
    };
  
    # https://systemd.io/NETWORK_ONLINE/
    wantedBy = [ "network-pre.target" ];
  };
}
