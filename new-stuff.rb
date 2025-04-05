class TgTimer < Formula
  desc "A program for timing mechanical watches"
  homepage "https://tg.ciovil.li"
  url "https://github.com/PetitLuc38/New-stuff/archive/refs/tags/v0.6.1-tpiepho.tar.gz"
  sha256 "a219eaeda2e6c97fb61ae93ae0af80eacaa1fb53fc83d39918ad35e55ff9bb91"
  head "https://github.com/PetitLuc38/New-stuff.git", :branch => "new-stuff"

  depends_on "pkg-config" => :build
  depends_on "cmake" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "gtk+3"
  depends_on "portaudio"
  depends_on "fftw"
  depends_on "gnome-icon-theme"

  def install
    ENV["LIBTOOL"] = "glibtool"
    ENV["LIBTOOLIZE"] = "glibtoolize"
    system "./autogen.sh"
    system "./configure"
    system "make"
    bin.install "new-stuff"
    man1.install "new-stuff.1"
  end

  test do
    system "man", "new-stuff"
  end
end
