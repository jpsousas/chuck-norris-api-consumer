{ pkgs }: {
    deps = [
        (pkgs.haskellPackages.ghcWithPackages (pkgs: with pkgs; [
           http-conduit aeson wreq
        ]))       
        pkgs.haskellPackages.ghc
        pkgs.haskell-language-server
    ];
}