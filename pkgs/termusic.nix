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
    owner = "hasezoey";
    repo = "termusic";
    rev = "bf0f0efdd134892dcabdf0191e67a49d16b956ca";
    hash = "sha256-iWVPDx32x4B3P1zEnaEkZnkymI8kcz58nvLJdNh1/Lo=";
  };

  cargoHash = "sha256-VMbgM86dGskl/cZA7QJNQFAzrw1vbWQNusMoYcqaCN0=";

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
