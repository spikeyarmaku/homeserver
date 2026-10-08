{ hostname, ... }:
{
  networking.hostName = hostname;
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
#    allowedTCPPortRanges = [
#      { from = 1714; to = 1716; } # KDE Connect
#    ];
#    allowedUDPPortRanges = [
#      { from = 1714; to = 1716; } # KDE Connect
#    ];
     allowedTCPPorts = [ 22 80 443 ];
#    allowedUDPPorts = [15000];
  };
}
