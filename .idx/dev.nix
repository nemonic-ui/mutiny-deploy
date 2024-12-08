
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"

  services.docker.enable = true;
  

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.docker-compose 
    # pkgs.systemd # Only needed if interacting with systemd directly
    # pkgs.sudo    # Only needed if requiring root privileges within the workspace
    # pkgs.apt      # Generally not needed in IDX, package management is handled by Nix
    pkgs.nginx
    pkgs.python3
    pkgs.python311Packages.flask
    pkgs.docker 
    pkgs.nodejs_20 
    pkgs.vite
  ];
  
  
  # Enable web previews and specify the command
  idx.previews = {
    enable = true;
    previews = {
      web = {
        command = [ "docker" "run" "-d" "-p" "14499:80" "ghcr.io/mutinywallet/mutiny-web:latest" ]; # Assuming you're using npm for your Vite project
        manager = "web"; 
      };
    };
  };
}