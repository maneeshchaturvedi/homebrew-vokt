# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.9/vokt-darwin-arm64"
      sha256 "33ee2457b93e395495469e232eb3e6cda650cace10442d5dd57d101473527a6b"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.9/vokt-darwin-amd64"
      sha256 "a33059a011f5f7016644c073a6f86bb90e23e000d6b8f3dd3bb0c5ce6887c80a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.9/vokt-linux-arm64"
      sha256 "6dbe7a595eaa0de290f863e3f5a85953393c82fc3e07d7949b55d3d9e14c2c95"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.9/vokt-linux-amd64"
      sha256 "bf548f04edd50058cf1a8baa53c514c3dd758a122e5208d1fe0ab89d67ee7982"
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
