class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "2f5136c38a3386e80325e712069c21984f6fa3aff830b9c40ab9fdaec630f7b2"
  license "MIT"
  head "https://github.com/apollographql/rover.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.13.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, ventura: "40f08cb7d8d088e90daa2d2153538e73df60e5fe2de23b4ab6453e500f8636c3"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/knope", "--help"
  end
end
