{
  ##################################################################################################################
  #
  # NixOS Configuration
  #
  ##################################################################################################################

  users.users.feliperese = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILAUSBSsG/TKqeh88XhqvZfIMjfomK9rZYONE0YQ7JlM felipe@github"
    ];
  };
}
