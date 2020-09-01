class Virtualxt < Formula
    desc "A portable, lightweight IBM PC/XT emulator written in Go."
    homepage "http://virtualxt.org"
    url "https://github.com/andreas-jonsson/virtualxt/archive/v0.5.zip"
    version "0.5.0"
    sha256 "D1D7A2F125B83A9855858007B1C45081FD478074D93016A976EDB6998BD3EA6C"

    depends_on "pkg-config" => :build
    depends_on "go" => :build
    depends_on "sdl2"

    def install
        system "go generate ./..."
        system "go build -tags sdl"

        bin.install "virtualxt"
        share.install "doc/manual" => "manual"
        share.install "bios/pcxtbios.bin" => "bios/pcxtbios.bin"
        share.install "bios/vxtcga.bin" => "bios/vxtcga.bin"
        share.install "boot/freedos.img" => "boot/freedos.img"
    end
end
