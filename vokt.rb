# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.29/vokt-darwin-arm64"
      sha256 "189ffdf40fdb5eeec76cc989b5f98beaeefa645d9356d3b1c9a32cdc28809733"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.29/vokt-darwin-amd64"
      sha256 "99f05bf0bc7a8333e3e7d25ceb606b84e6c0d4c4f642b6fd4a7bf8a26c55336a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.29/vokt-linux-arm64"
      sha256 "c389d502cd4ec2b3255d2bef05c1e4799f36f50896bbdcc088a4a22e977c7570"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.29/vokt-linux-amd64"
      sha256 "fb477ae5ff862fb5c9271e714bcf8622a6d0b4db56892e4f1623bedf5e2c580e"
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
