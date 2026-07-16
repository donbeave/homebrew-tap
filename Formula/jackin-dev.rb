class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.29"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.29/jackin-dev-0.1.29-aarch64-apple-darwin.tar.gz"
      sha256 "39cd0a70832322d16d2e754d1c01041b6c38228f15082cee39763bab4e4267ea"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.29/jackin-dev-0.1.29-x86_64-apple-darwin.tar.gz"
      sha256 "17a7194b892a5ffea8fd15bcaaf32a93b160774a4849788591b8a3b099fba5fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.29/jackin-dev-0.1.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4b2c7216981699b108aec160dce0a5972a6781a5e52154f5170132ed72277d44"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.29/jackin-dev-0.1.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "99a5f9ba60bf2f983261bf08dec2e51be61b124baa72cbc845eda2067930ef87"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
