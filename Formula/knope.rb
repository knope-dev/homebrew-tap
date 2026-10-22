class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.23.2.tar.gz"
  sha256 "f95be79030fa46546bc0b7a13b4f58e21d95634ca652d85949e70251b111d644"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.23.1"
    sha256 cellar: :any, x86_64_linux: "912c445494318091f677b5f5cfc6a9a83bc6656379bf5f8715d15188e0017144"
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
