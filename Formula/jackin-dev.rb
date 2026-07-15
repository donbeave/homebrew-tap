class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.23"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.23/jackin-dev-0.1.23-aarch64-apple-darwin.tar.gz"
      sha256 "92cf40e13f284fdd242d26a037cc65312014321dc747090352c04c477898e341"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.23/jackin-dev-0.1.23-x86_64-apple-darwin.tar.gz"
      sha256 "f6b822b36595979fcaaf5060c2f58df318c8a79f2fd2cae45e62a3c3c25abb69"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.23/jackin-dev-0.1.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8efac7c8607c0a06c558fe904e51ceb6154c85cc2fbc2d1ac354a041feb089cb"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.23/jackin-dev-0.1.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "874a61e40013a2596754df2d3f954ef594bd3e196a77914e50e9ede072fd9162"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
