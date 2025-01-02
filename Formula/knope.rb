class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.18.2.tar.gz"
  sha256 "16039d98db6d274a58b0069ff371f9bef9e0d5a1761b0fc4f5b350b77bcb975c"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.18.1"
    sha256 cellar: :any,                 arm64_sonoma: "ce7ad1871abeaa1a3bc393f18a4d5d1a62dc04a8865548b5d271a953597a2a7a"
    sha256 cellar: :any,                 ventura:      "2317cfb8f484987f577ead740a37042b1b6dcc56bf4d2963663cdf02ef621fd1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "634a73ca6e43c260c99f8aa37b2f7d8a622eced9ae5e299732cdd44d7c5c7371"
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
