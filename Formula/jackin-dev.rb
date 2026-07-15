class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.24"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.24/jackin-dev-0.1.24-aarch64-apple-darwin.tar.gz"
      sha256 "670548917221a43e9cc89827342c9e8e6bb467ab4d8419e26e368d100a0471f4"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.24/jackin-dev-0.1.24-x86_64-apple-darwin.tar.gz"
      sha256 "806f2a0b228ad76087222f1af9b5860de26d1218dd80718655e91e35a447f997"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.24/jackin-dev-0.1.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1327d3d9a07d859ab90c63eb70a13170a5444166bd70a7b22c024f4c97401d60"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.24/jackin-dev-0.1.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1578187af6e8eb1cd64de00d40448d6cefe1e8ebdc188968f32912f5c422dc2a"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
