class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.23.0.tar.gz"
  sha256 "3993d1e96d71f87c6a9bfe3161fbf574b274b4ec13ac66b530a0326813c35c56"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.23.0"
    sha256 cellar: :any,                 arm64_sonoma: "d84ed251d5f7431243f548f473ab088a8ee87b11870158630b889dfa2b409a82"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bc40e799385d0c92ee7ced8a3b1951673ca669d1107d5258e592ceee9b4ebfa7"
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
