{
  nix.settings.experimental-features = [ "nix-command" "flakes" "pipe-operators" ];
  nix.settings.trusted-users = [ "admin" ];
}
