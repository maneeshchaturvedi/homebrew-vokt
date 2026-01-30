# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.14/vokt-darwin-arm64"
      sha256 "c9576a54388590a7e327ea0d10617edd08e304df2e3cc670a4baf6dcf2218af7"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.14/vokt-darwin-amd64"
      sha256 "6f796ab6cbd6a9c42dbfc4b20dfe43b5ec0b712682005e9da0d0a03f42dd68f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.14/vokt-linux-arm64"
      sha256 "203800ba00506776f7e04d7fdeaef359ce5178e6933f75eba6122e049871b054"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.14/vokt-linux-amd64"
      sha256 "8f77f6d712d28089c38e282d4e9acefd16c2c93700adf3750c04d5b4b6e71e30"
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
