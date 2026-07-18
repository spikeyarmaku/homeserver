# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.alice = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     tree
  #   ];
  # };

  # programs.firefox.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

  security.sudo.wheelNeedsPassword = false;

  users.users.dorg = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKj6w6wXEkphs7eJ28xpW23J4fYvHHBwDKybXGS6B7Ox armaku"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD40pzPvW7iQoYtEug8187xeH1L+/2pI9Hu4ptR7iC6wbtOAI/BkI9lB3xE7vIeoyYLQie4L1SfL5BS78Q78P6YyKzt9LNr8eC5y3kSnfghxOmkvmS9KziQ8RJd77Qht5W7Mz0fD4PLV/Bz5Kg/2Sg8fgVUAvwmrzE6F3RE/9jrSANv2pYJo2WXn2REjnNuH/kglf0pl565ZzOM9dKm6V8trqzlV7apl8Gg/YXnajH34FIrlH4ZKPk48cFtMhq6lPEy5H173yz1vJva15KMqeGmQVCmuAKUwLFyA8qxGmReJknA47oFIyomVDidSpncFmm6IWCCbwVUogebIi4m8UFgqBcyVHHyNdAZAM7sGLq9tznB+0M/4ZmrR6VcWJOCF9WXwqcYZ8sDUuORc9RbrI88qK7yRHvsHpVi8o19/6Lxx0irVh7q4jwr/1SOwz2L1uxudOTRYr+FdUuJikv5ElcM7CBHpkhCs/KOU98fAvWJzGhPkspYyy0A+QKMJY5OPDE= buci@Buci-Home"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJ+i0qGL326eTGJOGl4c9Tj95IDyFinW6fODOR3zMHdd45blCn/6ID7ytZMNJVgZGgKyDE+adeBxZxxV6xUHGpzWMou5VWb9SmpG/QEh7+fIhyamqgHLOdo3GfB8L7M5luqZ0bk/2gQUDQFuAyorwP7F/Mj8+yIlFbr/T6EWyLv68U3L3//gmNStRa1OGi5jXJJu6RRKWLbr49jYNHVeYSjH8oru+DwXBlkAWAYuq5cvZRj+l+avA/ml5rw3c+kTkq4ZajI5TZXNyGXnm5lXaylKJsBNzqlh9X9fldJOH7zggyL+PupeWLmMbaVr8PSlm3etmcqVHCAJ3lAsYFyeOX gabriel butcher@SIPCarParks2-PC"
    ];
  };

  # Don't ask passwd for root user
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  # Allow SSH
  networking.firewall.allowedTCPPorts = [ 22 80 443 ];

  # Generic settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = [ "dorg" ];

  # Homeserver config ------------------------------
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

