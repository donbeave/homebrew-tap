class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.26"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.26/jackin-dev-0.1.26-aarch64-apple-darwin.tar.gz"
      sha256 "a42882c2f8aa00b6ab7ee03cbbc225ecda6c200f1de05fb2389a9ac76ff9f704"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.26/jackin-dev-0.1.26-x86_64-apple-darwin.tar.gz"
      sha256 "20ec9941dbd5df9b6f025fc786d1a4ddde42df54f39c5796490a6e77b7cf956e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.26/jackin-dev-0.1.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5697f6e4d96d639b87fbaa4e50986f2ff2045dae86b3d1247ecbc80523531bca"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.26/jackin-dev-0.1.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d7a0452200f9acb8af871ea8119603fce2ce379816139f957cf199217cb1feb8"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
