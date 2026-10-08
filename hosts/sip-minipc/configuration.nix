{
  imports = [
    ./hardware-configuration.nix
    ../../common.nix
  ];
  networking.hostName = "sip-minipc";
  time.timeZone = "Europe/London";
  system.stateVersion = "26.05";

  # Services
  services.jellyfin = {
    enable = true;
    openFirewall = false;
  };

  services.caddy = {
    enable = true;

    virtualHosts."jellyfin.armaku.fyi".extraConfig = ''
      reverse_proxy localhost:8096
      request_body {
        max_size 20MB
      }
    '';
  };
}
