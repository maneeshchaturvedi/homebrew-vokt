# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.18/vokt-darwin-arm64"
      sha256 "51001da6fb0fc9c688cafbba6052c843450a0a23de1ffc0e71bdc202c991babc"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.18/vokt-darwin-amd64"
      sha256 "0f925e9a775152b72182b1bfb15f67b19f121720113da1a1aede681d802cb186"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.18/vokt-linux-arm64"
      sha256 "8c32b5813118750879a1597850700e27905aa4fcb149f2f1903b8e71c3c7c4f3"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.18/vokt-linux-amd64"
      sha256 "408bda6b57010e618ed2bc83108b1c976a35e175da126207499c2cf40807cf9b"
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
