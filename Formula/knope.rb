class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.16.2.tar.gz"
  sha256 "68dfd499d4eed742623ae102c191b043315ae762db0bd2012b4f8e17116e461f"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.16.1"
    sha256 cellar: :any,                 arm64_sonoma: "71d9a92b787ca9a9beadf7021af08f7558df4efc4755482d8e9abc1007fbeb83"
    sha256 cellar: :any,                 ventura:      "b62b8da6106daa01d55c1153b7d29cfc29667f94349f5604f65af5bdedd19bf0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ae753a7fbf16dd67a2bc0a887190a407361e4d171ba768a45ea7f08096c48741"
  end

  depends_on "rust" => :build
  depends_on "zlib"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/knope", "--help"
  end
end
