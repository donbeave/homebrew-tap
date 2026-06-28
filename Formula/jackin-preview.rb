# source-sha: 96e84a4b1be7b2ae9f6076231c2ef0ea1f7b9f2b
class JackinPreview < Formula
  desc "CLI for orchestrating autonomous AI coding agents in isolated sandboxed environments — reproducible, scoped, and fully under your control"
  homepage "https://github.com/jackin-project/jackin"
  version "0.6.0-preview.931+96e84a4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-aarch64-apple-darwin.tar.gz"
      sha256 "cc2c7410cc9c4b3adda62421549467259c40f9ec4efe935c71eeef5e67160dd4"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-x86_64-apple-darwin.tar.gz"
      sha256 "3f15528cf472ba31ebb43927d8a7f1464cc828c79611556b23ab77b61f452656"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "449c8ea4ea39236e26405c8d9b16a2ff164c2f1789bc991c9f6c82923fe68290"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a7af89b7f93b2321090a5ea0ee046a99c23df911906b4113fcb6d51a082671e1"
    end
  end

  resource "jackin-capsule-aarch64-unknown-linux-gnu" do
    url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-capsule-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a04b6b266bc1bafd791385828d7f297c8132e0521f71a5629866973a0e1b0930"
  end

  resource "jackin-capsule-x86_64-unknown-linux-gnu" do
    url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-capsule-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7c033dc29986e472319aefa9529a1ad93d8fe37ad70eb2328ba608e501858844"
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
    system "#{bin}/jackin", "--version"
  end
end
