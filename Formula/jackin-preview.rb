# source-sha: 73f61751ebdbf7721bc59a69ac136581bac4dda8
class JackinPreview < Formula
  desc "CLI for orchestrating autonomous AI coding agents in isolated sandboxed environments — reproducible, scoped, and fully under your control"
  homepage "https://github.com/jackin-project/jackin"
  version "0.6.0-preview.732+73f6175"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-preview-aarch64-apple-darwin.tar.gz"
      sha256 "878f08a1f4668b2b4e95d704fd6ee921b8300f4699e82d1ef4dbd271d36e32ac"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-preview-x86_64-apple-darwin.tar.gz"
      sha256 "a986447fc55f37d7569af26fd92c76731a43b7851307ee7feb9b6fac37830430"
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
