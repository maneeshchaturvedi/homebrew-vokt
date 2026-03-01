# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.23/vokt-darwin-arm64"
      sha256 "29df6b869a56ca471f62a36f935ff7d42f42e638abde49dec9b0f9a3e60d8832"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.23/vokt-darwin-amd64"
      sha256 "fae44aea7ab73cc513bf15907ad5c4ddd1e73887e5a26cd263f01e25a13aef29"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.23/vokt-linux-arm64"
      sha256 "dace18e1f14117e425f461ff7cefc42f6884f9979f24c91bad225a60bf747b6f"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.23/vokt-linux-amd64"
      sha256 "3f7da07dd9333b4eb804dafda4a7f732e8b76e6fa9094bed786bf3cf76bbf953"
    end
  end

  def install
    bin.install "vokt-darwin-arm64" => "vokt" if Hardware::CPU.arm? && OS.mac?
    bin.install "vokt-darwin-amd64" => "vokt" if Hardware::CPU.intel? && OS.mac?
    bin.install "vokt-linux-arm64" => "vokt" if Hardware::CPU.arm? && OS.linux?
    bin.install "vokt-linux-amd64" => "vokt" if Hardware::CPU.intel? && OS.linux?
  end

  test do
    assert_match "Vokt", shell_output("#{bin}/vokt --version")
  end
end
