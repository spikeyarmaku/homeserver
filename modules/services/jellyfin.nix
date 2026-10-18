{
  services.jellyfin = {
    enable = true;
    openFirewall = false;
  };

  services.caddy.virtualHosts."jellyfin.armaku.fyi".extraConfig = ''
    reverse_proxy 127.0.0.1:8096
    request_body {
    max_size 20MB
    }
  '';
}
