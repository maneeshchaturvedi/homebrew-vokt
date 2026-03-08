# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.32/vokt-darwin-arm64"
      sha256 "b63b4368de2b5d485d52932435d38fa87aa093a33f4a18ed3bf251960289df02"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.32/vokt-darwin-amd64"
      sha256 "6494b2ca7815990e3b9cb69f7133225ca79009b785f9cac3248f6ef56cadc0dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.32/vokt-linux-arm64"
      sha256 "0b47a3b33f71b88b0477e7c75cfff484982201892d595c007e03350760f799bc"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.32/vokt-linux-amd64"
      sha256 "b37f2c81575e0e08a5a20e046c54914008b6fdee0d3b50b678ca85f9ae12120e"
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
