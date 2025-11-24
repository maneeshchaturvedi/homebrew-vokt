# Homebrew Formula for SpecFlow
# To install: brew install maneeshchaturvedi/specflow/specflow

class Specflow < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://devtools.stackshala.com/specflow"
  version "0.1.0-alpha"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://devtools.stackshala.com/specflow/downloads/v0.1.0-alpha/specflow-darwin-arm64"
      sha256 "9d7b3ff10b9570b5decfd29b7e3bb09a66e32b20f58ffdcca86152b7e224986c"
    else
      url "https://devtools.stackshala.com/specflow/downloads/v0.1.0-alpha/specflow-darwin-amd64"
      sha256 "b87147471ebb0b5ad5e61a9885dea8541fef6417a20d7a2837446fbf66bb444b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://devtools.stackshala.com/specflow/downloads/v0.1.0-alpha/specflow-linux-arm64"
      sha256 "b81b98a9966fcec3f73d17cb079649b747bb266d12da1912b50d2e499e365a33"
    else
      url "https://devtools.stackshala.com/specflow/downloads/v0.1.0-alpha/specflow-linux-amd64"
      sha256 "adb6432af1473f4b493ea21d2a95d8ab5caf7b7ba2d169a9c353b638ffb4ade5"
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
