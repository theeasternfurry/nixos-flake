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
    rev = "de67182e6204d3389f699cd74087208b5ed635d1";
    hash = "sha256-ztHcKRP5Wx6V98ewmOCocq6c4KcOioSv626ny+qRieI=";
  };

  cargoHash = "sha256-jeMsViWC49ms/e434wn+bTmutqpJYg/ToF6rFvnQDmg=";

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
