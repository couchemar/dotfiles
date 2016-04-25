let pkgs =  import <nixpkgs> {};
in
    { stdenv ? pkgs.stdenv }:

stdenv.mkDerivation rec {
    name = "couchemar-panel-${version}";
    version = "0.0.3";
    src = ./.;

    preBuild = ''
      substituteInPlace panel --replace xtitle ${pkgs.xtitle}/bin/xtitle
      substituteInPlace panel --replace "lemonbar -g" "${pkgs.bar}/bin/lemonbar -g"
    '';

    installPhase = ''
        mkdir -p $out/bin
        cp panel panel_bar panel_colors $out/bin
    '';
    propagatedBuildInputs = [
      pkgs.bar
      pkgs.xtitle
    ];
}
