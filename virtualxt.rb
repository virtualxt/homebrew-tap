# frozen_string_literal: true

class Virtualxt < Formula
  desc "Portable, lightweight IBM PC/XT emulator written in Go"
  homepage "https://virtualxt.org"
  url "https://github.com/andreas-jonsson/virtualxt/archive/v0.6.1.tar.gz"
  sha256 "6619e16925ab488bc7ee09852d05c98f758050aef9c115eec70a283c9bdc04dc"
  license "Zlib"
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
    pkgshare.install "bios/vxtx.bin"
    pkgshare.install "boot/freedos_hd.img"
  end

  test do
    system "go", "test", "./..."
  end
end
