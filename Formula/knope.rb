class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "2f5136c38a3386e80325e712069c21984f6fa3aff830b9c40ab9fdaec630f7b2"
  license "MIT"
  head "https://github.com/apollographql/rover.git", branch: "main"

  bottle do
    sha256 arm64_sonoma: "a378da8a1704e172915b63fd11405ec0e38f92728d750c886ac6d17bb6b384e7"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/knope", "--help"
  end
end
