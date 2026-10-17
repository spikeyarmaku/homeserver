{
  virtualisation.docker.enable = true;
  users.users.admin.extraGroups = [ "docker" ];
  environment.systemPackages = with pkgs; [
    curl
    openssl
  ];

  networking.firewall.allowedTCPPorts = [ 80 443 7881 ];
  networking.firewall.allowedUDPPorts = [ 443 7882 ];

  services.caddy.virtualHosts."chat.armaku.fyi".extraConfig = ''
    reverse_proxy 127.0.0.1:8080
  '';
}