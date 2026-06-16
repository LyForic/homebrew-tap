class Conductor < Formula
  desc "Open-source agent operations platform — auto-discovers and monitors your AI agents"
  homepage "https://runconductor.ai"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LyForic/conductor/releases/download/v0.1.1/conductor-darwin-arm64.tar.gz"
      sha256 "c0e0f1c52462dc02a7946416e9ab9ba82140c8e42d95ed2cef6b3003012d8b39"
    else
      url "https://github.com/LyForic/conductor/releases/download/v0.1.1/conductor-darwin-amd64.tar.gz"
      sha256 "eef7a900b4ae45725d4c2e480dc9a76135fd0e0886d30f9ee94e0d5325b608cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LyForic/conductor/releases/download/v0.1.1/conductor-linux-arm64.tar.gz"
      sha256 "3d759ac76e165c8f669aab5bcbf901e1303a05c565f709492525ec163248bc38"
    else
      url "https://github.com/LyForic/conductor/releases/download/v0.1.1/conductor-linux-amd64.tar.gz"
      sha256 "c67f34a0395538d30d66be32d8a2c97e52dff2a12df9540337347cd1dbb56efc"
    end
  end

  def install
    bin.install Dir["conductor*"].first => "conductor"
  end

  def caveats
    <<~EOS
      Start Conductor:
        conductor

      Dashboard: http://localhost:8080
      Configure AI provider in Settings > AI Provider.

      Docs: https://github.com/LyForic/conductor
    EOS
  end

  test do
    assert_match "conductor", shell_output("#{bin}/conductor --version")
  end
end
