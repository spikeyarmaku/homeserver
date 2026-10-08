{ pkgs, ...}:
{
  users.users.admin = {
    isNormalUser = true;
    description = "admin";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  security.sudo.wheelNeedsPassword = false;
}
