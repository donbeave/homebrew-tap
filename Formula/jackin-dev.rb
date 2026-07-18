class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.34"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.34/jackin-dev-0.1.34-aarch64-apple-darwin.tar.gz"
      sha256 "7f6f28f161e5c53edd731077b11ef047f5ded7011835deb77b4576b494697529"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.34/jackin-dev-0.1.34-x86_64-apple-darwin.tar.gz"
      sha256 "5c9bdd7b6675de1f0e34d594556e9c2ae3e9ab2000857afbe9ec778c74b67c1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.34/jackin-dev-0.1.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d66eb8761f57dc66f7a2cb3913bdbb9b71ebc7fb8c08d59772b4841118ba83bd"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.34/jackin-dev-0.1.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cc27d07ef2e50fd22a8b6cb9ef1277fd239a48a5a76117d67fa81721c2820efe"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
