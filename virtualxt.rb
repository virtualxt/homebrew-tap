class Virtualxt < Formula
    virtualxt_version = "0.5.0"
    
    desc "A portable, lightweight IBM PC/XT emulator written in Go."
    homepage "http://virtualxt.org"
    head "https://github.com/andreas-jonsson/virtualxt.git", :branch => "master"
    url "https://github.com/andreas-jonsson/virtualxt/archive/v0.5.zip"
    version virtualxt_version
    sha256 "d1d7a2f125b83a9855858007b1c45081fd478074d93016a976edb6998bd3ea6c"
    
    depends_on "pkg-config" => :build
    depends_on "go" => :build
    depends_on "sdl2"

    def install
        system "FULL_VERSION=#{virtualxt_version}.0 go generate ./..."
        system "go build -tags sdl"

        bin.install "virtualxt"
        bin.install "tools/package/homebrew/virtualxt.freedos"
        
        share.install "doc/manual" => "manual"
        share.install "bios/pcxtbios.bin" => "bios/pcxtbios.bin"
        share.install "bios/vxtcga.bin" => "bios/vxtcga.bin"
        share.install "boot/freedos.img" => "boot/freedos.img"
    end
end
