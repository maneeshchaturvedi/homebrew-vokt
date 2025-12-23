# Homebrew Formula for SpecFlow
# To install: brew install maneeshchaturvedi/specflow/specflow

class Specflow < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-specflow"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.0/specflow-darwin-arm64"
      sha256 "dbf1b945d7ec9d5ba4f71de0833f39925a76a61ef1a5cd6af067aba8ac9b6719"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.0/specflow-darwin-amd64"
      sha256 "ef10919c35c5edc92de1e8c91dd07ff116ed059007e30bf3add912a3218551c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.0/specflow-linux-arm64"
      sha256 "1934b9f5001e352d02e324aa97efd528015557a584513290e7e40f7cc6378745"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.0/specflow-linux-amd64"
      sha256 "e8bde783e4dba77350ec3d10b874a2154369f74f56db6c7de728e1e7fcfc790d"
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
