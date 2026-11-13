class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.24.0.tar.gz"
  sha256 "a5014d87939f9ffec2c57d8887eeb68c3cd6ec6e1d71cd3a64fb0bd75998582f"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.24.0"
    sha256 cellar: :any, arm64_sequoia: "d0040ae113a671037ebc955b8c473850e5727d3a0aa92cb9e31bd523deef7a88"
    sha256 cellar: :any, x86_64_linux:  "07e8b97ec0651f9c24e56c0466cad7420e4ce27553cd9425545052c12083c763"
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
