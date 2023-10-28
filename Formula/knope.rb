class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "2f5136c38a3386e80325e712069c21984f6fa3aff830b9c40ab9fdaec630f7b2"
  license "MIT"
  head "https://github.com/apollographql/rover.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/knope", "--help"
  end
end
