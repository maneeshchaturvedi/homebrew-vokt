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
      sha256 "2047a5bc13ded6697dea01155cb0ecb7d780fefa9ed939b53f969779a219ada2"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.1.0-alpha/specflow-darwin-amd64"
      sha256 "8a0dab43e5200012f34f1f32088d6768273406c93b0f18e417d85e2caa8428a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.1.0-alpha/specflow-linux-arm64"
      sha256 "465e2a6a3ece761e4833974b0dacd5510bfe0d38fd2695b409b8257da36d7314"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.1.0-alpha/specflow-linux-amd64"
      sha256 "a1d1272c76409299fd87228e7f94b46e785a4f3a4f5cf732e2fdebe9b6949c73"
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
