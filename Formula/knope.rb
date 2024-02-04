class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/v0.14.0.tar.gz"
  sha256 "29e229af18db0086fafecac562c4872e0bf27f70d00cc4fec9dee10d5512e3c3"
  license "MIT"
  head "https://github.com/apollographql/rover.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.13.4"
    sha256 cellar: :any,                 arm64_sonoma: "1b45289ae37d5074baf9c998083ddb999faacd7a6b606eaa36ed46a35330d38a"
    sha256 cellar: :any,                 ventura:      "e3dbee6ab9034ceb6eb89915959aa972427e31e1930e83cc7d351ac7d0af597b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0b25370e69afbd98245d6948c522ac69585f1154a93982d12c808507b729d455"
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
