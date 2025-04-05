class TgTimer < Formula
  desc "A program for timing mechanical watches"
  homepage "https://tg.ciovil.li"
  url "https://github.com/PetitLuc38/New-stuff/archive/refs/tags/v0.6.1-tpiepho.tar.gz"
  sha256 "c88889bd391212d9104bca9918fb573a4ff96a752717b4a779d33f637c633ce7"
  head "https://github.com/PetitLuc38/New-stuff.git", :branch => "new-stuff"

  depends_on "pkg-config" => :build
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
