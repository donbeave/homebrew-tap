class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.20"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.20/jackin-dev-0.1.20-aarch64-apple-darwin.tar.gz"
      sha256 "d49e961ebc759fc9d34b0b212537533b678836cebad2e580b4a6b578b7a77440"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.20/jackin-dev-0.1.20-x86_64-apple-darwin.tar.gz"
      sha256 "7d0312885502b3e63d22cdf91b7f67143bc70605cc8c84972ab26d0d53eae653"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.20/jackin-dev-0.1.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d5831e474ec97e74f135a59281a75ccd62a4b473f28e150e37331affa5fb62f0"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.20/jackin-dev-0.1.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d41a73c37a956568541a845dd507c08d36bf4ea27695f5f7a3d461045e4690f"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
