# frozen_string_literal: true

class Virtualxt < Formula
  desc "Portable, lightweight IBM PC/XT emulator written in Go"
  homepage "https://virtualxt.org"
  url "https://github.com/andreas-jonsson/virtualxt/archive/v0.6.tar.gz"
  version "0.6.0"
  sha256 "4004ccd7f946f5e6926ec58236e0f77bba19c6a39e504d125fe24bdc3b22350f"
  license "GPL-3.0-or-later"
  head "https://github.com/andreas-jonsson/virtualxt.git", branch: "edge"

  depends_on "go" => :build
  depends_on "pkg-config" => :build
  depends_on "sdl2"

  def install
    ENV["FULL_VERSION"] = "#{version}.0"

    system "go", "generate", "./..."
    system "go", "build", "-tags", "sdl,pcap"

    bin.install "virtualxt"
    bin.install "tools/package/homebrew/virtualxt.freedos"

    pkgshare.install "doc/manual" => "manual"
    pkgshare.install "bios/pcxtbios.bin"
    pkgshare.install "bios/vxtbios.bin"
    pkgshare.install "bios/vxtcga.bin"
    pkgshare.install "boot/freedos_hd.img"
  end

  test do
    system "virtualxt.freedos", "-h"
  end
end
