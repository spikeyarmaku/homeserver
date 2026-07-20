{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Host-specific settings
  networking.hostName = "sip-minipc";
  time.timeZone = "Europe/London";
  system.stateVersion = "26.05";
  
  # Nixos-config
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = [ "dorg" ];

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking = {
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ 22 80 443 ];
  };

  # Users
  security.sudo.wheelNeedsPassword = false;

  users.users.dorg = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # SSH
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  users.users.dorg.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKj6w6wXEkphs7eJ28xpW23J4fYvHHBwDKybXGS6B7Ox armaku"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD40pzPvW7iQoYtEug8187xeH1L+/2pI9Hu4ptR7iC6wbtOAI/BkI9lB3xE7vIeoyYLQie4L1SfL5BS78Q78P6YyKzt9LNr8eC5y3kSnfghxOmkvmS9KziQ8RJd77Qht5W7Mz0fD4PLV/Bz5Kg/2Sg8fgVUAvwmrzE6F3RE/9jrSANv2pYJo2WXn2REjnNuH/kglf0pl565ZzOM9dKm6V8trqzlV7apl8Gg/YXnajH34FIrlH4ZKPk48cFtMhq6lPEy5H173yz1vJva15KMqeGmQVCmuAKUwLFyA8qxGmReJknA47oFIyomVDidSpncFmm6IWCCbwVUogebIi4m8UFgqBcyVHHyNdAZAM7sGLq9tznB+0M/4ZmrR6VcWJOCF9WXwqcYZ8sDUuORc9RbrI88qK7yRHvsHpVi8o19/6Lxx0irVh7q4jwr/1SOwz2L1uxudOTRYr+FdUuJikv5ElcM7CBHpkhCs/KOU98fAvWJzGhPkspYyy0A+QKMJY5OPDE= buci@Buci-Home"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJ+i0qGL326eTGJOGl4c9Tj95IDyFinW6fODOR3zMHdd45blCn/6ID7ytZMNJVgZGgKyDE+adeBxZxxV6xUHGpzWMou5VWb9SmpG/QEh7+fIhyamqgHLOdo3GfB8L7M5luqZ0bk/2gQUDQFuAyorwP7F/Mj8+yIlFbr/T6EWyLv68U3L3//gmNStRa1OGi5jXJJu6RRKWLbr49jYNHVeYSjH8oru+DwXBlkAWAYuq5cvZRj+l+avA/ml5rw3c+kTkq4ZajI5TZXNyGXnm5lXaylKJsBNzqlh9X9fldJOH7zggyL+PupeWLmMbaVr8PSlm3etmcqVHCAJ3lAsYFyeOX gabriel butcher@SIPCarParks2-PC"
  ];

  # Services
  services.jellyfin = {
    enable = true;
    openFirewall = false;
  };

  services.caddy = {
    enable = true;

    virtualHosts."jellyfin.orbanviktor.gay".extraConfig = ''
      reverse_proxy localhost:8096
      request_body {
        max_size 20MB
      }
    '';
  };
}

