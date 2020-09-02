# frozen_string_literal: true

class Virtualxt < Formula
  desc "Portable, lightweight IBM PC/XT emulator written in Go"
  homepage "https://virtualxt.org"
  head "https://github.com/andreas-jonsson/virtualxt.git", branch: "master"
  url "https://github.com/andreas-jonsson/virtualxt/archive/v0.5.zip"
  sha256 "d1d7a2f125b83a9855858007b1c45081fd478074d93016a976edb6998bd3ea6c"
  version "0.5.0"
  license "GPL-3.0-or-later"

  depends_on "go" => [:build, :test]
  depends_on "pkg-config" => [:build, :test]
  depends_on "sdl2"

  def install
    system "FULL_VERSION=#{version}.0", "go", "generate", "./..."
    system "go", "build", "-tags", "sdl"

    bin.install "virtualxt"
    bin.install "tools/package/homebrew/virtualxt.freedos"

    pkgshare.install "doc/manual" => "manual"
    pkgshare.install "bios/pcxtbios.bin"
    pkgshare.install "bios/vxtcga.bin"
    pkgshare.install "boot/freedos.img"
  end

  test do
    system "go", "test", "./..."
  end
end
