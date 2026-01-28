# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.8/vokt-darwin-arm64"
      sha256 "3aeb9fed48485daea7aea44d412afa0f894566adced972afda6c3049166c2791"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.8/vokt-darwin-amd64"
      sha256 "70923c1f95682d154c3e910f7a5693f846b27f648cea9d82b74134c2df8f8204"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.8/vokt-linux-arm64"
      sha256 "2e5bcfb0d0c2988097f316dcaee20dd395f960cc5e4ea67474ae9d9b1b136d76"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.8/vokt-linux-amd64"
      sha256 "5e917f889307d81df8a3ca3a1ad75f11901914b66fc945fd1de648f4a1ddc76d"
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
