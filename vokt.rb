# Homebrew Formula for Vokt
# To install: brew install maneeshchaturvedi/vokt/vokt

class Vokt < Formula
  desc "Behavioral code analysis — call graphs, risk scores, blast radius"
  homepage "https://github.com/maneeshchaturvedi/homebrew-vokt"
  version "2.0.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.42/vokt-darwin-arm64"
      sha256 "bebc8dfc7473747896841946a47853c43c2c424a9c09088f7b74a21f374bd08b"

      resource "go-toolchain" do
        url "https://go.dev/dl/go1.25.0.darwin-arm64.tar.gz"
        sha256 "544932844156d8172f7a28f77f2ac9c15a23046698b6243f633b0a0b00c0749c"
      end
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.42/vokt-darwin-amd64"
      sha256 "c680f5e0a6a0fcb9d2c5431639c9fba5f738114ba3e297997980935547b39922"

      resource "go-toolchain" do
        url "https://go.dev/dl/go1.25.0.darwin-amd64.tar.gz"
        sha256 "5bd60e823037062c2307c71e8111809865116714d6f6b410597cf5075dfd80ef"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.42/vokt-linux-arm64"
      sha256 "d383d121518adf735dd3e3cd3fe80e73a64c4e7c3164035c295b4974f40d9fc7"

      resource "go-toolchain" do
        url "https://go.dev/dl/go1.25.0.linux-arm64.tar.gz"
        sha256 "05de75d6994a2783699815ee553bd5a9327d8b79991de36e38b66862782f54ae"
      end
    else
      url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.42/vokt-linux-amd64"
      sha256 "c2683f2b833c9f8de3fcd6d68c07cec2147ade97315e56f3356031adb493d369"

      resource "go-toolchain" do
        url "https://go.dev/dl/go1.25.0.linux-amd64.tar.gz"
        sha256 "2852af0cb20a13139b3448992e69b868e50ed0f8a1e5940ee1de9e19a123b613"
      end
    end
  end

  # Java engine (platform-independent) for Java/JVM analysis
  resource "java-engine" do
    url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.42/vokt-java-engine.jar"
  end

  # Tai-e runtime (LGPL, kept separate) — tarball of JARs
  resource "tai-e-deps" do
    url "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v2.0.42/tai-e-deps.tar.gz"
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

    resource("go-toolchain").stage do
      (lib/"vokt").install "go"
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
