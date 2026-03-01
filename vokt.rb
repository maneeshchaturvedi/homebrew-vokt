# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "AI-powered specification-driven development for legacy code"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.22/vokt-darwin-arm64"
      sha256 "5449c26dec6bd2b8c2b69d641a005aa3f8c4b56c0c45ea0ecf678292cfd965c6"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.22/vokt-darwin-amd64"
      sha256 "d361ba818bbd2a316774161ad83cb921a72375d5429a3300fbb34d723220b3e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.22/vokt-linux-arm64"
      sha256 "c958cc3066fac8334e7ee5954b496bc8adfff57d0902be6c61814b840141c045"
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.22/vokt-linux-amd64"
      sha256 "4a10276c4ddf6c75a3a35bd9f2c608bc936f122214545d5f6e2430e292d832db"
    end
  end

  def install
    bin.install "vokt-darwin-arm64" => "vokt" if Hardware::CPU.arm? && OS.mac?
    bin.install "vokt-darwin-amd64" => "vokt" if Hardware::CPU.intel? && OS.mac?
    bin.install "vokt-linux-arm64" => "vokt" if Hardware::CPU.arm? && OS.linux?
    bin.install "vokt-linux-amd64" => "vokt" if Hardware::CPU.intel? && OS.linux?
  end

  test do
    assert_match "Vokt", shell_output("#{bin}/vokt --version")
  end
end
