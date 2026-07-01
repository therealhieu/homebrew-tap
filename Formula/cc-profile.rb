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
      url "https://github.com/therealhieu/cc-profile/releases/download/v0.1.2/cc-profile-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "86df92297a7869f8ba2571c716da218ca8480cd0d252e0acf69cb29fdc98d0ea"
    end
    on_intel do
      url "https://github.com/therealhieu/cc-profile/releases/download/v0.1.2/cc-profile-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "c6c30d8be3aa111126e65f6b9b13aeaa0360e326e42a72375b9b6a995d67c138"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/therealhieu/cc-profile/releases/download/v0.1.2/cc-profile-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1254573e3c38e311f6d734661ce66b96266296f04999ae1bf8d5cb3cf09d3b70"
    end
  end

  def install
    bin.install "cc-profile"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cc-profile --version")
  end
end
