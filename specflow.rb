# Homebrew Formula for SpecFlow
# To install: brew install maneeshchaturvedi/specflow/specflow

class Specflow < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-specflow"
  version "1.1.0-alpha"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.1.0-alpha/specflow-darwin-arm64"
      sha256 "686c9e2ac9065bc7e05a3d49dfc8cd3c721dba90c23f55870a2a8158c048e2e5"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.1.0-alpha/specflow-darwin-amd64"
      sha256 "0457caa8de568cf4e9bc2a833487fe9020ed122c3c4766e96343f17b39f4979e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.1.0-alpha/specflow-linux-arm64"
      sha256 "3a24c8e69b5f3e3eda9228c3495abb3405cae06f5548623cabf9f6358c2cf1ba"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.1.0-alpha/specflow-linux-amd64"
      sha256 "50ba8b1aa2de559173b854c53b35846535b95962fe65ef7f0e974ebe69081c0b"
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
