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
      url "https://github.com/therealhieu/cc-profile/releases/download/v0.1.4/cc-profile-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "103260d633be62198fced6809add2d47000efc31f88c1ae8f1d04e8cad9e08fd"
    end
    on_intel do
      url "https://github.com/therealhieu/cc-profile/releases/download/v0.1.4/cc-profile-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "6f28d04efb40dec2f61cd5bf0741c0b392ea264d10e2f83ee1d7e6987e2c41b5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/therealhieu/cc-profile/releases/download/v0.1.4/cc-profile-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cbd73e4da456d054e0d198ab9ecfdda3673336e953868555c8b50746ceb68e38"
    end
  end

  def install
    bin.install "cc-profile"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cc-profile --version")
  end
end
