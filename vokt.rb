# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.24/vokt-darwin-arm64"
      sha256 "a8e4b19994014e1722a378e15c4a0da0a539c5a01fd3af0bb9704c3ff65d944f"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.24/vokt-darwin-amd64"
      sha256 "62184af23dc441f41e19d0064a142d18ecd8d5d66b37d9b0734b5fdb0c883350"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.24/vokt-linux-arm64"
      sha256 "2cd27ca207b8d8f0b5b0a4579cbba942079a512d48c7ad206c32dea3f99d1255"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.24/vokt-linux-amd64"
      sha256 "9713179fa1ecc720021783064529f3c24a7e2f141d32ed692457b18a69fe793e"
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
