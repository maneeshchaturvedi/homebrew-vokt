# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.13/vokt-darwin-arm64"
      sha256 "8266e5feba094d8b03eaa1b21b78e7305cfab6d89baf6101057543ab1e68496d"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.13/vokt-darwin-amd64"
      sha256 "de91e1ce6ae4cf687f3f96682dd5f4281834d47b18ab704da6daeab103ba0f9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.13/vokt-linux-arm64"
      sha256 "0ef259597658cdf09c1b4bc22f6f5a3e34f7e240f29391f5aa1f48dfebb29e3b"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.13/vokt-linux-amd64"
      sha256 "c1918de6a933095ed29aec95c0bec7c1c9f0bfdd060df72c1ad4913b5c7c88db"
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
