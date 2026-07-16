class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.28"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.28/jackin-dev-0.1.28-aarch64-apple-darwin.tar.gz"
      sha256 "31c8a65ab748afc1318aa2b617875e5ed408970f611b1c10fb9c89f451032cfb"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.28/jackin-dev-0.1.28-x86_64-apple-darwin.tar.gz"
      sha256 "23eaee5cec78f5aac8b33aeaf1182d7c3c1034a51fe319f573de36cbfd13745e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.28/jackin-dev-0.1.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57070ce01e89d37acead788c7e6cc7684b8c3c5196eabb92734eea015b0ac635"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.28/jackin-dev-0.1.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "49184338e5ad4e415c7a4db42ee8be991275534e91b8835b01c99bbfcff114d4"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
