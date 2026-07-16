class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.33"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.33/jackin-dev-0.1.33-aarch64-apple-darwin.tar.gz"
      sha256 "e255cc64fda769eb9a618b9de4f6388ebe7a0d479b8327eccc970d2898c00124"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.33/jackin-dev-0.1.33-x86_64-apple-darwin.tar.gz"
      sha256 "8d542f65e9d4064a693a0cbb70a679f6bbb9066e5a540811946172d8d2c02ea5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.33/jackin-dev-0.1.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d3f4b7174eef002a12f7a04a76c0628f1334b358f19955d2eb49a4476b39e70"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.33/jackin-dev-0.1.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b201b5df2e99e3e6db09dd5acfb38c84b275c65200c0f706ca039d047a2ad56"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
