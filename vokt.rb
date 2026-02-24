# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.19/vokt-darwin-arm64"
      sha256 "4adec6d6d556b1f14817b6f70b5b5a5135424f34458d6502d3da4ced6db848f2"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.19/vokt-darwin-amd64"
      sha256 "36b2f6b268cae4fc7cb9abe5f899477149144d628a1d374daae34bacdecb4a45"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.19/vokt-linux-arm64"
      sha256 "df4731eafa1cfa48e2e01f812f16d709356301afe93f384ce1ef2a96afc44203"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.19/vokt-linux-amd64"
      sha256 "538ebcfd2bf0dbf30bbb50ef1a59066edc920ece920b462faf61020e6f27e8cc"
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
