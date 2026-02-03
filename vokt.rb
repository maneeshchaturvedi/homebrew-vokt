# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.16/vokt-darwin-arm64"
      sha256 "cca81fcc07043c3080419a9484c3c1a768c2edf92c6fe038194f5654753d811c"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.16/vokt-darwin-amd64"
      sha256 "ba0268e813bee782da48df368335a0aff07deca3f696566bd19e8008c975b778"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.16/vokt-linux-arm64"
      sha256 "f826f61e2398f5bb7494e34e617c5e1b2a10748ef77fba7dac533566e5365402"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.16/vokt-linux-amd64"
      sha256 "7f0e66d46124ccfe9615f1cfd9e7e0ad585553a8283b25ccc6f2a3f31de86fa1"
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
