class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.30"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.30/jackin-dev-0.1.30-aarch64-apple-darwin.tar.gz"
      sha256 "df66250c3356f2b4058928375f4c772e7866ac1b72b7fcffb8a3c8de41cedcea"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.30/jackin-dev-0.1.30-x86_64-apple-darwin.tar.gz"
      sha256 "e907ce96f16a3e3cf3833ed602a03580f5690131dfbfa5be2268b28ba5d46b13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.30/jackin-dev-0.1.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "03b289e09106d06988438521066249eba3a86ec7fce255fd7b1cb54757d30f79"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.30/jackin-dev-0.1.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f4117f916027a53e2e9d2bdde122ac21d46c2e6fdc882262257b95fef06e4ae"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
