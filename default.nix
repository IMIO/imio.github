with import <nixpkgs> {};
with pkgs.python27Packages;
let
  deps = import ./requirements.nix { inherit pkgs; };
in
buildPythonPackage {
  name = "imio-github";
  version = "0.1";
  src = ./.;

  doCheck = false;
  propagatedBuildInputs = builtins.attrValues deps.packages;
}
