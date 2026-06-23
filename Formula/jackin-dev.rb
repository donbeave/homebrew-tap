# source-sha: 6c8a08435a34e7142f298e47c0bc2130bb67f949
class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.1/jackin-dev-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "f2c184d571d64b47179167ba2532c39b92ebeca54380678dde04fcbc146cb102"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.1/jackin-dev-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "ba04c41e25533831e4e3dfe26483e6d193d59b7f8c76b72ba4d7eada6f9f524e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.1/jackin-dev-0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b25ad802c99d95bfdfb8f92b7e32fcd5b9947f170148b312f9d2ebfb026750b2"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.1/jackin-dev-0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2811c86f195f165dddb6eb6193401024bf46c7d9b5ffa17742ba211567b1a111"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
