class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.21"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.21/jackin-dev-0.1.21-aarch64-apple-darwin.tar.gz"
      sha256 "7ced140d7a37e828e347ff8fea048f6f2e054104ffda198c58edcfef47d3dbab"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.21/jackin-dev-0.1.21-x86_64-apple-darwin.tar.gz"
      sha256 "7442f84fc672751944c4a2cda0570fc19d8bf110460c2e4854f5ecd1a9d5fa86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.21/jackin-dev-0.1.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "09e5fafc46a2b13671eb2674cbe40e6110bd3c22b50a23bcf501f7f0ff141cac"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.21/jackin-dev-0.1.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3811b0cb7624323b77070481a5681d620f7f29a28d9fabee41fc2a098fc5a06a"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
