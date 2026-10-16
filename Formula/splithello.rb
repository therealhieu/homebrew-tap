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
      url "https://github.com/therealhieu/splithello/releases/download/v0.1.0/splithello-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "d6e9c7457bee1e848dfb3bb8734c46858692f8216e52b2e8fe4063f30366cbfd"
    end
    on_intel do
      url "https://github.com/therealhieu/splithello/releases/download/v0.1.0/splithello-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "20f518d61ac7b5f5349324e3249cd750809c73280956cf1b971260f6581a445d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/therealhieu/splithello/releases/download/v0.1.0/splithello-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "900184b7486e75217230141b9aedd51db5e5c02bab10ef36c99fd66fbf7077d1"
    end
    on_intel do
      url "https://github.com/therealhieu/splithello/releases/download/v0.1.0/splithello-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3184fc78c3aa942bcb5e5f4707987bc92bf40a13d9c9957465a085a90e607cd"
    end
  end

  def install
    bin.install "splithello"
  end

  # `brew services start splithello`: runs at login. Restarted only after a crash (launchd), so a
  # config error stops it instead of looping; systemd's restart limit ends such a loop on Linux.
  # The marker lets `splithello stop` point to `brew services stop` instead.
  service do
    run [opt_bin/"splithello", "start", "--log-file", var/"log/splithello.log"]
    environment_variables SPLITHELLO_MANAGED_BY: "homebrew"
    keep_alive crashed: true
    log_path var/"log/splithello.log"
    error_log_path var/"log/splithello.log"
  end

  test do
    assert_equal "splithello #{version}", shell_output("#{bin}/splithello --version").strip
  end
end
