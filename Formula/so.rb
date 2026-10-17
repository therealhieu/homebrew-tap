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
      url "https://github.com/therealhieu/so/releases/download/v0.1.2/so-darwin-arm64"
      sha256 "5d596b427c4e9d8a80699b78f4ca2c90cc9760413e96abd56ff5bf25f46acf35"
    end
    on_intel do
      url "https://github.com/therealhieu/so/releases/download/v0.1.2/so-darwin-x64"
      sha256 "31d089a5174e2779f712dea4dcc568bf845d9db1636070225723f0fbd33422bd"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/therealhieu/so/releases/download/v0.1.2/so-linux-arm64"
      sha256 "a0f28e89a606609a62c1556a7a74b76ba99265e0fdd0dd51cccbfef809242ecc"
    end
    on_intel do
      url "https://github.com/therealhieu/so/releases/download/v0.1.2/so-linux-x64"
      sha256 "0afd391535e7a68e17d6a324bc0c857f52bf447a83084c8b7c30cde2e60656d7"
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
