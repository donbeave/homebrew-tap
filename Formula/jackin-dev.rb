class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.16"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.16/jackin-dev-0.1.16-aarch64-apple-darwin.tar.gz"
      sha256 "fc0ed663843a099443178ec878b472e71d1dd9be45e61fe5b7f75b06fe207d4b"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.16/jackin-dev-0.1.16-x86_64-apple-darwin.tar.gz"
      sha256 "8a7b2e2cdef2cedd8b56ab3e61a5c569c82f8aebbc2e00d6e874788dce6e8471"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.16/jackin-dev-0.1.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2167f0962bc703fe5181250b04b2fbd48a0d88f58a683f704957f233b8cd0220"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.16/jackin-dev-0.1.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "43b26cfe04b855ea6d609f61181ca89c25543cc5db7e932448eaa3fa9f2e26d3"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
