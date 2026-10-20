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
      url "https://github.com/therealhieu/so/releases/download/v0.1.3/so-darwin-arm64"
      sha256 "ed504c3a529a32998f9461d5077427abcacd12e964b01425447d35c90b8527e8"
    end
    on_intel do
      url "https://github.com/therealhieu/so/releases/download/v0.1.3/so-darwin-x64"
      sha256 "40a8146d6ef7945306e1f22701983b98bc3eb0ac421248c7b0720d91260fb3b3"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/therealhieu/so/releases/download/v0.1.3/so-linux-arm64"
      sha256 "edcc11b775aa0dd7ff61d3b5b15126d73bce6f01f878dca19f639bfdd72b2f5a"
    end
    on_intel do
      url "https://github.com/therealhieu/so/releases/download/v0.1.3/so-linux-x64"
      sha256 "1a7154dc0258513c885d5ca4bde47d317511e502dc88b11a16c35f643b38e4ff"
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
