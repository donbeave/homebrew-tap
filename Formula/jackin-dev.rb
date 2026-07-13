class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.22"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.22/jackin-dev-0.1.22-aarch64-apple-darwin.tar.gz"
      sha256 "b95baad49bd023ad3ab95cb9a707384d46956baa3cc55f6492f6f533a33148c3"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.22/jackin-dev-0.1.22-x86_64-apple-darwin.tar.gz"
      sha256 "f4c30cdcfbbff327049bd56aeca14375950d9b1619877af8122ace5355ade2a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.22/jackin-dev-0.1.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc7190f87316887901e49dc348ff68933b6472cd52f47bb14a496fd18923c8b9"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.22/jackin-dev-0.1.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ac93c860036f6334c3311b3433cc896d494d6cb2680d6f7813e6692510b1cb3"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
