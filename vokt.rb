# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.15/vokt-darwin-arm64"
      sha256 "6f2046960e453c627cc2eb1caaf0899876aed7acba99a0e32559ec08ab5ff9f6"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.15/vokt-darwin-amd64"
      sha256 "a9f6cccb9c5c8af551fb1a523a4aad98307a7df99d4fe5c673c27d9ea47782a6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.15/vokt-linux-arm64"
      sha256 "13082cb11a2ba907ea011c5677a421d6c39cb05d1d980aefaaea9c45b4048ab7"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.15/vokt-linux-amd64"
      sha256 "df703c238889aa5e64148926ffc963c7f0bc97f4273c6ba0312c9c242694bb6d"
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
