# source-sha: b7704b2120498520405d20dc4398cda10ed3a16b
class JackinPreview < Formula
  desc "CLI for orchestrating autonomous AI coding agents in isolated sandboxed environments — reproducible, scoped, and fully under your control"
  homepage "https://github.com/jackin-project/jackin"
  version "0.6.4-preview.1163+b7704b2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-aarch64-apple-darwin.tar.gz"
      sha256 "15af960b114a61caeef32be9daee0414e13bb2a0efad0a20a000b3d40c8fb0cf"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-x86_64-apple-darwin.tar.gz"
      sha256 "76e2c7f5ffccaaa6f0b3a3956f2160b76f944b40cb329e5737884cb61abf8adc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "000859027699cf3f1fa0493866586102436f6656e8f4135435e951d3432e840e"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d82ee93aa28f85a0fb32445eaded06e7c513e01c1fcdb30fa9b6f5de1f37ffc2"
    end
  end

  resource "jackin-capsule-aarch64-unknown-linux-gnu" do
    url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-capsule-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fdec3d4b3649377959f3623a7b24b300927891d7ddbaa81ab788c97fd07c087b"
  end

  resource "jackin-capsule-x86_64-unknown-linux-gnu" do
    url "https://github.com/jackin-project/jackin/releases/download/preview/jackin-capsule-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c81a8b952a813099c050d0e237c0498562e6c14b7faa6895d20d98b1a796dada"
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
