#!/usr/bin/env bash

# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="fheroes2"
rp_module_desc="fheroes2 is a recreation of Heroes of Might and Magic II game engine."
rp_module_help="Follow the Install instructions of fheroes2 on github, and place the Heroes2 Ffiles under ports/fheroes2."
rp_module_licence="GPL https://github.com/ihhub/fheroes2/blob/master/LICENSE"
rp_module_repo="file https://github.com/ihhub/fheroes2/releases/latest/download/fheroes2_ubuntu_arm64_SDL2.zip"
rp_module_section="exp"
rp_module_flags="!all 64bit"

function depends_fheroes2() {
  getDepends xorg fluidr3mono-gm-soundfont fluid-soundfont-gm libsdl2-mixer-2.0-0 libsdl2-image-2.0-0 libsdl2-ttf-2.0-0
}

function sources_fheroes2() {
  if (isPlatform "x86"); then
    downloadAndExtract \
      "https://github.com/ihhub/fheroes2/releases/latest/download/fheroes2_ubuntu_x86-64_SDL2.zip" \
      "$md_build"

  else
    downloadAndExtract \
      "https://github.com/ihhub/fheroes2/releases/latest/download/fheroes2_ubuntu_arm64_SDL2.zip" \
      "$md_build"
  fi
}

function install_fheroes2() {
  md_ret_files=('fheroes2'
    'files'
    'script'
    'LICENSE'
    'extract_homm2_resources.sh'
    'download_demo_version.sh'
    'changelog.txt'
    'README.txt'
  )
}

function configure_fheroes2() {
  mkRomDir "ports/fheroes2"
  ln -sf "$romdir/ports/fheroes2" "$home/.config"
  ln -sf "$md_inst/fheroes2" "$romdir/ports/fheroes2/fheroes2"
  ln -sf "$md_inst/script" "$romdir/ports/fheroes2/script"
  ln -sf "$md_inst/files" "$romdir/ports/fheroes2/files"
  moveConfigDir "$romdir/ports/fheroes2/files/save" "$md_conf_root/$md_id/save"
  addPort "$md_id" "fheroes2" "Heroes of Might and Magic II" "$romdir/ports/fheroes2/fheroes2"
}
