# source-sha: 3ed6b2eb57b07030b795135344330cacb369cfef
class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.0/jackin-dev-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "0f74adde14cc6308ed33c1f989473304c0cb802d36ebfc4b55d971a67941ca93"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.0/jackin-dev-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "6d207ba36ff1e218274bc708a166fddace2390bf68cae7ec71d0dd7df09a7426"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.0/jackin-dev-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0342e2b2f68064f6a38ab48da82bad6d32374813089d7038999558083f35f3aa"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.0/jackin-dev-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d01d075ad788f2e4ad52e05c2df2d7f6a5a82b98fd5602c0d18c0cc6d6e1bc22"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
