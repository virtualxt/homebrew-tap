# frozen_string_literal: true

class Virtualxt < Formula
  desc "Portable, lightweight IBM PC/XT emulator written in C"
  homepage "https://virtualxt.org"
  url "https://github.com/andreas-jonsson/virtualxt/archive/v0.7.0.tar.gz"
  sha256 "3077257ecd643749e29f9a7d3d1418fbeacc23f422b83bd398ebb8e5adf3a4f4"
  license "zlib-acknowledgement"
  head "https://github.com/andreas-jonsson/virtualxt.git", branch: "edge"

  depends_on "zig" => :build
  depends_on "pkg-config" => :build
  depends_on "sdl2"

  def install
    system "zig", "build", "-Drelease-fast", "-Dv20"

    bin.install "build/bin/virtualxt"
    bin.install "tools/package/homebrew/virtualxt.freedos"

    pkgshare.install "bios/pcxtbios.bin"
    pkgshare.install "bios/glabios.bin"
    pkgshare.install "bios/vxtx.bin"
    pkgshare.install "boot/freedos_hd.img"
  end

  test do
    system "virtualxt.freedos", "-h"
  end
end
