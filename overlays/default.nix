{
  custom-packages = final: prev: {
    #fcitx5-unikey = prev.kdePackages.fcitx5-unikey.overrideAttrs {
    #  src = prev.fetchFromGitHub {
    #    owner = "theeasternfurry";
    #    repo = "fcitx5-unikey";
    #    rev = "e5662d38785c904064de46330c0c6d73afbda7d0";
    #    hash = "sha256-Yeyk6c4bjsxTi8DvRBGip/gayKaOvO6R5PGYkc0uUdk=";
    #  };
    #};

    yt-dlp = prev.yt-dlp.overrideAttrs {
      version = "2026-01-29";

      src = prev.fetchFromGitHub {
        owner = "yt-dlp";
        repo = "yt-dlp";
        rev = "637ae202aca7a990b3b61bc33d692870dc16c3ad";
        hash = "sha256-WT+Lwffp/rYqD0BBK8Vr/1bBxNEB6waEVTLVMhxxuF0=";
      };

      postPatch = "";
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
        mkdir -p $out/lib/firmware
      
        cp -r amd-ucode $out/lib/firmware

        mkdir -p $out/lib/firmware/amdgpu
        cp amdgpu/navy_flounder* $out/lib/firmware/amdgpu/

        mkdir -p $out/lib/firmware/intel
        mkdir -p $out/lib/firmware/intel/iwlwifi
        install intel/iwlwifi/iwlwifi-3168-29.ucode $out/lib/firmware/intel/iwlwifi
        ln -s $out/lib/firmware/intel/iwlwifi/iwlwifi-3168-29.ucode $out/lib/firmware/iwlwifi-3168-29.ucode

        install intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq $out/lib/firmware/intel

        mkdir -p $out/lib/firmware/rtl_nic
        install rtl_nic/rtl8168h-2.fw $out/lib/firmware/rtl_nic/
      '';
    };
  };
}
