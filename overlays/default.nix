{
  custom-packages = final: prev: {
    fcitx5 = prev.fcitx5.overrideAttrs {
      src = prev.fetchFromGitHub {
        owner = "fcitx";
        repo = "fcitx5";
        rev = "eb502fc89eadf1e955fd2e2c648a646ce930467a";
        hash = "sha256-zbyvfYaFFI6U+uJ7sfEU/s0zsZEx022mErXSo23NqA8=";
      };
    };

    # Use the KDE version of fcitx5-unikey which uses Qt6
    fcitx5-unikey = prev.kdePackages.fcitx5-unikey.overrideAttrs {
      src = prev.fetchFromGitHub {
        owner = "theeasternfurry";
        repo = "fcitx5-unikey";
        rev = "a7588c9cb69363306ebb92e558db40066de05a9d";
        hash = "sha256-V0KURczCX3dh6/4C1GF21eXXdFmWUUdIUQegbT7FFK4=";
      };
    };
  };
}
