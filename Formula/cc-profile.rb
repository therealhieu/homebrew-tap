class CcProfile < Formula
  desc "Profile management for Claude Code endpoints and models"
  homepage "https://github.com/therealhieu/cc-profile"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/therealhieu/cc-profile/releases/download/v0.1.3/cc-profile-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "d0d16547887008ed1d0dbd7b560047098cca72ec3631802afbf50643608f5872"
    end
    on_intel do
      url "https://github.com/therealhieu/cc-profile/releases/download/v0.1.3/cc-profile-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "2d264b86034a67965554995d8e8835ece9ee6efc13619c7af671c2317b09d7e3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/therealhieu/cc-profile/releases/download/v0.1.3/cc-profile-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3838f8350f96dda891806c7d1a454357b081c32d799cdfe47780be3a612f39fb"
    end
  end

  def install
    bin.install "cc-profile"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cc-profile --version")
  end
end
