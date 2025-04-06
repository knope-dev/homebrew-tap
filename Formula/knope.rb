class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.19.2.tar.gz"
  sha256 "a5ac34b5d529ec0d1cd8a902a8328074375f804e8d9a27de84709cbda08d9825"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.19.2"
    sha256 cellar: :any,                 arm64_sonoma: "ee5efe06e0abaad69ff5d337dc548048aebb3fc4857432d56cd8844ec758268f"
    sha256 cellar: :any,                 ventura:      "1fb645fefce2e067d47b405e613ea43b4a7fb6299c609db9a8ae950860523a60"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "498cefc1ac1f7128f5d251c6b64332b41d80fc0594a80b5b9b658aad0ce33a76"
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
