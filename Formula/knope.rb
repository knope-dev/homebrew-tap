class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.22.2.tar.gz"
  sha256 "c3ca2e035da64d38a0251fe81d669985b2d61e10c8533e6f97cf93df9661949c"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.22.1"
    sha256 cellar: :any,                 arm64_sonoma: "93be9a53f64853f508d631d57a95f1224fd30587d195ce209a4b81a956863d13"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "254d4a1a881c803dbb1e59ec741e5b9b19f77168aad73099ddfc156eca33911a"
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
