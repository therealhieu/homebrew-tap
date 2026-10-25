class So < Formula
  desc "Fast terminal editor with Vim keys, for Markdown notes and code"
  homepage "https://github.com/therealhieu/so"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/therealhieu/so/releases/download/v0.1.5/so-darwin-arm64"
      sha256 "c622d5fff56a1e7dbce1db01e98edfd5ba3dd74fe5bb68418e6e79051f95e613"
    end
    on_intel do
      url "https://github.com/therealhieu/so/releases/download/v0.1.5/so-darwin-x64"
      sha256 "4ffebd9e8149b7f34a51f9db29218b09b62549ba84947741af5abe45da2fc11d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/therealhieu/so/releases/download/v0.1.5/so-linux-arm64"
      sha256 "51ddce74dc71d7cb46cff0c46239390e253b87bdb40707ae39337ad5cd376dd4"
    end
    on_intel do
      url "https://github.com/therealhieu/so/releases/download/v0.1.5/so-linux-x64"
      sha256 "d1c37139f4055c43896b571f498824b126c1f584fe72b57e1e53771df80db83c"
    end
  end

  def install
    bin.install Dir["so-*"].first => "so"
  end

  def caveats
    <<~EOS
      Reading PDFs needs Poppler:
        brew install poppler
    EOS
  end

  test do
    assert_equal "so #{version}", shell_output("#{bin}/so --version").strip
  end
end
