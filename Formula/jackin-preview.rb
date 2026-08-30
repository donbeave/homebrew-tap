# source-sha: 552cce2e7ecae47eed72c49297882f50a6725171
class JackinPreview < Formula
  desc "CLI for orchestrating autonomous AI coding agents in isolated sandboxed environments — reproducible, scoped, and fully under your control"
  homepage "https://github.com/jackin-project/jackin"
  version "0.6.4-preview.1167+552cce2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-aarch64-apple-darwin.tar.gz"
      sha256 "5e964a14f8647bac57ce3aeda04e93b7ca8034a77f14ec8e1884ad6ff3e73f6b"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-x86_64-apple-darwin.tar.gz"
      sha256 "426ca1f2690b15592bb9f89e22763ef23ff72a8a6845dc68ca40fadffff09e1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f73d5152a1392e0b20ee2cc6161449b039191d2cb15429df85ba7b6e09ad6d1"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f0e99c510c4da694ad5fdeca79a346b390b05aefb5f28831893c425b4d66ebac"
    end
  end

  resource "jackin-capsule-aarch64-unknown-linux-gnu" do
    url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-capsule-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6f9f5567d08ad4640f5f6acb68f97fcedfa61a5443a57d37ce62f2f7f46cabcd"
  end

  resource "jackin-capsule-x86_64-unknown-linux-gnu" do
    url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-capsule-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1082419fc844227db22d9102d73bdcf4eaa0be02c72031bfc7237a8bd7b38798"
  end

  conflicts_with "jackin-project/tap/jackin", because: "preview and stable install the same binary"

  def install
    bin.install "jackin"
    bin.install "jackin-role"
    capsule_target = Hardware::CPU.arm? ? "aarch64-unknown-linux-gnu" : "x86_64-unknown-linux-gnu"
    capsule_arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    resource("jackin-capsule-#{capsule_target}").stage do
      capsule_dir = libexec/"jackin-capsule/linux-#{capsule_arch}"
      capsule_dir.install "jackin-capsule"
      chmod 0755, capsule_dir/"jackin-capsule"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jackin --version")
  end
end
