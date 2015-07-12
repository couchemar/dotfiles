let pkgs =  import <nixpkgs> {};
in
    { stdenv ? pkgs.stdenv }:

stdenv.mkDerivation rec {
    name = "couchemar-panel-${version}";
    version = "0.0.1";
    src = ./.;

    installPhase = ''
        mkdir -p $out/bin
        cp panel panel_bar panel_colors $out/bin
    '';
}
