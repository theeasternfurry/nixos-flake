{
  #flake-packages = final: prev: {
    # Veloren
  #  inherit (inputs.veloren.packages."${final.system}") veloren-voxygen;
  #};

  custom-packages = final: prev: {
    dqlite = prev.dqlite.overrideAttrs {
      patches = [
        (prev.fetchpatch2 {
          url = "https://github.com/canonical/dqlite/commit/be453628ce782167f6652c055e600908e2641da7.patch?full_index=1";
          hash = "sha256-5DvZ1TW6QmE/heh/RjV395gSgwKM5XnqxqznfYQPC/Y=";
        })
      ];
    };

    /*
    linux-firmware = prev.linux-firmware.overrideAttrs {
      compressFirmware = false;

      installPhase = ''
        mkdir -p $out/lib/firmware/intel
        mkdir -p $out/lib/firmware/i915
        mkdir -p $out/lib/firmware/rtl_nic
        install iwlwifi-QuZ-a0-jf-b0-72.ucode $out/lib/firmware
        install i915/tgl_dmc_ver2_12.bin $out/lib/firmware/i915
        install intel/ibt-19-0-0.sfi $out/lib/firmware/intel
        install intel/ibt-19-0-0.ddc $out/lib/firmware/intel
        install rtl_nic/rtl8168h-2.fw $out/lib/firmware/rtl_nic
      '';
    };
    */
  };
}
