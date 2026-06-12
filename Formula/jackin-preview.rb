# source-sha: c92ebd7bd0f645d193a6d2bae87a01e97e2c30ee
class JackinPreview < Formula
  desc "CLI for orchestrating autonomous AI coding agents in isolated sandboxed environments — reproducible, scoped, and fully under your control"
  homepage "https://github.com/jackin-project/jackin"
  version "0.6.0-preview.861+c92ebd7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-aarch64-apple-darwin.tar.gz"
      sha256 "14e08328e615df77dc7dd47f9e0eb651770cf1b1a5cf050a35e233f8017e29d0"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-x86_64-apple-darwin.tar.gz"
      sha256 "165b32cde0d42d8e322fec4e35f6fc450ee570bb8cedbc4662a02c59cc98c692"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "16284a1e08e89327c346c35232553d17f6bd41fdf9f4cd1091b95c308bac4dff"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "882ad42e43a7d1450b97a12dacd93d1cbc2e86774a56ea5cdd715386c2f69a2c"
    end
  end

  resource "jackin-capsule-aarch64-unknown-linux-gnu" do
    url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-capsule-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8585602dc695c4da100983bb16f4001b12d5c8416c644857cd43ab4e62c09756"
  end

  resource "jackin-capsule-x86_64-unknown-linux-gnu" do
    url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-capsule-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9a957c006e94525c572048e2ac265ace7d0ceab8ed0f43f562542d49f6c5a553"
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
