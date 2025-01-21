class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.18.3.tar.gz"
  sha256 "d68a1387ac8a09f01f960b1e775be9e22e54268adfb3a8e77b7a3f55c363ab72"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.18.3"
    sha256 cellar: :any,                 arm64_sonoma: "6d383239ea2d0391ffa5df91ab8db5a4aee0a73192b0b86c023133180b49d10c"
    sha256 cellar: :any,                 ventura:      "5efe747ba456af04ce25df900a918fd09cad759bc2e604b4cd1398df6ade5fac"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "39a0b3baaa4eaa4adc2b1aeb316987dbe911d43a341f441120c5ed44fa55069c"
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
