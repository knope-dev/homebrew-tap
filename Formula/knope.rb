class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.22.0.tar.gz"
  sha256 "643e4a67e534c7c17f253686cdd7abf59b72df386b08d0d371fa221df31fba28"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.22.0"
    sha256 cellar: :any,                 arm64_sonoma: "fe08e5f412a37281c340594ca626d2b6499ae728799d37cc38463d9a172293ef"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5839027818c768594b2f368cb2763e444bc04609cdc0f8e999d9804f27ca2b4a"
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
