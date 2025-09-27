{
  alsa-lib,
  dbus,
  fetchFromGitHub,
  glib,
  gst_all_1,
  lib,
  mpv-unwrapped,
  openssl,
  pkg-config,
  protobuf,
  rustPlatform,
  sqlite,
  stdenv,
}:

rustPlatform.buildRustPackage rec {
  pname = "termusic";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "tramhao";
    repo = "termusic";
    rev = "20b5324f271b47da9aef833896a53f78909574e9";
    hash = "sha256-TOXYUb1semeqQOMLWA1l46O3fgSmInC01Xdx4lY3cMo=";
  };

  cargoHash = "sha256-BwFDh4F7JObJGRPzj3nhkxIk/o0fnkXAyku6ddWGLkk=";

  useNextest = true;

  nativeBuildInputs = [
    pkg-config
    protobuf
    rustPlatform.bindgenHook
  ];

  buildInputs = [
    dbus
    glib
    gst_all_1.gstreamer
    mpv-unwrapped
    openssl
    sqlite
  ]
  ++ lib.optionals stdenv.hostPlatform.isLinux [
    alsa-lib
  ];

  meta = {
    description = "Terminal Music Player TUI written in Rust";
    homepage = "https://github.com/tramhao/termusic";
    license = with lib.licenses; [ gpl3Only ];
    mainProgram = "termusic";
  };
}
