{
  description = "Nix-shell for a minecraft server";
  
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in 
    {
      devShells.x86_64-linux.default = pkgs.mkShell {
        name = "Minecraft server 󰍳 ";

        nativeBuildInputs = with pkgs; [
          jdk8
        ];

        # the start.nix file should contain the shell hook to start your minecraft server
        shellHook = import ./start.nix + ''
          exit
        '';
      };
    };
}
