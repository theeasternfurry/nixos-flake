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
    owner = "tramhao";
    repo = "termusic";
    rev = "46bb70558af7b7de8ac218b7cc351665f9e677d9";
    hash = "sha256-y3Or+3y9DZRdbvfuprDAN+BMSqw1E5jfCxRTY0RHFVk=";
  };

  cargoHash = "sha256-o9Y+PZsHJuY5MzUj80DbNUi0yTIYXv7caw/X0hIqTWc=";

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
