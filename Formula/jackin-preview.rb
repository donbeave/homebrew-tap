# source-sha: 1b560db8ad3ec375aa16f606796da1be8efb65ec
class JackinPreview < Formula
  desc "CLI for orchestrating autonomous AI coding agents in isolated sandboxed environments — reproducible, scoped, and fully under your control"
  homepage "https://github.com/jackin-project/jackin"
  version "0.6.0-preview.714+1b560db"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-preview-aarch64-apple-darwin.tar.gz"
      sha256 "59e6f5e3cbaa4aa8469db770f4bf851d85617e75e385e1794e8397dd73c57380"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-preview-x86_64-apple-darwin.tar.gz"
      sha256 "199669ad9f989f0ec0552988c0e973ac72f8edc787ee101d39699be85f754848"
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
