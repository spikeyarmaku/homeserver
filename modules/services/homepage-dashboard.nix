{
  services.homepage-dashboard = {
    enable = true;
    # listenPort = 8082; # Default
    allowedHosts = "homepage.armaku.fyi";
  };

  services.caddy.virtualHosts."homepage.armaku.fyi".extraConfig = ''
    reverse_proxy 127.0.0.1:8082
  '';
}