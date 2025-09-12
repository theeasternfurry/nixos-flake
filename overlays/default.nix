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
      version = "2025-09-12";
      rev = "d32ffbc1305bdf727b431177fc64aea4bcb944f5";
      sha256 = "sha256-4rGHWqdJnTi7UMdlSXHl0mc9pMNG/vM3wWafi/h+eM8=";
    };
    
    linux-firmware = prev.linux-firmware.overrideAttrs {
      installPhase = ''
        mkdir -p $out/lib/firmware/intel
        mkdir -p $out/lib/firmware/i915
        mkdir -p $out/lib/firmware/rtl_nic
        install iwlwifi-QuZ-a0-jf-b0-77.ucode  $out/lib/firmware
        install i915/tgl_dmc_ver2_12.bin $out/lib/firmware/i915
        install intel/ibt-19-0-0.sfi $out/lib/firmware/intel
        install intel/ibt-19-0-0.ddc $out/lib/firmware/intel
        install rtl_nic/rtl8168h-2.fw $out/lib/firmware/rtl_nic
      '';
    };
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
