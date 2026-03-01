# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.21/vokt-darwin-arm64"
      sha256 "2c55855ab76423514661a77db0c1153e4d51d23e30c59ff0ed101f51e96a92e8"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.21/vokt-darwin-amd64"
      sha256 "00cd06fdea096fc21f00921bef2359248394caecd8a5357fbd10c2ee94b49eab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.21/vokt-linux-arm64"
      sha256 "34935d534a77622afa1bbe6feeaeae7c825993b662185e6a9d328ebf00642a24"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.21/vokt-linux-amd64"
      sha256 "153a218fc65f65c17caea2010d9a9fb3346db35f3e972fbd2f4f3a770ccad117"
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
