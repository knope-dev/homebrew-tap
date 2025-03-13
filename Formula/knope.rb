class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.18.5.tar.gz"
  sha256 "7a1ded5ba6904603e3c537deac964c716cac71d895c414c83320076019d9c1b6"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.18.4"
    sha256 cellar: :any,                 arm64_sonoma: "5dd402c1b7ea2c40d26ab78e02eb47bbbfbd873426a52b6263390aeac3bff048"
    sha256 cellar: :any,                 ventura:      "ac6fd90f0b088065a5330761430556c92cb681b9b41509729924152dbd122b4c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f53ab930fbe0339581cd5e54c1102df5207d39b7fbab38e50e97b6d8f1d1d0ef"
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
