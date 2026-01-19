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
      sha256 "225cb97aa943a2e13f1a9f34e7d400cefe6a4fee8b0519f07efd341f6ed080a4"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.0/specflow-darwin-amd64"
      sha256 "a14f8f80f4cbe09dbdfc4b86641ecda0dfbbcdd7d6ce45f68bfe81fc887faf7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.0/specflow-linux-arm64"
      sha256 "c194e067c12fc206fd6d3ae10e61963c68c4f81298a8607bf794b1d034c648c9"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v2.0.0/specflow-linux-amd64"
      sha256 "dab613f04bf82a9312c009bef1e72a964d7387e3ba282aa453704ffd64eccc1f"
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
