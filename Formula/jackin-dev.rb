class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.19"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.19/jackin-dev-0.1.19-aarch64-apple-darwin.tar.gz"
      sha256 "f4d53b82c57fb0eeaeb236c473a34c9783d10692e48edbe9521efd170317afb2"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.19/jackin-dev-0.1.19-x86_64-apple-darwin.tar.gz"
      sha256 "937669b655399b6540b73e9baff0b20cb85ca0db82a9dca5f6b9fb56c0cbb7f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.19/jackin-dev-0.1.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "15a9a44d3ffa4b907dfd2323a1a1e7ff7bc970544c8ef9ed02dee4a7e696ec07"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.19/jackin-dev-0.1.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ca145d80a1228aff5b4fdaeabf3fa876f6978ca9ce3cecafc8399b3cfced53d"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
