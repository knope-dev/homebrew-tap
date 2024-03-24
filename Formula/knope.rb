class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/v0.16.1.tar.gz"
  sha256 "789e750ab2604df40508a856b4c4ba814a5d01db5a2cd3eda7e1436c932261e0"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.16.0"
    sha256 cellar: :any,                 arm64_sonoma: "062356983648b86c0e51244292cdb68e58ba6b5f25f1acc459de150ab37de127"
    sha256 cellar: :any,                 ventura:      "ac6b20d47bb3eb120a8aa5d79680401a436d347687464be7a31e65cb5735f32c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "eced7632ffc313a0975ae6b29843258bc7887d594abce9fdafbb000422b4b7a3"
  end

  depends_on "rust" => :build
  depends_on "zlib"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/knope", "--help"
  end
end
