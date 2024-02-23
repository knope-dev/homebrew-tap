class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/v0.14.1.tar.gz"
  sha256 "c9e3ef0539f31d711ef30192e1ee080352cebe537a1ebdfb04d895a4c3a0bf0c"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.14.1"
    sha256 cellar: :any,                 arm64_sonoma: "70c1aeebc039c7a8f17af08dffcd2bc250646d571eb64d3650ad373a5f178899"
    sha256 cellar: :any,                 ventura:      "b23f108387c743456fb729a2a3fa8afc6cbd69454889fb85a81f8de5ccb0a22b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d3a4d053ce2b38b6af546b9316c5f0d6f5cf75a170445f0a0602375822d7d4cd"
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
