class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.25"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.25/jackin-dev-0.1.25-aarch64-apple-darwin.tar.gz"
      sha256 "b21c500a655c1707abb9e93c91291b8249ee6c4fc949fe9cb9daa24c55c531cb"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.25/jackin-dev-0.1.25-x86_64-apple-darwin.tar.gz"
      sha256 "19e453ea1ab0e258cb811ad459df2c64b2b0b4e6bb169085fb1a5ea0176a9dfa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.25/jackin-dev-0.1.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "35fcc6da57047eba3e1a280885c6ac1b4a9915c65f8759a83d25ce7d7646eb9d"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.25/jackin-dev-0.1.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a6d55400287b714d047f9725e3d4f0b35697816c747933abbf799d21cff7c9d6"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
