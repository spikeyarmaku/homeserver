{
  services.caddy = {
    enable = true;
  };

  networking.firewall.allowedTCPPorts = [ 22 80 443 ];
}