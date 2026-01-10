class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.21.7.tar.gz"
  sha256 "6e3b69e943cefef0a1eda5919191c634b960b5a37325fe9250d661b990695c55"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.20.0"
    sha256 cellar: :any,                 arm64_sonoma: "c0f5fdd50b1e35b28289512b4ff490a261854183c0bd47ff9f65acba6546c7b1"
    sha256 cellar: :any,                 ventura:      "02f76f16193dfdd3ee9d330903e5c6d9b0edf1b6748555d271129b203039effa"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5d85a537c8bacd55ad3349931e6d79932b3fa2b8e7c41e1f5c74d7d3e18c00f5"
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
