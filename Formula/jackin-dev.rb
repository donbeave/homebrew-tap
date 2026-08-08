class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.38"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.38/jackin-dev-0.1.38-aarch64-apple-darwin.tar.gz"
      sha256 "d670c85eefcfe02ad11f350d0dfedd725066e193f423c2f62fbbef7a8d9f95de"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.38/jackin-dev-0.1.38-x86_64-apple-darwin.tar.gz"
      sha256 "eac3f6f3ab0ce9e685e6a6d50c0e7eac126a64bc24ec29ec897214dc8a7805f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.38/jackin-dev-0.1.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d8bc328fe729dfa9c1a7136efba1539959cfd2719ca3c7ce45dfef57cbae582"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.38/jackin-dev-0.1.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "adfc56b8b2b8f0504cb1be318de7c01acbd4f1a0cfbd0e9a44909bd89b43cc8a"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
