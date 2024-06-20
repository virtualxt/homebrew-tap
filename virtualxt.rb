# frozen_string_literal: true

class Virtualxt < Formula
  desc "Portable, lightweight PC/XT emulator written in C"
  homepage "https://virtualxt.org"
  url "https://github.com/andreas-jonsson/virtualxt/archive/v1.0.tar.gz"
  sha256 "b5662318abee4caf20e5684ad82f2b7cf38c98a3e8889127eac4d6af03e79644"
  license "zlib-acknowledgement"
  head "https://github.com/andreas-jonsson/virtualxt.git", branch: "edge"

  depends_on "premake" => :build
  depends_on "make" => :build
  depends_on "sdl2"
  depends_on "libpcap"

  def install
    system "premake5", "--modules", "--static", "gmake"
    system "make", "sdl2-frontend"

    bin.install "build/bin/virtualxt"
    bin.install "tools/package/homebrew/virtualxt.freedos"

    pkgshare.install "bios/GLABIOS.ROM"
    pkgshare.install "bios/GLABIOS640.ROM"
    pkgshare.install "bios/GLaTICK_0.8.4_AT.ROM"
    pkgshare.install "bios/pcxtbios.bin"
    pkgshare.install "boot/freedos.img"
    pkgshare.install "boot/freedos_hd.img"
  end

  test do
    system "virtualxt.freedos", "-h"
  end
end
