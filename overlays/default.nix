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

  dell-vostro-intel-packages = final: prev: {
    cataclysm-dda-git = prev.cataclysm-dda-git.override {
      version = "2025-09-19";
      rev = "5fd4a4066ca0ee2183977cb7dccbc9b7e5b7c7e3";
      sha256 = "sha256-OOeXsklsmT0nMC32tKXLJNYzUYAQg/8ixCcZly7QT1A=";
    };
    
    linux-firmware = prev.linux-firmware.overrideAttrs {
      installPhase = ''
        mkdir -p $out/lib/firmware/intel
        mkdir -p $out/lib/firmware/intel/iwlwifi
        mkdir -p $out/lib/firmware/i915
        mkdir -p $out/lib/firmware/rtl_nic

        # Wifi firmware
        install intel/iwlwifi/iwlwifi-QuZ-a0-jf-b0-77.ucode $out/lib/firmware/intel/iwlwifi
        ln -s $out/lib/firmware/intel/iwlwifi/iwlwifi-QuZ-a0-jf-b0-77.ucode $out/lib/firmware/iwlwifi-QuZ-a0-jf-b0-77.ucode

        # Card
        install i915/tgl_dmc_ver2_12.bin $out/lib/firmware/i915

        # Bluetooth
        install intel/ibt-19-0-0.sfi $out/lib/firmware/intel
        install intel/ibt-19-0-0.ddc $out/lib/firmware/intel

        # Realtek sd card reader
        install rtl_nic/rtl8168h-2.fw $out/lib/firmware/rtl_nic
      '';
    };

    /*
    openrgb = prev.openrgb.overrideAttrs {
      version = "unstable-git";
      src = prev.fetchFromGitLab {
        owner = "theeasternfurry";
        repo = "OpenRGB";
        rev = "0a6930945ef4f7c75fe61207b9bb665ad89c6a46";
        hash = "sha256-w0fJIcZ2MdcvRsG4nszkUL5ANjI5Da/L0BgK5Mpn50I=";
      };

      postPatch = '''';
    };
    openrgb-plugin-effects = prev.openrgb-plugin-effects.overrideAttrs {
      version = "unstable-git";
      src = prev.fetchFromGitLab {
        owner = "OpenRGBDevelopers";
        repo = "OpenRGBEffectsPlugin";
        rev = "6cf3f445b050941d9dc17d1ab66575daa4360885";
        hash = "sha256-Dd3t8ABspxyDGzRKBl0ZX3jFFQqEm5VAfAZSqksm4eU=";
        fetchSubmodules = true;
      };
      postPatch = '''';

      buildInputs = [
        prev.libsForQt5.qt5.qtbase
        prev.glib
        prev.openal
        prev.pipewire.dev
      ];
    };
    openrgb-plugin-hardwaresync = prev.openrgb-plugin-hardwaresync.overrideAttrs {
      version = "unstable-git";
      src = prev.fetchFromGitLab {
        owner = "OpenRGBDevelopers";
        repo = "OpenRGBHardwareSyncPlugin";
        rev = "a7c2830f4c100ec900b653e4b99f5cde7becd787";
        hash = "sha256-mcKKn/MaIQe2R8FZbzwr0F/So7PY4kf8TgkwMt2K1K4=";
        fetchSubmodules = true;
      };
      postPatch = '''';
    };
    */
  };

  amd-pc-packages = final: prev: {
    linux-firmware = prev.linux-firmware.overrideAttrs {
      installPhase = ''
        mkdir -p $out/lib/firmware/intel

        cp -r amd-ucode $out/lib/firmware
        cp -r amdgpu $out/lib/firmware
        install iwlwifi-3168-29.ucode $out/lib/firmware
        install intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq $out/lib/firmware/intel
      '';
    };   
  };
}
