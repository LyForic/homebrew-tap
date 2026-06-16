class Conductor < Formula
  desc "Open-source agent operations platform — auto-discovers and monitors your AI agents"
  homepage "https://runconductor.ai"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LyForic/conductor/releases/download/v0.1.1/conductor-darwin-arm64.tar.gz"
      sha256 "cc8acdfdab4531d390ea10194d43449ed5fd2fd5efa6daa7bf4933c0185e7b0c"
    else
      url "https://github.com/LyForic/conductor/releases/download/v0.1.1/conductor-darwin-amd64.tar.gz"
      sha256 "6c6676aef3466ad57d5a2615c485e992eb2068ee40d75492800656d822ad1854"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LyForic/conductor/releases/download/v0.1.1/conductor-linux-arm64.tar.gz"
      sha256 "6e6324487e0684a4e8ed66b110cded516b6ccff3e135ac2385cdf8812f6edbf8"
    else
      url "https://github.com/LyForic/conductor/releases/download/v0.1.1/conductor-linux-amd64.tar.gz"
      sha256 "f23dfb6f9c441fe4033c4d132671937e75587cfcda72460e44392c9087850090"
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
