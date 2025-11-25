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
      sha256 "87b6bd5212c7f349d3321281602ca935d3851956ecc78e33e1666aa6be1513c2"
    else
      url "https://devtools.stackshala.com/specflow/downloads/v0.1.0-alpha/specflow-darwin-amd64"
      sha256 "dbd3b5b55008dc33f89fb06f5cf1bd48aa9917bb70e2b258e4d5e1b45d30dca0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://devtools.stackshala.com/specflow/downloads/v0.1.0-alpha/specflow-linux-arm64"
      sha256 "dad3f175d110cf7327f21d0f173595df467f5835b3a624a0cca46ec82aaad900"
    else
      url "https://devtools.stackshala.com/specflow/downloads/v0.1.0-alpha/specflow-linux-amd64"
      sha256 "d66dd12e2e50e778058badca06d7035875b8f9cde4320a045f28d98e8c4a9668"
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
