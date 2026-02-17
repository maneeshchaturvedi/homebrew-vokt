# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.17/vokt-darwin-arm64"
      sha256 "5e7c2f65c78a4357dd5690b1582152b4b1cd7ef3b35182af419cc56ad6e99e8e"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.17/vokt-darwin-amd64"
      sha256 "a678e90d9237578cedb253475352a0d505a1b6c2e1650f505776ce7644aa5553"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.17/vokt-linux-arm64"
      sha256 "708b6cb52960bd83cfe288ca4cb7f2f2df42b627983a8427bdc0c120f5a95a7f"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.17/vokt-linux-amd64"
      sha256 "b8d7a11d6d48ca7967bbcbfa7969f87d64a6c84a565db3a807dce9d4dd6020f2"
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
