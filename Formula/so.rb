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
      url "https://github.com/therealhieu/so/releases/download/v0.1.1/so-darwin-arm64"
      sha256 "24ab3847730dd063f369881aa6c6f3b709ca3d7a5c6d8bbffc973fda7b0104e5"
    end
    on_intel do
      url "https://github.com/therealhieu/so/releases/download/v0.1.1/so-darwin-x64"
      sha256 "aa27b02b9604de0511953e0d0bc6e64ce6a5d0ec927318fdb4f9be172e2cad3f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/therealhieu/so/releases/download/v0.1.1/so-linux-arm64"
      sha256 "2ae0fd5ff38848a47549218b9f1bbe5df775fc133d4dfcb270b2b72a916edf11"
    end
    on_intel do
      url "https://github.com/therealhieu/so/releases/download/v0.1.1/so-linux-x64"
      sha256 "3c279258d87e28293417cdb7f9bd16a352a0dd423de44618b697404097dadb20"
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
