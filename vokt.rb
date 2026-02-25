# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.20/vokt-darwin-arm64"
      sha256 "6c7690314949125e8449b640e7e4dce7685f69bae36e36615d45d102f378b5e3"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.20/vokt-darwin-amd64"
      sha256 "13b63a2c2d693d1687add0ce79f26926421cc960a6993be4c363512329cea2b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.20/vokt-linux-arm64"
      sha256 "241fffa0be55da185b298962c31e7cf90b0b819687284ff84738b7d55b93d79b"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.20/vokt-linux-amd64"
      sha256 "8de725cc65e847132fd57d2fb2d17a8c6ca3ead91c76597d555ac9dec5ecf8a7"
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
