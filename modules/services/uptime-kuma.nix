{
  services.uptime-kuma = {
    enable = true;
  };

  services.caddy.virtualHosts."status.armaku.fyi".extraConfig = ''
    reverse_proxy 127.0.0.1:3001
  '';
}
