{
  description = "Reproducible learner toolchain for Practical Object Design and Browser Algorithms";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.default = pkgs.buildEnv {
        name = "course-toolchain";
        paths = [ pkgs.nodejs_22 pkgs.python312 ];
        pathsToLink = [ "/bin" ];
      };
    };
}
