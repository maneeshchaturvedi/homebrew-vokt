# Homebrew Formula for SpecFlow
# To install: brew install maneeshchaturvedi/specflow/specflow

class Specflow < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-specflow"
  version "2.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.5/specflow-darwin-arm64"
      sha256 "df91385df01d498dc84726a0ae1a00087059ea375433f55ef861da8f0d83f390"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.5/specflow-darwin-amd64"
      sha256 "69453b1e274e18ad4f65d3ee56e1fa8088cfcf16ab6c0c407138772d7cbb30bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.5/specflow-linux-arm64"
      sha256 "1687802abe1f1f676f5d016a269bd7c5e96ae0815674dafb4b6bba9314626bc9"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.5/specflow-linux-amd64"
      sha256 "996304d0e706ba5f6dd750e9efe28fd14a3d39b3639148ef198647e785aae8f0"
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
