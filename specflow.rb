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
      sha256 "d5df7f2f1b568ae11b7ad1400f7a1cebefa3fe465ddc194abc14d3b2d8664ba2"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.0/specflow-darwin-amd64"
      sha256 "65cbec9f2251a4957be2c3b1ef3e9ebd7b86214821fb34bde730f1095b290afc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.0/specflow-linux-arm64"
      sha256 "90cd71dfcfbeb825b27c1143665a6b211774e84d2eae7700251aa582cf9d2ff6"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.0/specflow-linux-amd64"
      sha256 "363a86ad54530c51ad2705e21494e574c3fa7c0e4d6dcd81637fa561ebae816c"
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
