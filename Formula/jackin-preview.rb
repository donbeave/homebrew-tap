# source-sha: b234e078eeeb2d0798b8ac75530cc24e2ba2e620
class JackinPreview < Formula
  desc "CLI for orchestrating autonomous AI coding agents in isolated sandboxed environments — reproducible, scoped, and fully under your control"
  homepage "https://github.com/jackin-project/jackin"
  version "0.6.0-preview.1065+b234e07"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-aarch64-apple-darwin.tar.gz"
      sha256 "0a91df9ea406829d84c6ab90e4672de1f823703b22eb1757f65985f9e088d7e0  jackin-aarch64-apple-darwin.tar.gz"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-x86_64-apple-darwin.tar.gz"
      sha256 "c72eda2aeea3f19f43c7693704ae403f0a62ebff4fdcc8af52db12cccd8f74e0  jackin-x86_64-apple-darwin.tar.gz"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5e4dcb0db036a776ac07cb887a30379e8c4b911c880f4ddc843c99de7b6e9812  jackin-aarch64-unknown-linux-gnu.tar.gz"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76d4c2496b790a8c86ed5b68b07dd481b1eb623f9b1b32d7f20a63abc1402bab  jackin-x86_64-unknown-linux-gnu.tar.gz"
    end
  end

  resource "jackin-capsule-aarch64-unknown-linux-gnu" do
    url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-capsule-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f66a08270e97d27c0193425d1aa204c148dd11ecc09901f16a6cf911cc011c00  jackin-capsule-aarch64-unknown-linux-gnu.tar.gz"
  end

  resource "jackin-capsule-x86_64-unknown-linux-gnu" do
    url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-capsule-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2f2590ad36d8b0db7b7392c2223f2d02cdca06628db1e3c41a81f7a07d41c856  jackin-capsule-x86_64-unknown-linux-gnu.tar.gz"
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
