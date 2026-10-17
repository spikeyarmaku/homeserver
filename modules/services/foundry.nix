{
  networking.firewall.allowedUDPPorts = [ 30000 ];

  systemd.tmpfiles.rules = [
    "d /home/admin/foundry/data 0755 1000 1000 -"
  ];

  services.caddy.virtualHosts."foundry.armaku.fyi".extraConfig = ''
    reverse_proxy 127.0.0.1:30000
  '';
}