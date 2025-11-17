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
    rev = "d450a92fe19b261e3e7b21593cc4c8f174bb2e14";
    hash = "sha256-SkdFpzAkd7LWhOdFjRjHX9Scec3N2O8dI3zmMnZL85A=";
  };

  cargoHash = "sha256-mh4h4pnD2itKIOmWstrA/fUBunMnOBD8Sva55k8YMgo=";

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
