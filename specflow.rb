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
      sha256 "40d187e9e3cc389508eb73df4e415db3984eb74dc3872775c91e2c8a0dbccdd6"
    else
      url "https://devtools.stackshala.com/specflow/downloads/v0.1.0-alpha/specflow-darwin-amd64"
      sha256 "a9b54a50bf312e2e65ca3cd1c50bad54f0e8dbef3f20d54b14c1d0a2cd0b649d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://devtools.stackshala.com/specflow/downloads/v0.1.0-alpha/specflow-linux-arm64"
      sha256 "54defc2e08dace9045e70ffc1401197ffafb0ea7e60abb61d24fcf011fb4c21c"
    else
      url "https://devtools.stackshala.com/specflow/downloads/v0.1.0-alpha/specflow-linux-amd64"
      sha256 "c959bc7b1ef34cd1c69d8e0933276941c5f2c4840cb53b7d61a1028097aa79fa"
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
