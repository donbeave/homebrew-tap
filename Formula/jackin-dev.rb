class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.31"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.31/jackin-dev-0.1.31-aarch64-apple-darwin.tar.gz"
      sha256 "b59f33145c05b9d8c31bf87fec7a4513b5398ff1e8da3e1db0398e691631d2f5"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.31/jackin-dev-0.1.31-x86_64-apple-darwin.tar.gz"
      sha256 "301f8c4ffecad5300be5d36c48b9d8f89e18fbe5c138ec0ff7357035e96ce5c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.31/jackin-dev-0.1.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa85fb10d77a5140170c231e0dfeb004f379a18fcd5a2975bec9d66679575746"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.31/jackin-dev-0.1.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0115b732a5b8d4def1d93a2d84a765606c59d9b7ac2879c0262ac02eda4a30c3"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
