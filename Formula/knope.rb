class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.24.0.tar.gz"
  sha256 "a5014d87939f9ffec2c57d8887eeb68c3cd6ec6e1d71cd3a64fb0bd75998582f"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.23.2"
    sha256 cellar: :any, x86_64_linux: "b2763f250375b237e2df220949aca9910871a0a60d0f2f24c58795d308091716"
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
