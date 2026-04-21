# Homebrew Formula for Vokt
# To install: brew install voktlabs/vokt/vokt

class Vokt < Formula
  desc "Behavioral code analysis — call graphs, risk scores, blast radius"
  homepage "https://github.com/voktlabs/homebrew-vokt"
  version "2.0.61"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/voktlabs/homebrew-vokt/releases/download/v2.0.61/vokt-darwin-arm64"
      sha256 "e68371ba956f2a9566a023cdb09c4ace40ea93e6c96acdacad6251a3636c3feb"

      resource "go-toolchain" do
        url "https://go.dev/dl/go1.26.2.darwin-arm64.tar.gz"
        sha256 "32af1522bf3e3ff3975864780a429cc0b41d190ec7bf90faa661d6d64566e7af"
      end
    else
      url "https://github.com/voktlabs/homebrew-vokt/releases/download/v2.0.61/vokt-darwin-amd64"
      sha256 "77ca9776068f00f1bf309b97e674aef3d5e860ae11a3b08f4e88e3c643fc4771"

      resource "go-toolchain" do
        url "https://go.dev/dl/go1.26.2.darwin-amd64.tar.gz"
        sha256 "bc3f1500d9968c36d705442d90ba91addf9271665033748b82532682e90a7966"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/voktlabs/homebrew-vokt/releases/download/v2.0.61/vokt-linux-arm64"
      sha256 "9b3301d7ab7cc46e66a0ba7dc93806ddb24afa930b1837fa763d1ff931d0b962"

      resource "go-toolchain" do
        url "https://go.dev/dl/go1.26.2.linux-arm64.tar.gz"
        sha256 "c958a1fe1b361391db163a485e21f5f228142d6f8b584f6bef89b26f66dc5b23"
      end
    else
      url "https://github.com/voktlabs/homebrew-vokt/releases/download/v2.0.61/vokt-linux-amd64"
      sha256 "b24a667684574a669ed34230cdbe0503299171b4460604e9b5a8079105390ac6"

      resource "go-toolchain" do
        url "https://go.dev/dl/go1.26.2.linux-amd64.tar.gz"
        sha256 "990e6b4bbba816dc3ee129eaeaf4b42f17c2800b88a2166c265ac1a200262282"
      end
    end
  end

  # Java engine (platform-independent) for Java/JVM analysis
  resource "java-engine" do
    url "https://github.com/voktlabs/homebrew-vokt/releases/download/v2.0.61/vokt-java-engine.jar"
  end

  # Tai-e runtime (LGPL, kept separate) — tarball of JARs
  resource "tai-e-deps" do
    url "https://github.com/voktlabs/homebrew-vokt/releases/download/v2.0.61/tai-e-deps.tar.gz"
  end

  def install
    bin.install "vokt-darwin-arm64" => "vokt" if Hardware::CPU.arm? && OS.mac?
    bin.install "vokt-darwin-amd64" => "vokt" if Hardware::CPU.intel? && OS.mac?
    bin.install "vokt-linux-arm64" => "vokt" if Hardware::CPU.arm? && OS.linux?
    bin.install "vokt-linux-amd64" => "vokt" if Hardware::CPU.intel? && OS.linux?

    resource("java-engine").stage { bin.install "vokt-java-engine.jar" }

    (bin/"tai-e").mkpath
    resource("tai-e-deps").stage do
      (bin/"tai-e").install Dir["*.jar"]
    end

    # Go tarball extracts as go/ — Homebrew strips the single top-level dir,
    # so staging contains bin/, src/, pkg/ directly. Install into lib/vokt/go/.
    (lib/"vokt/go").mkpath
    resource("go-toolchain").stage do
      (lib/"vokt/go").install Dir["*"]
    end
  end

  def caveats
    <<~EOS
      vokt bundles its own Go toolchain — you do not need Go installed to
      analyze Go projects. If a project requires a newer Go version, vokt
      will auto-download it on first use (via GOTOOLCHAIN=auto).

      Java analysis requires Java 17+. Set JAVA_HOME if java is not in PATH.
    EOS
  end

  test do
    assert_match "vokt", shell_output("#{bin}/vokt --version")
    assert_predicate lib/"vokt/go/bin/go", :executable?
  end
end
