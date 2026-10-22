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
      url "https://github.com/therealhieu/so/releases/download/v0.1.4/so-darwin-arm64"
      sha256 "f5d8a02fc577557ac6cdd11242ac76d588d71f8a2c454f317e195e6a2ec91438"
    end
    on_intel do
      url "https://github.com/therealhieu/so/releases/download/v0.1.4/so-darwin-x64"
      sha256 "07a2b7331a5b0e2825a3a7015e12ad4c8ed5967d3991b647d1f6a87980e89716"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/therealhieu/so/releases/download/v0.1.4/so-linux-arm64"
      sha256 "ce3fdef851d94666121c10617adc51ba63cda921dd87e5db61b179e90a960676"
    end
    on_intel do
      url "https://github.com/therealhieu/so/releases/download/v0.1.4/so-linux-x64"
      sha256 "b013e8fc3ba789ac513f140bb707f92f721b8daab6b9ba19c5d86b1073443cb2"
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
