class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.37"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.37/jackin-dev-0.1.37-aarch64-apple-darwin.tar.gz"
      sha256 "3b951a3561c0e2116d1c74bd38138c64a47f8e076cd47ed3e5206a973b805f97"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.37/jackin-dev-0.1.37-x86_64-apple-darwin.tar.gz"
      sha256 "8701b85cb75b2cb750094e7da2bab085ec74acbe42ba20a45aae1da425a5faee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.37/jackin-dev-0.1.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1618b775ef6a7258ca95a5793faebe87b2866b9f335a08148f49b1ccd6ddb130"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.37/jackin-dev-0.1.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9e43b737504a0fc85c8832afc3c26ee438f9614b32f4e7696cea9b5848cc6243"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
