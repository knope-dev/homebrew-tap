class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.22.4.tar.gz"
  sha256 "8ebaafed37ef5107601b3d81f4687f6d61d649a90a6eeccd81a316c5a4cb7076"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.22.3"
    sha256 cellar: :any,                 arm64_sonoma: "2ceeb2e98a24def0c0c79e18559116669843030f947a3d9d9db7f95371706ffd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a7143cfb7474dde0cca75f1765adb1f2ba8a5cb2f1b700e97fd78e0176d74ec8"
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
