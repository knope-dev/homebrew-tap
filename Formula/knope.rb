class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.19.0.tar.gz"
  sha256 "67eea9f797f477a960d6f1265e342437536444f40361334eb83f4230c64f9bf0"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.18.5"
    sha256 cellar: :any,                 arm64_sonoma: "e37dd5c3cb0cc0c544b892eab37b626d05aa7615065ccdad7ecf4875490eb04e"
    sha256 cellar: :any,                 ventura:      "ae9d1bd5e212edc22cdf1f9d447a0130416f3ec72a22d2031a98e7cba66fa3f2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e064e10d4fd4811aeee36538e362bbc321df9b2b5ae66589f71c6dbfb66d3d3a"
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
