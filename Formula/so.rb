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
      url "https://github.com/therealhieu/so/releases/download/v0.1.0/so-darwin-arm64"
      sha256 "23022cd819c820f201706236da925311bade0b6c039a5bda0ebbe5bbdca9a886"
    end
    on_intel do
      url "https://github.com/therealhieu/so/releases/download/v0.1.0/so-darwin-x64"
      sha256 "1c74e4105539057b644cbd3aaf29b2bdc8d6d1d863ced6a7be92431689adac69"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/therealhieu/so/releases/download/v0.1.0/so-linux-arm64"
      sha256 "7a9ddfa2453d61008f3ac2f8c6d3d585146492af34e1df1bcc7b4d8a820b981f"
    end
    on_intel do
      url "https://github.com/therealhieu/so/releases/download/v0.1.0/so-linux-x64"
      sha256 "d4b0d2c64a2284cedbe97f07bcacba280016f35e8bc4451ad719e60ae9b04f90"
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
