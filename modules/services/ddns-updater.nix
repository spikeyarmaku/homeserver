{
  services.ddns-updater = {
    enable = true;
    environment = {
      SERVER_ENABLED = "no";
      PERIOD = "1m";
      CONFIG_FILEPATH = "/etc/ddns-updater/config.json";
    };
  };
}