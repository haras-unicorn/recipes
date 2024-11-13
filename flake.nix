{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { flake-utils, nixpkgs, ... }:
    flake-utils.lib.eachDefaultSystem (system: {
      devShells.default =
        let
          pkgs = import nixpkgs { inherit system; };
        in
        pkgs.mkShell {
          packages = with pkgs; [
            # nix
            nil
            nixpkgs-fmt

            # scripts
            just
            nushell
            fzf

            # misc
            nodePackages.prettier
            nodePackages.yaml-language-server
            nodePackages.vscode-json-languageserver
            marksman
            taplo

            # tools
            mdbook
          ];
        };
    });
}
