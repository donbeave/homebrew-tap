# source-sha: 9f7ea98693059f4d8b70c870465aca444dcf5d96
class JackinPreview < Formula
  desc "CLI for orchestrating autonomous AI coding agents in isolated sandboxed environments — reproducible, scoped, and fully under your control"
  homepage "https://github.com/jackin-project/jackin"
  version "0.6.0-preview.727+9f7ea98"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-preview-aarch64-apple-darwin.tar.gz"
      sha256 "1ffbfb5d7eba49bdd42a040db4f98e0e83cabe8403de27b7854525aea146fe56"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-preview-x86_64-apple-darwin.tar.gz"
      sha256 "5644b1fc8eacfd33196d8e24cf0151293ec185450c02bfab1cb9a8f1d3a1dfc7"
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
