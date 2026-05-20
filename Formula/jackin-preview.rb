# source-sha: 1c623d10e9f7e9072db4bd8ef027d4c24cd95ab3
class JackinPreview < Formula
  desc "CLI for orchestrating autonomous AI coding agents in isolated sandboxed environments — reproducible, scoped, and fully under your control"
  homepage "https://github.com/jackin-project/jackin"
  version "0.6.0-preview.713+1c623d1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-preview-aarch64-apple-darwin.tar.gz"
      sha256 "c34e780ab9b6521d313396b903347f5a1fd7be2335821a33faa39f020689e0a5"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-preview-x86_64-apple-darwin.tar.gz"
      sha256 "54a8a633360521f3de4dae050d59f6da7413cb38e69481a53b505b82f89d2fce"
    end
  end

  conflicts_with "jackin-project/tap/jackin", because: "preview and stable install the same binary"

  def install
    bin.install "jackin"
    bin.install "jackin-role"
  end

  test do
    system "#{bin}/jackin", "--version"
  end
end
