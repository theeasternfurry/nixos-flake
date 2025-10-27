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

  lilybloom-studio = final: prev: {
    godot = prev.godot.overrideAttrs {
      src = prev.fetchFromGitHub {
        owner = "lilybloom-studio";
        repo = "godot";
        rev = "33fba1bd7c43f0697672792f9bb10abf132dee04";
        hash = "sha256-1qyUWiK13Ghf2zxGqqCIoBtF7vFSS/Oh7Kyqheir6X0=";
        fetchSubmodules = true;
      };

      patches = [
        ./Linux-fix-missing-library-with-builtin_glslang-false.patch
      ];
    };
  };

  dell-vostro-intel-packages = final: prev: {
    cataclysm-dda-git = prev.cataclysm-dda-git.override {
      version = "2025-10-22";
      rev = "14d6570b4a3a974c957b7d3c39f33e94506284e7";
      sha256 = "sha256-hGN1x1pTyEdplDpCX4M6Dd+7XHTMaNkBFw8RYCB3eEs=";
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

  };

  amd-pc-packages = final: prev: {
    linux-firmware = prev.linux-firmware.overrideAttrs {
      installPhase = ''
        mkdir -p $out/lib/firmware/intel
        mkdir -p $out/lib/firmware/intel/iwlwifi

        cp -r amd-ucode $out/lib/firmware
        cp -r amdgpu $out/lib/firmware

        install intel/iwlwifi/iwlwifi-3168-29.ucode $out/lib/firmware/intel/iwlwifi
        ln -s $out/lib/firmware/intel/iwlwifi/iwlwifi-3168-29.ucode $out/lib/firmware/iwlwifi-3168-29.ucode

        install intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq $out/lib/firmware/intel
      '';
    };   
  };
}
