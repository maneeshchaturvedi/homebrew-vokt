# Homebrew Formula for SpecFlow
# To install: brew install maneeshchaturvedi/specflow/specflow

class Specflow < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-specflow"
  version "2.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.1/specflow-darwin-arm64"
      sha256 "460c3f51b1eb5923d0e603ed0282781e525afcd459d62d684471af4e3b32a115"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.1/specflow-darwin-amd64"
      sha256 "326881d49afe2af46501753eadf691af4e1d3cc5c7b6d1aecdf86419b356ef7d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.1/specflow-linux-arm64"
      sha256 "c0bf998f35769ca0be091586eeea093f84759d71457d9a21e614d5911b315827"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.1/specflow-linux-amd64"
      sha256 "d21d74448b221d4a62fe89fc781a778ebc2ef2f340aca95ea5c8796d63419242"
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
