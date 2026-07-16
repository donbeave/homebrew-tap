class JackinDev < Formula
  desc "Developer tooling for local jackin pull request verification"
  homepage "https://github.com/jackin-project/jackin"
  version "0.1.27"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.27/jackin-dev-0.1.27-aarch64-apple-darwin.tar.gz"
      sha256 "bf44aee04a35f055d9d0a0190767059614b7a46718dc26f307092f4381621a89"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.27/jackin-dev-0.1.27-x86_64-apple-darwin.tar.gz"
      sha256 "5b9ce9265d6fd85e89662b4683437c6f0e862d9d9bfde6bf04eebca98a603a9f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.27/jackin-dev-0.1.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df4d895879c61712512a571ed906054beedaf75d06d50dda4b8d0b4181a80d00"
    end
    on_intel do
      url "https://github.com/jackin-project/jackin/releases/download/jackin-dev-v0.1.27/jackin-dev-0.1.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb3786aa75c97aafd23b2758912b1b33e8469126f867293ce9759ad53e88015d"
    end
  end

  def install
    bin.install "jackin-dev"
  end

  test do
    system "#{bin}/jackin-dev", "--help"
  end
end
