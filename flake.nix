{
  description = "<% name.capitalize() %> distroless image using nix2container";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix2container.url = "github:nlewo/nix2container";
    base.url = "github:podmania/base";
  };

  outputs = { self, nixpkgs, nix2container, base }: let
    system = builtins.currentSystem;
    pkgs = nixpkgs.legacyPackages.${system};
    n2c = nix2container.outputs.packages.${system}.nix2container;
  in {
    packages.${system} = {
      <% name %>-image = n2c.buildImage {
        name = "<% name %>";
        tag = "latest";
        fromImage = base.packages.${system}.base-image;
        copyToRoot = [ pkgs.<% name %> ];
        config = {
          ExposedPorts = {
            "1234/tcp" = {};
          };
          Volumes = {
            "/config" = {};
            "/data" = {};
          };
          Cmd = [ "${pkgs.<% name %>}/bin/<% name %>" ];
        };
      };

      default = self.packages.${system}.<% name %>-image;
    };

    <% name %>Version = pkgs.<% name %>.version;
  };
}
