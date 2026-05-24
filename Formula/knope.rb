class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.23.0.tar.gz"
  sha256 "3993d1e96d71f87c6a9bfe3161fbf574b274b4ec13ac66b530a0326813c35c56"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.22.4"
    sha256 cellar: :any,                 arm64_sonoma: "67a21c249da5c94ab4a99f2e65a7e7cbdd224d7e9465f32235ad389e4fc09784"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8837ed7f93686d2488d6becb8b3ead2420f6fdf055ea490cbab5e493ce719618"
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
