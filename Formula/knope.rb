class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.18.1.tar.gz"
  sha256 "a22734c96d506979a9e23c6b116c96b74105fdfb241cd0124c8723de18418d17"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.18.0"
    sha256 cellar: :any,                 arm64_sonoma: "a6498941cda4d09eea8c45f61216e0494326a52956949ba14aa303994a094768"
    sha256 cellar: :any,                 ventura:      "00c9fc803958ba9b1728b91c51d0d22090668d0536f5bf81e7f2ae178977663e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7c2891fc2bcfa427b7904526af2a56b3a0e0bf98e529d7e8368d42dd48db3c54"
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
