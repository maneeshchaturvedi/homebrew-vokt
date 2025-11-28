# Homebrew Formula for SpecFlow
# To install: brew install maneeshchaturvedi/specflow/specflow

class Specflow < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-specflow"
  version "1.0.0-alpha"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.0.0-alpha/specflow-darwin-arm64"
      sha256 "9565dfe2fc3eacd6791c80beddc38f9c97ed743bf2a4cc18ae1b8573ee16214b"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.0.0-alpha/specflow-darwin-amd64"
      sha256 "46dde16a65790a1ab2b17d82548bcceeb81aca93e85607549843b24b8ccb5dd3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.0.0-alpha/specflow-linux-arm64"
      sha256 "f4fb92d27ebece9abb17b6ef73f9e2723138350fb57ebbc2da8a47133b86ebb6"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v1.0.0-alpha/specflow-linux-amd64"
      sha256 "16be944f1a1a7ebdca42c32ebd96fff5e75906d4d5fa3f590fc3a34b49558cf2"
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
