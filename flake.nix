{
  description = ''A jsony plugin to enable union support'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."github-tandy-1000-uniony-master".dir   = "master";
  inputs."github-tandy-1000-uniony-master".owner = "nim-nix-pkgs";
  inputs."github-tandy-1000-uniony-master".ref   = "master";
  inputs."github-tandy-1000-uniony-master".repo  = "github-tandy-1000-uniony";
  inputs."github-tandy-1000-uniony-master".type  = "github";
  inputs."github-tandy-1000-uniony-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."github-tandy-1000-uniony-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}