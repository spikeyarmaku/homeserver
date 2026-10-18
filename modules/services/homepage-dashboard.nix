{
  services.homepage-dashboard = {
    enable = true;
    # listenPort = 8082; # Default
    allowedHosts = "homepage.armaku.fyi";
    settings = {
      title = "Homeserver";
      theme = "dark";
      headerStyle = "boxedWidgets";
    };
    widgets = [
      {
        resources = {
          label = "thinkcentre";
          cpu = true;
          memory = true;
          disk = "/";
          uptime = true;
        };
      }
    ];
    services = [
      {
        "Services" = [
          {
            "Uptime Kuma" = {
              icon = "sh-uptime-kuma";
              description = "Monitoring for the homeserver";
              href = "https://status.armaku.fyi";
              widgets = [
                {
                  type = "uptimekuma";
                  url = "https://status.armaku.fyi";
                  slug = "homeserver";
                  fields = [ "up" "down" "uptime" ];
                }
              ];
            };
          }
          {
            "Fluxer" = {
              icon = "sh-fluxer";
              description = "Discord-like chat";
              href = "https://chat.armaku.fyi";
            };
          }
          {
            "Foundry" = {
              icon = "sh-foundry-virtual-tabletop";
              description = "Virtual tabletop for roleplay";
              href = "https://foundry.armaku.fyi";
            };
          }
          {
            "Jellyfin" = {
              icon = "sh-jellyfin";
              description = "Media server";
              href = "https://jellyfin.armaku.fyi";
            };
          }
        ];
      }
    ];
  };

  services.caddy.virtualHosts."homepage.armaku.fyi".extraConfig = ''
    reverse_proxy 127.0.0.1:8082
  '';
}