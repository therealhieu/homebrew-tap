class CcProfile < Formula
  desc "Profile management for Claude Code endpoints and models"
  homepage "https://github.com/therealhieu/cc-profile"
  url "https://github.com/therealhieu/cc-profile/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2f641d5cc6f35b1f97c8224a23d58fdf064e49634223b146c7c442208838beaa"
  license "MIT"
  head "https://github.com/therealhieu/cc-profile.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--path", ".", "--root", prefix
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cc-profile --version")
  end
end
