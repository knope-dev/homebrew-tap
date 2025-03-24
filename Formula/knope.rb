class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.19.0.tar.gz"
  sha256 "6940e52ae877c98c54b8c2f02c24b34e2a6831085014c7fe791fb2c5134fb216"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.19.0"
    sha256 cellar: :any,                 arm64_sonoma: "8fb0f985f528a742cb73d9c3893407fb39b347cf5f6dc36fbc38e9c21228da57"
    sha256 cellar: :any,                 ventura:      "aabf03ccd4abd8d4ac164e20d7e216528df5db0ce45246a27bbf11b9932d8cc1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4111ea8478ce23f479ff8eaa24b574fab8428793d9672f65c9da1951fb6d7895"
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
