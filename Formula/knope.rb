class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.22.3.tar.gz"
  sha256 "c3ca2e035da64d38a0251fe81d669985b2d61e10c8533e6f97cf93df9661949c"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.22.2"
    sha256 cellar: :any,                 arm64_sonoma: "8e9e8e00505ffc79006e41b0817d8457cd1b0b5ec264f849ba42ab62ac277ae2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "68869071dd68dd07bc17d88e9ded229af48275179f9fbd7237604000fb264432"
  end

  depends_on "rust" => :build
  depends_on "zlib"

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/knope")
  end

  test do
    system "#{bin}/knope", "--help"
  end
end
