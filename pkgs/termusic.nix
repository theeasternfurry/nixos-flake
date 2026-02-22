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
  libopus,
  stdenv,
  withOpus ? true,
}:

rustPlatform.buildRustPackage {
  pname = "termusic";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "theeasternfurry";
    repo = "termusic";
    rev = "c9d0b258d48f9b8256c43ef366feca146d22062b";
    hash = "sha256-Ry/IG6o4GGviVPpWzvsoXmSGRiSKfdhHwq9Fyr8uU/o=";
  };

  cargoHash = "sha256-M+MIyvnOW/bWkH5LQT/fxbFPVs/eDA/jdhKqwGJVQQ8=";

  RUSTFLAGS = "-C target-cpu=native";

  useNextest = true;

  buildFeatures = [
    "rusty-libopus"
  ];

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
  ]
  ++ lib.optionals withOpus [
    libopus
  ];

  meta = {
    description = "Terminal Music Player TUI written in Rust";
    homepage = "https://github.com/tramhao/termusic";
    license = with lib.licenses; [ gpl3Only ];
    mainProgram = "termusic";
  };
}
