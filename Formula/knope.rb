class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/v0.13.4.tar.gz"
  sha256 "2f5136c38a3386e80325e712069c21984f6fa3aff830b9c40ab9fdaec630f7b2"
  license "MIT"
  head "https://github.com/apollographql/rover.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.13.4"
    rebuild 2
    sha256 cellar: :any,                 ventura:      "ebcd75c4724244248fe13a63b65eefc5e9577e0b380ec4f5a998c6816555734a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "26c38dead9bec195b0ac4b02b807141fcfa50525011ca2459d5001914ff150c5"
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
