class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.22.1.tar.gz"
  sha256 "6d220d79e5d66cfb0b23a3f443d3261cd6e3ab357de803d113b199240303719d"
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
