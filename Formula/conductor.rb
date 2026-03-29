class Conductor < Formula
  desc "Open-source agent operations platform — auto-discovers and monitors your AI agents"
  homepage "https://runconductor.ai"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LyForic/conductor/releases/download/v0.1.0/conductor-darwin-arm64.tar.gz"
      sha256 "a292e9c23b16971c64bc0b56b7ca9e7c389f78b2442387c8ddca21233f610c53"
    else
      url "https://github.com/LyForic/conductor/releases/download/v0.1.0/conductor-darwin-amd64.tar.gz"
      sha256 "225dc666d5d9f5fbe4d6ee069e4281f034cafab531e5a6d8710840554e632c8b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LyForic/conductor/releases/download/v0.1.0/conductor-linux-arm64.tar.gz"
      sha256 "741cfbb3caa81bd6222f8d170523710be3e774e65b55498f8de4f0cadb10afac"
    else
      url "https://github.com/LyForic/conductor/releases/download/v0.1.0/conductor-linux-amd64.tar.gz"
      sha256 "d68ec65cd4e052328e65ee847e3ab4f160ef12cf6fd470e94b481b12df7bfa61"
    end
  end

  def install
    bin.install "conductor"
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
