class Splithello < Formula
  desc "Local HTTPS proxy that splits the TLS ClientHello for selected sites"
  homepage "https://github.com/therealhieu/splithello"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/therealhieu/splithello/releases/download/v0.1.1/splithello-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "1096e779ea6b2445a2405b14c372798867c841d45512d5341c0e52df85addbfe"
    end
    on_intel do
      url "https://github.com/therealhieu/splithello/releases/download/v0.1.1/splithello-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "8023cab081f8d19d7f6f9757b53ed9c311fb3d65bcce5a078587b0e0709b2284"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/therealhieu/splithello/releases/download/v0.1.1/splithello-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a0e912205b36552b242ff2e81a1a04e87401a3d242e20880c18d001e6090248"
    end
    on_intel do
      url "https://github.com/therealhieu/splithello/releases/download/v0.1.1/splithello-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b925a2b61ed2bce92a217ee93d7ce89c20a41b5a4384d43bb45a096f33f8a8b"
    end
  end

  def install
    bin.install "splithello"
  end

  test do
    assert_equal "splithello #{version}", shell_output("#{bin}/splithello --version").strip
  end
end
