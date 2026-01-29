# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.12/vokt-darwin-arm64"
      sha256 "22f98259e4f1bbf91434ff9a579212248b4179f7d11b59ad2e2a60874b9ce74b"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.12/vokt-darwin-amd64"
      sha256 "83e4c56e720d6f006b31ae2f0f68566070d3f526002579182dddd90662038f9b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.12/vokt-linux-arm64"
      sha256 "b1af311f6c79c5ebc9dcfa757874db7fda82116d35d503ea2ae5bbe0ad6cd7ef"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.12/vokt-linux-amd64"
      sha256 "2fccab51eba7f61f590cd9bb408d46def712fc1972345c885613affcacdcf4ba"
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
