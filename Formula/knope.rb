class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.18.0.tar.gz"
  sha256 "68dfd499d4eed742623ae102c191b043315ae762db0bd2012b4f8e17116e461f"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.16.2"
    sha256 cellar: :any,                 arm64_sonoma: "881b0fbb43e5196cdc04e72498fe3d1a6b53c0a7ed908922527301b86cbb181d"
    sha256 cellar: :any,                 ventura:      "28bf2af5e1173fcdd260d2f388f4f65e7395cc98bb42f74d34e4b23447312058"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e62d26bf709d1a690ecc3c72761acb44899e4722325cdeb7169608aaa8e7776b"
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
