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
    rev = "ba57b4481e2a3d1c99cf3c10b1770396dc9070f2";
    hash = "sha256-V9kJ9GzYCPlcQi5z5/l3o9rWz6173atJyLsg9NSwsyM=";
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
