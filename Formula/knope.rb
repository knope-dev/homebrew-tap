class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/v0.14.1.tar.gz"
  sha256 "c9e3ef0539f31d711ef30192e1ee080352cebe537a1ebdfb04d895a4c3a0bf0c"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.14.0"
    sha256 cellar: :any,                 arm64_sonoma: "7cb16b5cd3ecfdd5f491f7fcb74116e0ca250addee934913f5e15593a3978e12"
    sha256 cellar: :any,                 ventura:      "f8fb55eff998061eb6511191e86f131a0f96fb29f3962f2be7a6745d9027aa40"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "671e380ce03e2b1a539331700720287ef06b3a15de5e8cae3df3b1ec8dbe1873"
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
