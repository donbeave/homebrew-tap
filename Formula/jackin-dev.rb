class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.32"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.32/jackin-dev-0.1.32-aarch64-apple-darwin.tar.gz"
      sha256 "c9f0a6da2f6638e075e74498622bf41b7a145d933bb9b35c530d6c125a205264"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.32/jackin-dev-0.1.32-x86_64-apple-darwin.tar.gz"
      sha256 "b5750a2541b246d6f00b18ffe4424a3a0ef851d9288b7b766afbe3865ef2561d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.32/jackin-dev-0.1.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e37f9256b87a2d9b4f0d5db13016fa6ba7d0344992dbfb5ab92f0b9b6e897a2"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.32/jackin-dev-0.1.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "50025af998e0059fa739427c73bdaa3f1870155bbb0afcd092747cb1209539e6"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
