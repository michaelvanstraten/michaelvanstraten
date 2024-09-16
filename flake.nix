{
  description = "A Typst project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    typst.url = "github:typst/typst";
    typst-packages = {
      url = "github:typst/packages";
      flake = false;
    };

    typix.url = "github:loqusion/typix";

    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      typix,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };

        typixLib = typix.lib.${system};

        src = typixLib.cleanTypstSource ./.;
        commonArgs = {
          typstSource = "resume.typ";

          fontPaths = [
            "${pkgs.roboto}/share/fonts/truetype"
            "${pkgs.source-sans}/share/fonts/opentype"
            "${pkgs.font-awesome}/share/fonts/opentype"
          ];
        };

        mkTypstDerivation = typixLib.mkTypstDerivation.override {
          typst = inputs.typst.packages.${system}.default;
        };

        buildTypstProject = typixLib.buildTypstProject.override { inherit mkTypstDerivation; };

        # Compile a Typst project, *without* copying the result
        # to the current directory
        build-drv = buildTypstProject (
          commonArgs
          // {
            inherit src;

            TYPST_PACKAGE_PATH = "${inputs.typst-packages}/packages";
          }
        );

        # Compile a Typst project, and then copy the result
        # to the current directory
        build-script = typixLib.buildTypstProjectLocal.override { inherit buildTypstProject; } (
          commonArgs
          // {
            inherit src;

            TYPST_PACKAGE_PATH = "${inputs.typst-packages}/packages";
          }
        );

        # Watch a project and recompile on changes
        watch-script = typixLib.watchTypstProject commonArgs;
      in
      {
        checks = {
          inherit build-drv build-script watch-script;
          pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              # Check and fix nix files formatting
              nixfmt-rfc-style.enable = true;
              # Check and fix typst files formatting
              typstfmt.enable = true;
              prettier = {
                enable = true;
                settings = {
                  prose-wrap = "always";
                };
              };
            };
          };
        };

        packages.default = build-drv;

        apps = rec {
          default = watch;
          build = flake-utils.lib.mkApp { drv = build-script; };
          watch = flake-utils.lib.mkApp { drv = watch-script; };
        };

        devShells.default = typixLib.devShell {
          inherit (commonArgs) fontPaths virtualPaths;
          inherit (self.checks.${system}.pre-commit-check) shellHook;
          buildInputs = self.checks.${system}.pre-commit-check.enabledPackages;
          packages = [
            watch-script
            pkgs.typst-lsp
          ];
        };
      }
    );
}
