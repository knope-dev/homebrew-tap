class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/v0.15.0.tar.gz"
  sha256 "8f21dedd530c483463e695e00974fb70cd0723f7afbae38809ed717b5ab1e125"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.15.0"
    sha256 cellar: :any,                 arm64_sonoma: "5178c38743dce46ac01ee87144a0b30e7d701f7e5723b8c0ec530be344df191d"
    sha256 cellar: :any,                 ventura:      "427f9f1996c9d452842f9dc3b602ba5053ddada294665cfeeb836ff0cbda8eb5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "53242f37b8c1e4aa41ddd9943ac20f454b1f372cef061e8665e08581a325e2cd"
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
