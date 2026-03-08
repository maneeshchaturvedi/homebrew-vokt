# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.33/vokt-darwin-arm64"
      sha256 "f23b097c51b173b754169eb6b2c81bd0b456cbcc9b27ec78a04506b86759e15f"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.33/vokt-darwin-amd64"
      sha256 "c41bed68380b569423a7a14dec812443689a26f2bf4a7cedc242292b50a439e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.33/vokt-linux-arm64"
      sha256 "1fa44ae96a87ed9f08323b33d5c5f14ff321b48e259cc71bcb729093d36c3083"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.33/vokt-linux-amd64"
      sha256 "8c6c7c3523d43d47cd5b606ed09fe35557b5fa4618a87c5a0d362f923af8c40b"
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
