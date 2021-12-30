{ pkgs ? import <nixpkgs> { } }:

with pkgs;

let
  inherit (lib) optional optionals;

  elixir = beam.packages.erlangR24.elixir;
  postgresql = postgresql_14;
in
mkShell {
  buildInputs = [ direnv elixir postgresql nodejs yarn deno ]
    ++ optional stdenv.isLinux inotify-tools # For file_system on Linux.
    ++ optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
    CoreFoundation
    CoreServices
  ]);

  # Put the PostgreSQL databases in the project diretory.
  shellHook = ''
    export PGDATA="$PWD/db"
  '';
}
