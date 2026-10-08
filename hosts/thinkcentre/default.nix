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
}
