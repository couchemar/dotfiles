let pkgs =  import <nixpkgs> {};
in
    { stdenv ? pkgs.stdenv }:

with pkgs;

stdenv.mkDerivation rec {
    name = "couchemar-panel-${version}";
    version = "0.0.4";
    src = ./.;

    preBuild = ''
      substituteInPlace panel --replace xtitle ${xtitle}/bin/xtitle
      substituteInPlace panel --replace "lemonbar -g" "${lemonbar}/bin/lemonbar -g"
      substituteInPlace panel --replace "bspc" "${bspwm}/bin/bspc"
    '';

    installPhase = ''
        mkdir -p $out/bin
        cp panel panel_bar panel_colors $out/bin
    '';
    propagatedBuildInputs = [
      lemonbar
      xtitle
      bspwm
    ];
}
