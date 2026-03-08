# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.30/vokt-darwin-arm64"
      sha256 "523345f3f75313c8ad01c87548ca5a92c1534dfa8e16afec3665c07ea43b242e"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.30/vokt-darwin-amd64"
      sha256 "9c39da6252f2374cbd5974bac8fb8d2ebc75daebc1b6fed13f24d03dc6c8dcba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.30/vokt-linux-arm64"
      sha256 "fd73f1dba7d52da8ba83e5d8b88ac197c0047c7f27337c5fe7437d87fb3fc4a6"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.30/vokt-linux-amd64"
      sha256 "b6385426a21edcf26979abb48b0838c63169bc3f8f9a136c6f96b065accd95a1"
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
