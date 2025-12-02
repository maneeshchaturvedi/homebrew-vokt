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
      sha256 "42a32c915d79e95c0cbe69a1809966fa975ec1db270d5595500969fea5815d72"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.1.0-alpha/specflow-darwin-amd64"
      sha256 "bba3397d6aafc0e4dcba6a1ba96ba3e826ae612564faa866de77cf050bef4c1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.1.0-alpha/specflow-linux-arm64"
      sha256 "3aed8c74800f9e887c03647e9c8d64ace1e5d2bed5a0518c22d3e1bd914c29a3"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.1.0-alpha/specflow-linux-amd64"
      sha256 "fcb3253fb39d30f4fb66c33ae73bd132c95e03b17bdcdfd10f4a9e0196bffdf7"
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
