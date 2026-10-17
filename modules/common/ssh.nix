{
  users.users.admin.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKj6w6wXEkphs7eJ28xpW23J4fYvHHBwDKybXGS6B7Ox armaku"
  ];

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  networking.firewall.allowedTCPPorts = [ 22 ];
}
