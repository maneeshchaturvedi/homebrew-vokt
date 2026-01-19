# Homebrew Formula for SpecFlow
# To install: brew install maneeshchaturvedi/specflow/specflow

class Specflow < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-specflow"
  version "2.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.3/specflow-darwin-arm64"
      sha256 "bca229cd9e7cd7ab7c959e5e5677924a7b288d3fbabbaaa4376d05998bfa4d6e"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.3/specflow-darwin-amd64"
      sha256 "4e1f6d55a56988ee9ddced1fc65efe9885e45ecdbfee406ad2dcbe81f73826f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.3/specflow-linux-arm64"
      sha256 "92665791676ddce3f0e7fee79f86228ec0b95e2543b6d137fbdaf1cc4b6b5309"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.3/specflow-linux-amd64"
      sha256 "2a6d8c8c6d199914250b77f47911cee3e2928a6dc5d2b09467f7f5e75cdcd0c3"
    end
  end

  def install
    bin.install "specflow-darwin-arm64" => "specflow" if Hardware::CPU.arm? && OS.mac?
    bin.install "specflow-darwin-amd64" => "specflow" if Hardware::CPU.intel? && OS.mac?
    bin.install "specflow-linux-arm64" => "specflow" if Hardware::CPU.arm? && OS.linux?
    bin.install "specflow-linux-amd64" => "specflow" if Hardware::CPU.intel? && OS.linux?
  end

  test do
    assert_match "SpecFlow", shell_output("#{bin}/specflow --version")
  end
end
