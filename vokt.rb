# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/specflow/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-specflow"
  version "2.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.6/vokt-darwin-arm64"
      sha256 "44c63e039d824be99a17cb7a683b4dd008ce8403e3756a443c72db05ee4715e6"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.6/vokt-darwin-amd64"
      sha256 "79eb8be988425a1a954f30debcd9f15eb883b9f7ac4f14e758c444fc469a6569"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.6/vokt-linux-arm64"
      sha256 "a152fdc57e12f602f5f053c90ab489ef1c7d62f8cb479ba842182449a05a59cd"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.6/vokt-linux-amd64"
      sha256 "6994728dc29dc54f738d9faf9923ddf0b01847a8299c582c2e06a2f2d1b861a1"
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
